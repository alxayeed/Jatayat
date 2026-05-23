import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/usecase_providers.dart'; // Assume you added the new use case here
import '../../domain/entities/bus_route/bus_route.dart';
import '../../domain/usecases/get_all_routes.dart';
import '../../domain/usecases/get_route_details.dart'; // Import the new use case

// --- 1. The Master List Provider (Unchanged, it's already great) ---
final routeExplorerProvider = AsyncNotifierProvider<RouteExplorerNotifier, List<BusRoute>>(() {
  return RouteExplorerNotifier();
});

class RouteExplorerNotifier extends AsyncNotifier<List<BusRoute>> {
  late final GetAllRoutesUseCase _getAllRoutes;
// Kept in case you want server-search later

  // We keep a full list in memory for instant local filtering
  List<BusRoute> _allRoutesCache = [];

  @override
  FutureOr<List<BusRoute>> build() async {
    _getAllRoutes = ref.watch(getAllRoutesUseCaseProvider);
    return _fetchInitialRoutes();
  }

  Future<List<BusRoute>> _fetchInitialRoutes() async {
    final result = await _getAllRoutes();
    return result.fold(
          (failure) => throw failure.message,
          (routes) {
        _allRoutesCache = routes;
        return routes;
      },
    );
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = AsyncData(_allRoutesCache);
      return;
    }
    final filtered = _allRoutesCache.where((route) {
      final codeMatch = route.routeCode.toLowerCase().contains(query.toLowerCase());
      final nameMatch = route.nameBn.contains(query);
      return codeMatch || nameMatch;
    }).toList();
    state = AsyncData(filtered);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchInitialRoutes());
  }
}

// --- 2. NEW: The Detail Provider (Lazy Loading via Family) ---
// We use autoDispose so it clears memory when the user closes the detail screen,
// but you can remove autoDispose if you want it to cache the stops permanently during the session.

final routeDetailsProvider = FutureProvider.autoDispose.family<BusRoute, String>((ref, routeId) async {
  // 1. Try fetching from the local SQLite cache first for offline-first support
  try {
    final getCachedRoute = ref.watch(getCachedRouteUseCaseProvider);
    final cachedRoute = await getCachedRoute(routeId);
    if (cachedRoute != null) {
      return cachedRoute;
    }
  } catch (_) {
    // Fail silently and proceed to remote fetch
  }

  // 2. Fetch from Supabase backend as fallback
  final getRouteDetails = ref.watch(getRouteDetailsUseCaseProvider);
  final result = await getRouteDetails(GetRouteDetailsParams(routeId: routeId));

  return result.fold(
    (failure) => throw Exception(failure.message),
    (detailedRoute) => detailedRoute,
  );
});
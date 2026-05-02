import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/usecase_providers.dart';
import '../../domain/entities/bus_route/bus_route.dart';
import '../../domain/usecases/get_all_routes.dart';
import '../../domain/usecases/search_routes_use_case.dart';

final routeExplorerProvider = AsyncNotifierProvider<RouteExplorerNotifier, List<BusRoute>>(() {
  return RouteExplorerNotifier();
});

class RouteExplorerNotifier extends AsyncNotifier<List<BusRoute>> {
  late final GetAllRoutesUseCase _getAllRoutes;
  late final SearchRoutesUseCase _searchRoutes;

  // We keep a full list in memory for instant local filtering
  List<BusRoute> _allRoutesCache = [];

  @override
  FutureOr<List<BusRoute>> build() async {
    // Initialize UseCases from ref
    _getAllRoutes = ref.watch(getAllRoutesUseCaseProvider);
    _searchRoutes = ref.watch(searchRoutesUseCaseProvider);

    return _fetchInitialRoutes();
  }

  /// Initial data fetch from Supabase
  Future<List<BusRoute>> _fetchInitialRoutes() async {
    // This automatically sets state to AsyncLoading
    final result = await _getAllRoutes();

    return result.fold(
          (failure) => throw failure.message, // Caught by AsyncValue.error
          (routes) {
        _allRoutesCache = routes;
        return routes; // Becomes AsyncData(routes)
      },
    );
  }

  /// Search logic
  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = AsyncData(_allRoutesCache);
      return;
    }

    // Optional: Use local filtering for instant UI response
    // or call the _searchRoutes use case for server-side search
    final filtered = _allRoutesCache.where((route) {
      final codeMatch = route.routeCode.toLowerCase().contains(query.toLowerCase());
      final nameMatch = route.nameBn.contains(query);
      return codeMatch || nameMatch;
    }).toList();

    state = AsyncData(filtered);
  }

  /// Refresh data manually (e.g. Pull to refresh)
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchInitialRoutes());
  }
}
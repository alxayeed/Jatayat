import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/route_explorer/domain/usecases/get_all_routes.dart';
import '../../features/route_explorer/domain/usecases/get_route_details.dart';
import '../../features/route_explorer/domain/usecases/search_routes_use_case.dart';
import 'repository_providers.dart';

import '../../features/fare_finder/domain/usecases/search_stops_usecase.dart';
import '../../features/fare_finder/domain/usecases/get_connected_stops_usecase.dart';
import '../../features/fare_finder/domain/usecases/get_fares_usecase.dart';



// ==========================================
// FEATURE: FARE FINDER
// ==========================================

final searchStopsUseCaseProvider = Provider<SearchStopsUseCase>((ref) {
  final repository = ref.watch(fareRepositoryProvider);
  return SearchStopsUseCase(repository);
});

final getConnectedStopsUseCaseProvider = Provider<GetConnectedStopsUseCase>((ref) {
  final repository = ref.watch(fareRepositoryProvider);
  return GetConnectedStopsUseCase(repository);
});

final getFaresUseCaseProvider = Provider<GetFaresUseCase>((ref) {
  final repository = ref.watch(fareRepositoryProvider);
  return GetFaresUseCase(repository);
});

// ==========================================
// FEATURE: ROUTE EXPLORER
// ==========================================

final getAllRoutesUseCaseProvider = Provider<GetAllRoutesUseCase>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return GetAllRoutesUseCase(repository);
});

final searchRoutesUseCaseProvider = Provider<SearchRoutesUseCase>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return SearchRoutesUseCase(repository);
});

final getRouteDetailsUseCaseProvider = Provider<GetRouteDetails>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return GetRouteDetails(repository);
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'repository_providers.dart';

// Imports for Fare Finder Use Cases
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
// FEATURE: ROUTE EXPLORER (Coming Soon)
// ==========================================
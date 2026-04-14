import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/usecase_providers.dart';
import '../states/fare_search_state.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

final fareSearchProvider = StateNotifierProvider<FareSearchNotifier, FareSearchState>((ref) {
  return FareSearchNotifier(
    searchStops: ref.watch(searchStopsUseCaseProvider),
    getConnectedStops: ref.watch(getConnectedStopsUseCaseProvider),
    getFares: ref.watch(getFaresUseCaseProvider),
  );
});

class FareSearchNotifier extends StateNotifier<FareSearchState> {
  final dynamic _searchStops;
  final dynamic _getConnectedStops;
  final dynamic _getFares;

  FareSearchNotifier({
    required dynamic searchStops,
    required dynamic getConnectedStops,
    required dynamic getFares,
  })  : _searchStops = searchStops,
        _getConnectedStops = getConnectedStops,
        _getFares = getFares,
        super(const FareSearchState());

  /// 1. Handle Search Suggestions for Origin
  Future<void> searchOrigin(String query) async {
    if (query.length < 2) {
      state = state.copyWith(originSuggestions: []);
      return;
    }

    final result = await _searchStops(query);

    result.fold(
          (failure) => state = state.copyWith(errorMessage: failure.message),
          (stops) => state = state.copyWith(originSuggestions: stops, errorMessage: null),
    );
  }

  /// 2. Select Origin and Fetch Connected Destinations
  Future<void> selectOrigin(StopEntity stop) async {
    // Update state to selected stop and clear previous results/destinations
    state = state.copyWith(
      selectedOrigin: stop,
      selectedDestination: null,
      originSuggestions: [],
      fareResults: [],
      isLoading: true,
      errorMessage: null,
    );

    final result = await _getConnectedStops(stop.id);

    result.fold(
          (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
          (destinations) => state = state.copyWith(
        isLoading: false,
        destinationSuggestions: destinations,
      ),
    );
  }

  /// 3. Select Destination and Fetch Final Fares
  Future<void> selectDestination(StopEntity stop) async {
    state = state.copyWith(
      selectedDestination: stop,
      isLoading: true,
      errorMessage: null,
    );

    final result = await _getFares(
      originId: state.selectedOrigin!.id,
      destinationId: stop.id,
    );

    result.fold(
          (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
          (fares) => state = state.copyWith(isLoading: false, fareResults: fares),
    );
  }

  /// Clear everything to start over
  void resetSearch() {
    state = const FareSearchState();
  }
}
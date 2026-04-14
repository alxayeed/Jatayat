import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/usecase_providers.dart';
import '../../domain/usecases/get_connected_stops_usecase.dart';
import '../../domain/usecases/get_fares_usecase.dart';
import '../../domain/usecases/search_stops_usecase.dart';
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
  final SearchStopsUseCase _searchStops;
  final GetConnectedStopsUseCase _getConnectedStops;
  final GetFaresUseCase _getFares;

  // Cache to make destination searching instant and avoid unnecessary API calls
  List<StopEntity> _connectedStopsCache = [];

  FareSearchNotifier({
    required SearchStopsUseCase searchStops,
    required GetConnectedStopsUseCase getConnectedStops,
    required GetFaresUseCase getFares,
  })  : _searchStops = searchStops,
        _getConnectedStops = getConnectedStops,
        _getFares = getFares,
        super(const FareSearchState());

  /// 1. Handle Search Suggestions for Origin (API Call)
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
      destinationSuggestions: [],
      fareResults: [],
      isLoading: true,
      errorMessage: null,
    );

    final result = await _getConnectedStops(stop.id);

    result.fold(
          (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
          (destinations) {
        _connectedStopsCache = destinations; // Save to cache
        state = state.copyWith(
          isLoading: false,
          destinationSuggestions: destinations,
        );
      },
    );
  }

  /// 3. Search Destination (Instant Local Filter)
  void searchDestination(String query) {
    if (state.selectedOrigin == null) return;

    if (query.isEmpty) {
      state = state.copyWith(destinationSuggestions: _connectedStopsCache);
      return;
    }

    // Filter the cached connected stops based on the user's typing
    final filtered = _connectedStopsCache.where((stop) {
      return stop.nameBn.contains(query) ;
    }).toList();

    state = state.copyWith(destinationSuggestions: filtered);
  }

  /// 4. Select Destination (No longer calculates automatically)
  void selectDestination(StopEntity stop) {
    state = state.copyWith(
      selectedDestination: stop,
      destinationSuggestions: [], // Hide the overlay
      errorMessage: null,
    );
  }

  /// 5. Swap Origin and Destination
  void swapStations() {
    final currentOrigin = state.selectedOrigin;
    final currentDestination = state.selectedDestination;

    // We only swap if there is at least an origin to swap with
    if (currentOrigin == null) return;

    state = state.copyWith(
      selectedOrigin: currentDestination,
      selectedDestination: currentOrigin,
      originSuggestions: [],
      destinationSuggestions: [],
      fareResults: [], // Clear results on swap to prevent invalid data
    );

    // Refresh connected stops for the new origin
    if (currentDestination != null) {
      selectOrigin(currentDestination);
    }
  }

  /// 6. Trigger Final API Call (Called by the Calculate Button)
  Future<void> calculateFare() async {
    if (state.selectedOrigin == null || state.selectedDestination == null) {
      state = state.copyWith(errorMessage: "Please select both Origin and Destination");
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _getFares(
      originId: state.selectedOrigin!.id,
      destinationId: state.selectedDestination!.id,
    );

    result.fold(
          (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
          (fares) => state = state.copyWith(isLoading: false, fareResults: fares),
    );
  }

  /// Clear everything to start over
  void resetSearch() {
    _connectedStopsCache = [];
    state = const FareSearchState();
  }
}
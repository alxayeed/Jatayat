import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jatra/core/constants/app_strings.dart';
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

  List<StopEntity> _connectedStopsCache = [];

  FareSearchNotifier({
    required SearchStopsUseCase searchStops,
    required GetConnectedStopsUseCase getConnectedStops,
    required GetFaresUseCase getFares,
  })  : _searchStops = searchStops,
        _getConnectedStops = getConnectedStops,
        _getFares = getFares,
        super(const FareSearchState());

  Future<void> searchOrigin(String query) async {
    // UX FIX 1: If the user types in the Origin box, invalidate the current selections.
    // They are changing the starting point, so the destination and fares are no longer valid.
    if (state.selectedOrigin != null) {
      _connectedStopsCache = [];

      // *Note: This assumes your FareSearchState.copyWith supports setting fields to null.
      // (If you are using Freezed, it handles this automatically).
      state = state.copyWith(
        selectedOrigin: null,
        selectedDestination: null,
        destinationSuggestions: [],
        fareResults: [],
        errorMessage: null,
      );
    }

    if (query.length < 2) {
      state = state.copyWith(originSuggestions: []);
      return;
    }

    final result = await _searchStops(query);

    result.fold(
          (failure) => state = state.copyWith(errorMessage: failure.message),
          (stops) {
        final sortedOrigins = List<StopEntity>.from(stops)
          ..sort((a, b) => a.nameBn.compareTo(b.nameBn));

        state = state.copyWith(originSuggestions: sortedOrigins, errorMessage: null);
      },
    );
  }

  Future<void> selectOrigin(StopEntity stop) async {
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
        if (destinations.isEmpty) {
          state = state.copyWith(
              isLoading: false,
              errorMessage: AppStrings.stopsSearchErrorMessage
          );
        } else {
          final sortedDestinations = List<StopEntity>.from(destinations)
            ..sort((a, b) => a.nameBn.compareTo(b.nameBn));

          _connectedStopsCache = sortedDestinations;
          state = state.copyWith(
            isLoading: false,
            destinationSuggestions: sortedDestinations,
          );
        }
      },
    );
  }

  void searchDestination(String query) {
    if (state.selectedOrigin == null) return;

    final cleanQuery = query.trim().toLowerCase();

    if (cleanQuery.isEmpty) {
      state = state.copyWith(destinationSuggestions: _connectedStopsCache);
      return;
    }

    final filtered = _connectedStopsCache.where((stop) {
      final nameBnMatch = stop.nameBn.contains(cleanQuery);
      final nameEnMatch = stop.nameEn?.toLowerCase().contains(cleanQuery) ?? false;
      return nameBnMatch || nameEnMatch;
    }).toList();

    state = state.copyWith(destinationSuggestions: filtered);
  }

  void selectDestination(StopEntity stop) {
    state = state.copyWith(
      selectedDestination: stop,
      destinationSuggestions: [],
      errorMessage: null,
    );
  }

  // UX FIX 2: Re-wrote swapStations so it doesn't accidentally delete the destination.
  Future<void> swapStations() async {
    final oldOrigin = state.selectedOrigin;
    final oldDestination = state.selectedDestination;

    // We can only swap if both are selected
    if (oldOrigin == null || oldDestination == null) return;

    // 1. Swap the selections in state and trigger loading, BUT keep both selected
    state = state.copyWith(
      selectedOrigin: oldDestination,
      selectedDestination: oldOrigin,
      originSuggestions: [],
      destinationSuggestions: [],
      fareResults: [],
      isLoading: true,
    );

    // 2. Fetch the new connected stops for the NEW origin (which was the old destination)
    final result = await _getConnectedStops(oldDestination.id);

    result.fold(
          (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
          (destinations) {
        final sortedDestinations = List<StopEntity>.from(destinations)
          ..sort((a, b) => a.nameBn.compareTo(b.nameBn));

        _connectedStopsCache = sortedDestinations;
        state = state.copyWith(
          isLoading: false,
          destinationSuggestions: sortedDestinations,
          // We DO NOT clear the selectedDestination here, preserving the swap!
        );
      },
    );
  }

  Future<void> calculateFare() async {
    if (state.selectedOrigin == null || state.selectedDestination == null) {
      state = state.copyWith(errorMessage: AppStrings.calculatedFareErrorMessage);
      return;
    }

    state = state.copyWith(isLoading: true, fareResults: [], errorMessage: null);

    final result = await _getFares(
      originId: state.selectedOrigin!.id,
      destinationId: state.selectedDestination!.id,
    );

    result.fold(
            (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
            (fares) {
          if(fares.isEmpty){
            state = state.copyWith(
                isLoading: false,
                errorMessage: AppStrings.fareSearchErrorMessage
            );
          } else{
            state = state.copyWith(
              isLoading: false,
              fareResults: fares,
            );
          }
        }
    );
  }

  void resetSearch() {
    _connectedStopsCache = [];
    state = const FareSearchState();
  }
}
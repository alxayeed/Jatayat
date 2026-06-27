import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/transit_region.dart';
import '../../../../core/di/usecase_providers.dart';
import '../../../../core/providers/settings_provider.dart';
import '../../domain/usecases/get_connected_stops_usecase.dart';
import '../../domain/usecases/get_fares_usecase.dart';
import '../../domain/usecases/search_stops_usecase.dart';
import '../states/fare_search_state.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

final fareSearchProvider = StateNotifierProvider<FareSearchNotifier, FareSearchState>((ref) {
  final settingsState = ref.watch(settingsProvider);
  final notifier = FareSearchNotifier(
    searchStops: ref.watch(searchStopsUseCaseProvider),
    getConnectedStops: ref.watch(getConnectedStopsUseCaseProvider),
    getFares: ref.watch(getFaresUseCaseProvider),
    initialRegion: settingsState.selectedRegion,
    settingsNotifier: ref.read(settingsProvider.notifier),
  );
  notifier.init();
  return notifier;
});

class FareSearchNotifier extends StateNotifier<FareSearchState> {
  final SearchStopsUseCase _searchStops;
  final GetConnectedStopsUseCase _getConnectedStops;
  final GetFaresUseCase _getFares;
  final SettingsNotifier _settingsNotifier;

  List<StopEntity> _allStopsCache = [];
  List<StopEntity> _connectedStopsCache = [];

  FareSearchNotifier({
    required SearchStopsUseCase searchStops,
    required GetConnectedStopsUseCase getConnectedStops,
    required GetFaresUseCase getFares,
    required TransitRegion initialRegion,
    required SettingsNotifier settingsNotifier,
  })  : _searchStops = searchStops,
        _getConnectedStops = getConnectedStops,
        _getFares = getFares,
        _settingsNotifier = settingsNotifier,
        super(FareSearchState(selectedRegion: initialRegion));

  Future<void> init() async {
    await loadAllStops();
  }

  Future<void> loadAllStops() async {
    if (!mounted) return;
    state = state.copyWith(errorMessage: null);
    final result = await _searchStops('', region: state.selectedRegion.value);
    if (!mounted) return;
    result.fold(
      (failure) => state = state.copyWith(errorMessage: failure.message),
      (stops) {
        final sorted = List<StopEntity>.from(stops)
          ..sort((a, b) => a.nameBn.compareTo(b.nameBn));
        _allStopsCache = sorted;
        state = state.copyWith(
          originSuggestions: [],
          errorMessage: null,
        );
      },
    );
  }

  Future<void> selectRegion(TransitRegion region) async {
    state = state.copyWith(
      selectedRegion: region,
      selectedOrigin: null,
      selectedDestination: null,
      originSuggestions: [],
      destinationSuggestions: [],
      fareResults: [],
      errorMessage: null,
    );
    _settingsNotifier.setRegion(region);
    if (!mounted) return;
    await loadAllStops();
  }

  void searchOrigin(String query) {
    if (state.selectedOrigin != null) {
      _connectedStopsCache = [];
      state = state.copyWith(
        selectedOrigin: null,
        selectedDestination: null,
        destinationSuggestions: [],
        fareResults: [],
        errorMessage: null,
      );
    }

    final cleanQuery = query.trim().toLowerCase();

    if (cleanQuery.isEmpty) {
      state = state.copyWith(originSuggestions: _allStopsCache);
      return;
    }

    final filtered = _allStopsCache.where((stop) {
      final nameBnMatch = stop.nameBn.contains(cleanQuery);
      final nameEnMatch = stop.nameEn?.toLowerCase().contains(cleanQuery) ?? false;
      return nameBnMatch || nameEnMatch;
    }).toList();

    state = state.copyWith(originSuggestions: filtered);
  }

  Future<void> selectOrigin(StopEntity stop, {required String noRoutesError}) async {
    state = state.copyWith(
      selectedOrigin: stop,
      selectedDestination: null,
      originSuggestions: [],
      destinationSuggestions: [],
      fareResults: [],
      errorMessage: null,
      isDestinationsLoading: true,
    );

    final result = await _getConnectedStops(stop.id);
    if (!mounted) return;

    result.fold(
      (failure) => state = state.copyWith(
        errorMessage: failure.message,
        isDestinationsLoading: false,
      ),
      (destinations) {
        if (destinations.isEmpty) {
          state = state.copyWith(
            errorMessage: noRoutesError,
            isDestinationsLoading: false,
          );
        } else {
          final sortedDestinations = List<StopEntity>.from(destinations)
            ..sort((a, b) => a.nameBn.compareTo(b.nameBn));
          _connectedStopsCache = sortedDestinations;
          state = state.copyWith(
            destinationSuggestions: sortedDestinations,
            isDestinationsLoading: false,
            errorMessage: null,
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

  Future<void> swapStations() async {
    final oldOrigin = state.selectedOrigin;
    final oldDestination = state.selectedDestination;

    if (oldOrigin == null || oldDestination == null) return;

    state = state.copyWith(
      selectedOrigin: oldDestination,
      selectedDestination: oldOrigin,
      originSuggestions: [],
      destinationSuggestions: [],
      fareResults: [],
      isDestinationsLoading: true,
    );

    final result = await _getConnectedStops(oldDestination.id);
    if (!mounted) return;

    result.fold(
      (failure) => state = state.copyWith(
        errorMessage: failure.message,
        isDestinationsLoading: false,
      ),
      (destinations) {
        final sortedDestinations = List<StopEntity>.from(destinations)
          ..sort((a, b) => a.nameBn.compareTo(b.nameBn));
        _connectedStopsCache = sortedDestinations;
        state = state.copyWith(
          destinationSuggestions: sortedDestinations,
          isDestinationsLoading: false,
          errorMessage: null,
        );
      },
    );
  }

  Future<void> calculateFare({
    required String noSelectionError,
    required String noResultsError,
    required String loadingStopsError,
  }) async {
    if (state.isDestinationsLoading) {
      state = state.copyWith(errorMessage: loadingStopsError);
      return;
    }
    if (state.selectedOrigin == null || state.selectedDestination == null) {
      state = state.copyWith(errorMessage: noSelectionError);
      return;
    }

    state = state.copyWith(isLoading: true, fareResults: [], errorMessage: null);

    final result = await _getFares(
      originId: state.selectedOrigin!.id,
      destinationId: state.selectedDestination!.id,
    );
    if (!mounted) return;

    result.fold(
          (failure) => state = state.copyWith(isLoading: false, errorMessage: failure.message),
          (fares) {
        if (fares.isEmpty) {
          state = state.copyWith(isLoading: false, errorMessage: noResultsError);
        } else {
          state = state.copyWith(isLoading: false, fareResults: fares);
        }
      },
    );
  }

  void clearSuggestions() {
    state = state.copyWith(
      originSuggestions: [],
      destinationSuggestions: [],
    );
  }

  void resetSearch() {
    _connectedStopsCache = [];
    state = const FareSearchState();
  }
}
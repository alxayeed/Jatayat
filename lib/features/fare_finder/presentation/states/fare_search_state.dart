import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

part 'fare_search_state.freezed.dart';

@freezed
abstract class FareSearchState with _$FareSearchState {
  const factory FareSearchState({
    @Default([]) List<StopEntity> originSuggestions,
    @Default([]) List<StopEntity> destinationSuggestions,
    @Default([]) List<FareResultEntity> fareResults,
    StopEntity? selectedOrigin,
    StopEntity? selectedDestination,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default('DHAKA METRO') String selectedRegion,
  }) = _FareSearchState;
}
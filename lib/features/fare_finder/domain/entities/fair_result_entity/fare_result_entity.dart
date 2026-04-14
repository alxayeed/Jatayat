import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../route_explorer/domain/entities/route_entity.dart';

part 'fare_result_entity.freezed.dart';

@freezed
class FareResultEntity with _$FareResultEntity {
  const factory FareResultEntity({
    required double officialFare,
    required double calculatedFare,
    required double distance,
    required RouteEntity route,
  }) = _FareResultEntity;
}
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../../../route_explorer/data/models/route_model/route_model.dart';

part 'fare_result_model.freezed.dart';
part 'fare_result_model.g.dart';

@freezed
class FareResultModel with _$FareResultModel {
  const FareResultModel._();

  const factory FareResultModel({
    @JsonKey(name: 'fare_amount') required double officialFare,
    @JsonKey(name: 'calculated_amount') required double calculatedFare,
    // Added distance field. Using defaultValue prevents crashes if it's missing in DB
    @JsonKey(name: 'distance', defaultValue: 0.0) required double distance,
    @JsonKey(name: 'routes') required RouteModel route,
  }) = _FareResultModel;

  factory FareResultModel.fromJson(Map<String, dynamic> json) => _$FareResultModelFromJson(json);

  FareResultEntity toEntity() => FareResultEntity(
    officialFare: officialFare,
    calculatedFare: calculatedFare,
    distance: distance,
    route: route.toEntity(),
    originName: '',
    destinationName: '',
  );

  factory FareResultModel.fromEntity(FareResultEntity entity) => FareResultModel(
    officialFare: entity.officialFare,
    calculatedFare: entity.calculatedFare,
    distance: entity.distance,
    route: RouteModel.fromEntity(entity.route),
  );
}
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
    @JsonKey(name: 'routes') required RouteModel route,
  }) = _FareResultModel;

  factory FareResultModel.fromJson(Map<String, dynamic> json) => _$FareResultModelFromJson(json);

  FareResultEntity toEntity() => FareResultEntity(
    officialFare: officialFare,
    calculatedFare: calculatedFare,
    route: route.toEntity(), // Recursive conversion
  );

  factory FareResultModel.fromEntity(FareResultEntity entity) => FareResultModel(
    officialFare: entity.officialFare,
    calculatedFare: entity.calculatedFare,
    route: RouteModel.fromEntity(entity.route),
  );
}
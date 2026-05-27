import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/fair_result_entity/fare_result_entity.dart';

part 'fare_result_model.freezed.dart';
part 'fare_result_model.g.dart';

@freezed
abstract class FareResultModel with _$FareResultModel {
  const FareResultModel._();

  const factory FareResultModel({
    @JsonKey(name: 'fare_id') required String fareId,
    @JsonKey(name: 'from_stop_id') required String fromStopId,
    @JsonKey(name: 'to_stop_id') required String toStopId,

    // Updated Localized Names
    @JsonKey(name: 'origin_name_bn') String? originNameBn,
    @JsonKey(name: 'origin_name_en') String? originNameEn,
    @JsonKey(name: 'destination_name_bn') String? destinationNameBn,
    @JsonKey(name: 'destination_name_en') String? destinationNameEn,

    @JsonKey(name: 'fare_amount') required double fareAmount,
    @JsonKey(name: 'travel_distance_km') required double travelDistanceKm,
    @JsonKey(name: 'route_id') required String routeId,
    @JsonKey(name: 'route_code') required String routeCode,
    @JsonKey(name: 'route_name_bn') required String routeNameBn,
    @JsonKey(name: 'route_name_en') String? routeNameEn,
    @JsonKey(name: 'route_total_distance') required double routeTotalDistance,
    @JsonKey(name: 'pdf_page_number') int? pdfPage,
    @JsonKey(name: 'pdf_url') String? pdfUrl,
    @JsonKey(name: 'btrc_url') String? btrcUrl,
    @JsonKey(name: 'base_rate') required double baseRate,
    @JsonKey(name: 'min_fare') required double minFare,
  }) = _FareResultModel;

  factory FareResultModel.fromJson(Map<String, dynamic> json) =>
      _$FareResultModelFromJson(json);

  FareResultEntity toEntity() => FareResultEntity(
    fareId: fareId,
    fromStopId: fromStopId,
    toStopId: toStopId,
    originNameBn: originNameBn,
    originNameEn: originNameEn,
    destinationNameBn: destinationNameBn,
    destinationNameEn: destinationNameEn,
    fareAmount: fareAmount,
    travelDistanceKm: travelDistanceKm,
    routeId: routeId,
    routeCode: routeCode,
    routeNameBn: routeNameBn,
    routeNameEn: routeNameEn,
    routeTotalDistance: routeTotalDistance,
    pdfPage: pdfPage,
    pdfUrl: pdfUrl,
    btrcUrl: btrcUrl,
    baseRate: baseRate,
    minFare: minFare,
  );
}

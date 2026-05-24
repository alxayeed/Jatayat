import 'package:freezed_annotation/freezed_annotation.dart';

part 'fare_result_entity.freezed.dart';

@freezed
class FareResultEntity with _$FareResultEntity {
  const factory FareResultEntity({
    required String fareId,
    required double fareAmount,
    required double travelDistanceKm,

    required String fromStopId,
    required String toStopId,

    // Localized Names for the header/timeline
    required String? originNameBn,
    required String? originNameEn,
    required String? destinationNameBn,
    required String? destinationNameEn,

    // Nested Route Info
    required String routeId,
    required String routeCode,
    required String routeNameBn,
    String? routeNameEn,
    required double routeTotalDistance,
    required int? pdfPage,
    required String? pdfUrl,
    required String? btrcUrl,
    required double baseRate,
    required double minFare,
  }) = _FareResultEntity;
}

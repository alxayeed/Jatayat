import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_entity.freezed.dart';

@freezed
class RouteEntity with _$RouteEntity {
  const factory RouteEntity({
    required String id,
    required String routeCode,
    required String nameBn,
    String? nameEn,
    required double totalDistance,
    required String documentId,
    required int pdfPage,
    required String pdfUrl,
    required String btrcUrl,

    // --- New Verification & Analytical Fields ---
    required String issuedDate,
    required double baseRate,
    required int minFare,
    String? notes,
  }) = _RouteEntity;
}
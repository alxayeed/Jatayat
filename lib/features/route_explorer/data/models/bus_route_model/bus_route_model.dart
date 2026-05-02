import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/bus_route/bus_route.dart';

part 'bus_route_model.freezed.dart';
part 'bus_route_model.g.dart';

@freezed
class BusRouteModel with _$BusRouteModel {
  const BusRouteModel._();

  const factory BusRouteModel({
    @JsonKey(name: 'route_code') required String routeCode,
    @JsonKey(name: 'name_bn') required String nameBn,
    @JsonKey(name: 'total_distance_km') required double totalDistanceKm,
    @JsonKey(name: 'total_stops') required int totalStops,
    @JsonKey(name: 'pdf_page_number') required int pdfPageNumber,
    required String region,
    @JsonKey(name: 'pdf_url') required String pdfUrl,
    @JsonKey(name: 'btrc_url') required String btrcUrl,
    @JsonKey(name: 'base_fare_per_km') required double baseFarePerKm,
    @JsonKey(name: 'minimum_fare') required int minimumFare,
    @JsonKey(name: 'issued_date') required DateTime issuedDate,
  }) = _BusRouteModel;

  factory BusRouteModel.fromJson(Map<String, dynamic> json) =>
      _$BusRouteModelFromJson(json);

  /// Converts Model to Domain Entity
  BusRoute toEntity() => BusRoute(
    routeCode: routeCode,
    nameBn: nameBn,
    totalDistanceKm: totalDistanceKm,
    totalStops: totalStops,
    pdfPageNumber: pdfPageNumber,
    region: region,
    pdfUrl: pdfUrl,
    btrc_url: btrcUrl,
    baseFarePerKm: baseFarePerKm,
    minimumFare: minimumFare,
    issuedDate: issuedDate,
  );

  /// Creates a Model from a Domain Entity (useful for caching/uploading)
  factory BusRouteModel.fromEntity(BusRoute entity) => BusRouteModel(
    routeCode: entity.routeCode,
    nameBn: entity.nameBn,
    totalDistanceKm: entity.totalDistanceKm,
    totalStops: entity.totalStops,
    pdfPageNumber: entity.pdfPageNumber,
    region: entity.region,
    pdfUrl: entity.pdfUrl,
    btrcUrl: entity.btrc_url,
    baseFarePerKm: entity.baseFarePerKm,
    minimumFare: entity.minimumFare,
    issuedDate: entity.issuedDate,
  );
}
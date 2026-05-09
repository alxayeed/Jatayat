import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/bus_route/bus_route.dart'; // Adjust path as needed

part 'bus_route_model.freezed.dart';
part 'bus_route_model.g.dart';

// --- 1. Route Stop Model ---
@freezed
class RouteStopModel with _$RouteStopModel {
  const RouteStopModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RouteStopModel({
    required String stopId,
    required String nameBn,
    required int sequenceOrder,
    required double cumulativeDistanceKm,
    String? nameEn,
    double? lat,
    double? lng,
  }) = _RouteStopModel;

  factory RouteStopModel.fromJson(Map<String, dynamic> json) =>
      _$RouteStopModelFromJson(json);

  /// Converts Model to Domain Entity
  RouteStop toEntity() => RouteStop(
    stopId: stopId,
    nameBn: nameBn,
    sequenceOrder: sequenceOrder,
    cumulativeDistanceKm: cumulativeDistanceKm,
    nameEn: nameEn,
    lat: lat,
    lng: lng,
  );

  /// Creates a Model from a Domain Entity
  factory RouteStopModel.fromEntity(RouteStop entity) => RouteStopModel(
    stopId: entity.stopId,
    nameBn: entity.nameBn,
    sequenceOrder: entity.sequenceOrder,
    cumulativeDistanceKm: entity.cumulativeDistanceKm,
    nameEn: entity.nameEn,
    lat: entity.lat,
    lng: entity.lng,
  );
}

// --- 2. Bus Route Model ---
@freezed
class BusRouteModel with _$BusRouteModel {
  const BusRouteModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BusRouteModel({
    required String id, // Added Primary Key
    required String routeCode,
    required String nameBn,
    required double totalDistanceKm,
    required int totalStops,
    required String region,

    // Nullable fields matching DB schema
    int? pdfPageNumber,
    String? pdfUrl,
    String? btrcUrl,
    double? baseFarePerKm,
    int? minimumFare,
    DateTime? issuedDate,

    // The list of stops (defaults to empty for the "Lazy Loading" list view)
    @Default([]) List<RouteStopModel> stops,
  }) = _BusRouteModel;

  factory BusRouteModel.fromJson(Map<String, dynamic> json) =>
      _$BusRouteModelFromJson(json);

  /// Converts Model to Domain Entity
  BusRoute toEntity() => BusRoute(
    id: id,
    routeCode: routeCode,
    nameBn: nameBn,
    totalDistanceKm: totalDistanceKm,
    totalStops: totalStops,
    region: region,
    pdfPageNumber: pdfPageNumber,
    pdfUrl: pdfUrl,
    btrcUrl: btrcUrl,
    baseFarePerKm: baseFarePerKm,
    minimumFare: minimumFare,
    issuedDate: issuedDate,
    // Map list of RouteStopModel to list of RouteStop entity
    stops: stops.map((stopModel) => stopModel.toEntity()).toList(),
  );

  /// Creates a Model from a Domain Entity (useful for caching/local DB insertion)
  factory BusRouteModel.fromEntity(BusRoute entity) => BusRouteModel(
    id: entity.id,
    routeCode: entity.routeCode,
    nameBn: entity.nameBn,
    totalDistanceKm: entity.totalDistanceKm,
    totalStops: entity.totalStops,
    region: entity.region,
    pdfPageNumber: entity.pdfPageNumber,
    pdfUrl: entity.pdfUrl,
    btrcUrl: entity.btrcUrl,
    baseFarePerKm: entity.baseFarePerKm,
    minimumFare: entity.minimumFare,
    issuedDate: entity.issuedDate,
    // Map list of RouteStop entity to list of RouteStopModel
    stops: entity.stops.map((stop) => RouteStopModel.fromEntity(stop)).toList(),
  );
}
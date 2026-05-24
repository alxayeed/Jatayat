import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_route.freezed.dart';
part 'bus_route.g.dart';

// 1. The Stop Entity (Represents the sequential stops)
@freezed
class RouteStop with _$RouteStop {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RouteStop({
    required String stopId,
    required String nameBn,
    required int sequenceOrder,
    required double cumulativeDistanceKm,
    String? nameEn,
    double? lat,
    double? lng,
  }) = _RouteStop;

  factory RouteStop.fromJson(Map<String, dynamic> json) => _$RouteStopFromJson(json);
}

// 2. The Main Route Entity
@freezed
class BusRoute with _$BusRoute {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BusRoute({
    required String id, // Strongly recommended to keep for DB lookups
    required String routeCode,
    required String nameBn,
    String? nameEn,
    required double totalDistanceKm,
    required int totalStops,
    required String region,

    int? pdfPageNumber,
    String? pdfUrl,
    String? btrcUrl,
    double? baseFarePerKm,
    int? minimumFare,
    DateTime? issuedDate,

    // The missing stops! Defaults to empty for the summary list view.
    @Default([]) List<RouteStop> stops,
  }) = _BusRoute;

  factory BusRoute.fromJson(Map<String, dynamic> json) => _$BusRouteFromJson(json);
}
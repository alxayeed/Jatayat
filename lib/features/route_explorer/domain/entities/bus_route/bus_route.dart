import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_route.freezed.dart';

@freezed
class BusRoute with _$BusRoute {
  const factory BusRoute({
    required String routeCode,
    required String nameBn,
    required double totalDistanceKm,
    required int totalStops,
    required int pdfPageNumber,
    required String region,
    required String pdfUrl,
    required String btrc_url,
    required double baseFarePerKm,
    required int minimumFare,
    required DateTime issuedDate,
  }) = _BusRoute;
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_entity.freezed.dart';

@freezed
class RouteEntity with _$RouteEntity {
  const factory RouteEntity({
    required String id,
    required String routeCode,
    required String nameBn,
    required double totalDistance,
    required String documentId,
    required int pdfPage,
  }) = _RouteEntity;
}
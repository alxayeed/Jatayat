import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/route_entity.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
class RouteModel with _$RouteModel {
  const RouteModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RouteModel({
    required String id,
    required String routeCode,
    required String nameBn,
    required double totalDistanceKm, // Matching Supabase column name
    required String documentId,
    required int pdfPageNumber,     // Matching Supabase column name
  }) = _RouteModel;

  factory RouteModel.fromJson(Map<String, dynamic> json) => _$RouteModelFromJson(json);

  /// Converts Model (Data Layer) to Entity (Domain Layer)
  RouteEntity toEntity() => RouteEntity(
    id: id,
    routeCode: routeCode,
    nameBn: nameBn,
    totalDistance: totalDistanceKm,
    documentId: documentId,
    pdfPage: pdfPageNumber,
  );

  /// Converts Entity (Domain Layer) to Model (Data Layer)
  factory RouteModel.fromEntity(RouteEntity entity) => RouteModel(
    id: entity.id,
    routeCode: entity.routeCode,
    nameBn: entity.nameBn,
    totalDistanceKm: entity.totalDistance,
    documentId: entity.documentId,
    pdfPageNumber: entity.pdfPage,
  );
}
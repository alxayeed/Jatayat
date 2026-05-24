import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/route_entity.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
class RouteModel with _$RouteModel {
  const RouteModel._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory RouteModel({
    required String id,
    required String routeCode,
    required String nameBn,
    String? nameEn,
    required double totalDistanceKm,
    required String documentId,
    required int pdfPageNumber,
    required Map<String, dynamic> documents,
  }) = _RouteModel;

  factory RouteModel.fromJson(Map<String, dynamic> json) => _$RouteModelFromJson(json);

  RouteEntity toEntity() => RouteEntity(
    id: id,
    routeCode: routeCode,
    nameBn: nameBn,
    nameEn: nameEn,
    totalDistance: totalDistanceKm,
    documentId: documentId,
    pdfPage: pdfPageNumber,
    pdfUrl: documents['pdf_url'] as String,
    btrcUrl: documents['btrc_url'] as String,
    issuedDate: documents['issued_date'] as String,
    baseRate: double.parse(documents['base_fare_per_km'].toString()),
    minFare: documents['minimum_fare'] as int,
    notes: documents['notes'] as String?,
  );

  factory RouteModel.fromEntity(RouteEntity entity) => RouteModel(
    id: entity.id,
    routeCode: entity.routeCode,
    nameBn: entity.nameBn,
    nameEn: entity.nameEn,
    totalDistanceKm: entity.totalDistance,
    documentId: entity.documentId,
    pdfPageNumber: entity.pdfPage,
    documents: {
      'pdf_url': entity.pdfUrl,
      'btrc_url': entity.btrcUrl,
      'issued_date': entity.issuedDate,
      'base_fare_per_km': entity.baseRate,
      'minimum_fare': entity.minFare,
      'notes': entity.notes,
    },
  );
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteModelImpl _$$RouteModelImplFromJson(Map<String, dynamic> json) =>
    _$RouteModelImpl(
      id: json['id'] as String,
      routeCode: json['route_code'] as String,
      nameBn: json['name_bn'] as String,
      nameEn: json['name_en'] as String?,
      totalDistanceKm: (json['total_distance_km'] as num).toDouble(),
      documentId: json['document_id'] as String,
      pdfPageNumber: (json['pdf_page_number'] as num).toInt(),
      documents: json['documents'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$RouteModelImplToJson(_$RouteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route_code': instance.routeCode,
      'name_bn': instance.nameBn,
      'name_en': instance.nameEn,
      'total_distance_km': instance.totalDistanceKm,
      'document_id': instance.documentId,
      'pdf_page_number': instance.pdfPageNumber,
      'documents': instance.documents,
    };

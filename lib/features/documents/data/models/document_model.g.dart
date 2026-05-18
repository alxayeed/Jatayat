// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      btrcUrl: json['btrc_url'] as String,
      pdfUrl: json['pdf_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      versionName: json['version_name'] as String,
      region: json['region'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'btrc_url': instance.btrcUrl,
      'pdf_url': instance.pdfUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'version_name': instance.versionName,
      'region': instance.region,
      'notes': instance.notes,
    };

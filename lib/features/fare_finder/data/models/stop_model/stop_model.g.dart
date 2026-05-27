// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StopModel _$StopModelFromJson(Map<String, dynamic> json) => _StopModel(
  id: json['id'] as String,
  nameBn: json['name_bn'] as String,
  nameEn: json['name_en'] as String?,
);

Map<String, dynamic> _$StopModelToJson(_StopModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_bn': instance.nameBn,
      'name_en': instance.nameEn,
    };

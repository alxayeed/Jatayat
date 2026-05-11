// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FareResultModelImpl _$$FareResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$FareResultModelImpl(
  fareId: json['fare_id'] as String,
  fromStopId: json['from_stop_id'] as String,
  toStopId: json['to_stop_id'] as String,
  originNameBn: json['origin_name_bn'] as String?,
  originNameEn: json['origin_name_en'] as String?,
  destinationNameBn: json['destination_name_bn'] as String?,
  destinationNameEn: json['destination_name_en'] as String?,
  fareAmount: (json['fare_amount'] as num).toDouble(),
  travelDistanceKm: (json['travel_distance_km'] as num).toDouble(),
  routeId: json['route_id'] as String,
  routeCode: json['route_code'] as String,
  routeNameBn: json['route_name_bn'] as String,
  routeTotalDistance: (json['route_total_distance'] as num).toDouble(),
  pdfPage: (json['pdf_page_number'] as num?)?.toInt(),
  pdfUrl: json['pdf_url'] as String?,
  btrcUrl: json['btrc_url'] as String?,
  baseRate: (json['base_rate'] as num).toDouble(),
  minFare: (json['min_fare'] as num).toDouble(),
);

Map<String, dynamic> _$$FareResultModelImplToJson(
  _$FareResultModelImpl instance,
) => <String, dynamic>{
  'fare_id': instance.fareId,
  'from_stop_id': instance.fromStopId,
  'to_stop_id': instance.toStopId,
  'origin_name_bn': instance.originNameBn,
  'origin_name_en': instance.originNameEn,
  'destination_name_bn': instance.destinationNameBn,
  'destination_name_en': instance.destinationNameEn,
  'fare_amount': instance.fareAmount,
  'travel_distance_km': instance.travelDistanceKm,
  'route_id': instance.routeId,
  'route_code': instance.routeCode,
  'route_name_bn': instance.routeNameBn,
  'route_total_distance': instance.routeTotalDistance,
  'pdf_page_number': instance.pdfPage,
  'pdf_url': instance.pdfUrl,
  'btrc_url': instance.btrcUrl,
  'base_rate': instance.baseRate,
  'min_fare': instance.minFare,
};

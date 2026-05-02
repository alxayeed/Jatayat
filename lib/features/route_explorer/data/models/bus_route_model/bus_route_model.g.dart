// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusRouteModelImpl _$$BusRouteModelImplFromJson(Map<String, dynamic> json) =>
    _$BusRouteModelImpl(
      routeCode: json['route_code'] as String,
      nameBn: json['name_bn'] as String,
      totalDistanceKm: (json['total_distance_km'] as num).toDouble(),
      totalStops: (json['total_stops'] as num).toInt(),
      pdfPageNumber: (json['pdf_page_number'] as num).toInt(),
      region: json['region'] as String,
      pdfUrl: json['pdf_url'] as String,
      btrcUrl: json['btrc_url'] as String,
      baseFarePerKm: (json['base_fare_per_km'] as num).toDouble(),
      minimumFare: (json['minimum_fare'] as num).toInt(),
      issuedDate: DateTime.parse(json['issued_date'] as String),
    );

Map<String, dynamic> _$$BusRouteModelImplToJson(_$BusRouteModelImpl instance) =>
    <String, dynamic>{
      'route_code': instance.routeCode,
      'name_bn': instance.nameBn,
      'total_distance_km': instance.totalDistanceKm,
      'total_stops': instance.totalStops,
      'pdf_page_number': instance.pdfPageNumber,
      'region': instance.region,
      'pdf_url': instance.pdfUrl,
      'btrc_url': instance.btrcUrl,
      'base_fare_per_km': instance.baseFarePerKm,
      'minimum_fare': instance.minimumFare,
      'issued_date': instance.issuedDate.toIso8601String(),
    };

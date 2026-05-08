// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteStopImpl _$$RouteStopImplFromJson(Map<String, dynamic> json) =>
    _$RouteStopImpl(
      stopId: json['stop_id'] as String,
      nameBn: json['name_bn'] as String,
      sequenceOrder: (json['sequence_order'] as num).toInt(),
      cumulativeDistanceKm: (json['cumulative_distance_km'] as num).toDouble(),
      nameEn: json['name_en'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RouteStopImplToJson(_$RouteStopImpl instance) =>
    <String, dynamic>{
      'stop_id': instance.stopId,
      'name_bn': instance.nameBn,
      'sequence_order': instance.sequenceOrder,
      'cumulative_distance_km': instance.cumulativeDistanceKm,
      'name_en': instance.nameEn,
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$BusRouteImpl _$$BusRouteImplFromJson(Map<String, dynamic> json) =>
    _$BusRouteImpl(
      id: json['id'] as String,
      routeCode: json['route_code'] as String,
      nameBn: json['name_bn'] as String,
      totalDistanceKm: (json['total_distance_km'] as num).toDouble(),
      totalStops: (json['total_stops'] as num).toInt(),
      region: json['region'] as String,
      pdfPageNumber: (json['pdf_page_number'] as num?)?.toInt(),
      pdfUrl: json['pdf_url'] as String?,
      btrcUrl: json['btrc_url'] as String?,
      baseFarePerKm: (json['base_fare_per_km'] as num?)?.toDouble(),
      minimumFare: (json['minimum_fare'] as num?)?.toInt(),
      issuedDate: json['issued_date'] == null
          ? null
          : DateTime.parse(json['issued_date'] as String),
      stops:
          (json['stops'] as List<dynamic>?)
              ?.map((e) => RouteStop.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BusRouteImplToJson(_$BusRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route_code': instance.routeCode,
      'name_bn': instance.nameBn,
      'total_distance_km': instance.totalDistanceKm,
      'total_stops': instance.totalStops,
      'region': instance.region,
      'pdf_page_number': instance.pdfPageNumber,
      'pdf_url': instance.pdfUrl,
      'btrc_url': instance.btrcUrl,
      'base_fare_per_km': instance.baseFarePerKm,
      'minimum_fare': instance.minimumFare,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'stops': instance.stops,
    };

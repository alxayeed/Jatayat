// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FareResultModelImpl _$$FareResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$FareResultModelImpl(
  officialFare: (json['fare_amount'] as num).toDouble(),
  calculatedFare: (json['calculated_amount'] as num).toDouble(),
  distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
  route: RouteModel.fromJson(json['routes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$FareResultModelImplToJson(
  _$FareResultModelImpl instance,
) => <String, dynamic>{
  'fare_amount': instance.officialFare,
  'calculated_amount': instance.calculatedFare,
  'distance': instance.distance,
  'routes': instance.route,
};

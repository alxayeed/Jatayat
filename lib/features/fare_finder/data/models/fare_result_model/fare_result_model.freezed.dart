// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FareResultModel {

@JsonKey(name: 'fare_id') String get fareId;@JsonKey(name: 'from_stop_id') String get fromStopId;@JsonKey(name: 'to_stop_id') String get toStopId;// Updated Localized Names
@JsonKey(name: 'origin_name_bn') String? get originNameBn;@JsonKey(name: 'origin_name_en') String? get originNameEn;@JsonKey(name: 'destination_name_bn') String? get destinationNameBn;@JsonKey(name: 'destination_name_en') String? get destinationNameEn;@JsonKey(name: 'fare_amount') double get fareAmount;@JsonKey(name: 'travel_distance_km') double get travelDistanceKm;@JsonKey(name: 'route_id') String get routeId;@JsonKey(name: 'route_code') String get routeCode;@JsonKey(name: 'route_name_bn') String get routeNameBn;@JsonKey(name: 'route_name_en') String? get routeNameEn;@JsonKey(name: 'route_total_distance') double get routeTotalDistance;@JsonKey(name: 'pdf_page_number') int? get pdfPage;@JsonKey(name: 'pdf_url') String? get pdfUrl;@JsonKey(name: 'btrc_url') String? get btrcUrl;@JsonKey(name: 'base_rate') double get baseRate;@JsonKey(name: 'min_fare') double get minFare;
/// Create a copy of FareResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FareResultModelCopyWith<FareResultModel> get copyWith => _$FareResultModelCopyWithImpl<FareResultModel>(this as FareResultModel, _$identity);

  /// Serializes this FareResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FareResultModel&&(identical(other.fareId, fareId) || other.fareId == fareId)&&(identical(other.fromStopId, fromStopId) || other.fromStopId == fromStopId)&&(identical(other.toStopId, toStopId) || other.toStopId == toStopId)&&(identical(other.originNameBn, originNameBn) || other.originNameBn == originNameBn)&&(identical(other.originNameEn, originNameEn) || other.originNameEn == originNameEn)&&(identical(other.destinationNameBn, destinationNameBn) || other.destinationNameBn == destinationNameBn)&&(identical(other.destinationNameEn, destinationNameEn) || other.destinationNameEn == destinationNameEn)&&(identical(other.fareAmount, fareAmount) || other.fareAmount == fareAmount)&&(identical(other.travelDistanceKm, travelDistanceKm) || other.travelDistanceKm == travelDistanceKm)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.routeNameBn, routeNameBn) || other.routeNameBn == routeNameBn)&&(identical(other.routeNameEn, routeNameEn) || other.routeNameEn == routeNameEn)&&(identical(other.routeTotalDistance, routeTotalDistance) || other.routeTotalDistance == routeTotalDistance)&&(identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseRate, baseRate) || other.baseRate == baseRate)&&(identical(other.minFare, minFare) || other.minFare == minFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,fareId,fromStopId,toStopId,originNameBn,originNameEn,destinationNameBn,destinationNameEn,fareAmount,travelDistanceKm,routeId,routeCode,routeNameBn,routeNameEn,routeTotalDistance,pdfPage,pdfUrl,btrcUrl,baseRate,minFare]);

@override
String toString() {
  return 'FareResultModel(fareId: $fareId, fromStopId: $fromStopId, toStopId: $toStopId, originNameBn: $originNameBn, originNameEn: $originNameEn, destinationNameBn: $destinationNameBn, destinationNameEn: $destinationNameEn, fareAmount: $fareAmount, travelDistanceKm: $travelDistanceKm, routeId: $routeId, routeCode: $routeCode, routeNameBn: $routeNameBn, routeNameEn: $routeNameEn, routeTotalDistance: $routeTotalDistance, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseRate: $baseRate, minFare: $minFare)';
}


}

/// @nodoc
abstract mixin class $FareResultModelCopyWith<$Res>  {
  factory $FareResultModelCopyWith(FareResultModel value, $Res Function(FareResultModel) _then) = _$FareResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'fare_id') String fareId,@JsonKey(name: 'from_stop_id') String fromStopId,@JsonKey(name: 'to_stop_id') String toStopId,@JsonKey(name: 'origin_name_bn') String? originNameBn,@JsonKey(name: 'origin_name_en') String? originNameEn,@JsonKey(name: 'destination_name_bn') String? destinationNameBn,@JsonKey(name: 'destination_name_en') String? destinationNameEn,@JsonKey(name: 'fare_amount') double fareAmount,@JsonKey(name: 'travel_distance_km') double travelDistanceKm,@JsonKey(name: 'route_id') String routeId,@JsonKey(name: 'route_code') String routeCode,@JsonKey(name: 'route_name_bn') String routeNameBn,@JsonKey(name: 'route_name_en') String? routeNameEn,@JsonKey(name: 'route_total_distance') double routeTotalDistance,@JsonKey(name: 'pdf_page_number') int? pdfPage,@JsonKey(name: 'pdf_url') String? pdfUrl,@JsonKey(name: 'btrc_url') String? btrcUrl,@JsonKey(name: 'base_rate') double baseRate,@JsonKey(name: 'min_fare') double minFare
});




}
/// @nodoc
class _$FareResultModelCopyWithImpl<$Res>
    implements $FareResultModelCopyWith<$Res> {
  _$FareResultModelCopyWithImpl(this._self, this._then);

  final FareResultModel _self;
  final $Res Function(FareResultModel) _then;

/// Create a copy of FareResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fareId = null,Object? fromStopId = null,Object? toStopId = null,Object? originNameBn = freezed,Object? originNameEn = freezed,Object? destinationNameBn = freezed,Object? destinationNameEn = freezed,Object? fareAmount = null,Object? travelDistanceKm = null,Object? routeId = null,Object? routeCode = null,Object? routeNameBn = null,Object? routeNameEn = freezed,Object? routeTotalDistance = null,Object? pdfPage = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseRate = null,Object? minFare = null,}) {
  return _then(_self.copyWith(
fareId: null == fareId ? _self.fareId : fareId // ignore: cast_nullable_to_non_nullable
as String,fromStopId: null == fromStopId ? _self.fromStopId : fromStopId // ignore: cast_nullable_to_non_nullable
as String,toStopId: null == toStopId ? _self.toStopId : toStopId // ignore: cast_nullable_to_non_nullable
as String,originNameBn: freezed == originNameBn ? _self.originNameBn : originNameBn // ignore: cast_nullable_to_non_nullable
as String?,originNameEn: freezed == originNameEn ? _self.originNameEn : originNameEn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameBn: freezed == destinationNameBn ? _self.destinationNameBn : destinationNameBn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameEn: freezed == destinationNameEn ? _self.destinationNameEn : destinationNameEn // ignore: cast_nullable_to_non_nullable
as String?,fareAmount: null == fareAmount ? _self.fareAmount : fareAmount // ignore: cast_nullable_to_non_nullable
as double,travelDistanceKm: null == travelDistanceKm ? _self.travelDistanceKm : travelDistanceKm // ignore: cast_nullable_to_non_nullable
as double,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,routeNameBn: null == routeNameBn ? _self.routeNameBn : routeNameBn // ignore: cast_nullable_to_non_nullable
as String,routeNameEn: freezed == routeNameEn ? _self.routeNameEn : routeNameEn // ignore: cast_nullable_to_non_nullable
as String?,routeTotalDistance: null == routeTotalDistance ? _self.routeTotalDistance : routeTotalDistance // ignore: cast_nullable_to_non_nullable
as double,pdfPage: freezed == pdfPage ? _self.pdfPage : pdfPage // ignore: cast_nullable_to_non_nullable
as int?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,btrcUrl: freezed == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String?,baseRate: null == baseRate ? _self.baseRate : baseRate // ignore: cast_nullable_to_non_nullable
as double,minFare: null == minFare ? _self.minFare : minFare // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FareResultModel].
extension FareResultModelPatterns on FareResultModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FareResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FareResultModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FareResultModel value)  $default,){
final _that = this;
switch (_that) {
case _FareResultModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FareResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _FareResultModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'fare_id')  String fareId, @JsonKey(name: 'from_stop_id')  String fromStopId, @JsonKey(name: 'to_stop_id')  String toStopId, @JsonKey(name: 'origin_name_bn')  String? originNameBn, @JsonKey(name: 'origin_name_en')  String? originNameEn, @JsonKey(name: 'destination_name_bn')  String? destinationNameBn, @JsonKey(name: 'destination_name_en')  String? destinationNameEn, @JsonKey(name: 'fare_amount')  double fareAmount, @JsonKey(name: 'travel_distance_km')  double travelDistanceKm, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'route_code')  String routeCode, @JsonKey(name: 'route_name_bn')  String routeNameBn, @JsonKey(name: 'route_name_en')  String? routeNameEn, @JsonKey(name: 'route_total_distance')  double routeTotalDistance, @JsonKey(name: 'pdf_page_number')  int? pdfPage, @JsonKey(name: 'pdf_url')  String? pdfUrl, @JsonKey(name: 'btrc_url')  String? btrcUrl, @JsonKey(name: 'base_rate')  double baseRate, @JsonKey(name: 'min_fare')  double minFare)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FareResultModel() when $default != null:
return $default(_that.fareId,_that.fromStopId,_that.toStopId,_that.originNameBn,_that.originNameEn,_that.destinationNameBn,_that.destinationNameEn,_that.fareAmount,_that.travelDistanceKm,_that.routeId,_that.routeCode,_that.routeNameBn,_that.routeNameEn,_that.routeTotalDistance,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.baseRate,_that.minFare);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'fare_id')  String fareId, @JsonKey(name: 'from_stop_id')  String fromStopId, @JsonKey(name: 'to_stop_id')  String toStopId, @JsonKey(name: 'origin_name_bn')  String? originNameBn, @JsonKey(name: 'origin_name_en')  String? originNameEn, @JsonKey(name: 'destination_name_bn')  String? destinationNameBn, @JsonKey(name: 'destination_name_en')  String? destinationNameEn, @JsonKey(name: 'fare_amount')  double fareAmount, @JsonKey(name: 'travel_distance_km')  double travelDistanceKm, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'route_code')  String routeCode, @JsonKey(name: 'route_name_bn')  String routeNameBn, @JsonKey(name: 'route_name_en')  String? routeNameEn, @JsonKey(name: 'route_total_distance')  double routeTotalDistance, @JsonKey(name: 'pdf_page_number')  int? pdfPage, @JsonKey(name: 'pdf_url')  String? pdfUrl, @JsonKey(name: 'btrc_url')  String? btrcUrl, @JsonKey(name: 'base_rate')  double baseRate, @JsonKey(name: 'min_fare')  double minFare)  $default,) {final _that = this;
switch (_that) {
case _FareResultModel():
return $default(_that.fareId,_that.fromStopId,_that.toStopId,_that.originNameBn,_that.originNameEn,_that.destinationNameBn,_that.destinationNameEn,_that.fareAmount,_that.travelDistanceKm,_that.routeId,_that.routeCode,_that.routeNameBn,_that.routeNameEn,_that.routeTotalDistance,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.baseRate,_that.minFare);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'fare_id')  String fareId, @JsonKey(name: 'from_stop_id')  String fromStopId, @JsonKey(name: 'to_stop_id')  String toStopId, @JsonKey(name: 'origin_name_bn')  String? originNameBn, @JsonKey(name: 'origin_name_en')  String? originNameEn, @JsonKey(name: 'destination_name_bn')  String? destinationNameBn, @JsonKey(name: 'destination_name_en')  String? destinationNameEn, @JsonKey(name: 'fare_amount')  double fareAmount, @JsonKey(name: 'travel_distance_km')  double travelDistanceKm, @JsonKey(name: 'route_id')  String routeId, @JsonKey(name: 'route_code')  String routeCode, @JsonKey(name: 'route_name_bn')  String routeNameBn, @JsonKey(name: 'route_name_en')  String? routeNameEn, @JsonKey(name: 'route_total_distance')  double routeTotalDistance, @JsonKey(name: 'pdf_page_number')  int? pdfPage, @JsonKey(name: 'pdf_url')  String? pdfUrl, @JsonKey(name: 'btrc_url')  String? btrcUrl, @JsonKey(name: 'base_rate')  double baseRate, @JsonKey(name: 'min_fare')  double minFare)?  $default,) {final _that = this;
switch (_that) {
case _FareResultModel() when $default != null:
return $default(_that.fareId,_that.fromStopId,_that.toStopId,_that.originNameBn,_that.originNameEn,_that.destinationNameBn,_that.destinationNameEn,_that.fareAmount,_that.travelDistanceKm,_that.routeId,_that.routeCode,_that.routeNameBn,_that.routeNameEn,_that.routeTotalDistance,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.baseRate,_that.minFare);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FareResultModel extends FareResultModel {
  const _FareResultModel({@JsonKey(name: 'fare_id') required this.fareId, @JsonKey(name: 'from_stop_id') required this.fromStopId, @JsonKey(name: 'to_stop_id') required this.toStopId, @JsonKey(name: 'origin_name_bn') this.originNameBn, @JsonKey(name: 'origin_name_en') this.originNameEn, @JsonKey(name: 'destination_name_bn') this.destinationNameBn, @JsonKey(name: 'destination_name_en') this.destinationNameEn, @JsonKey(name: 'fare_amount') required this.fareAmount, @JsonKey(name: 'travel_distance_km') required this.travelDistanceKm, @JsonKey(name: 'route_id') required this.routeId, @JsonKey(name: 'route_code') required this.routeCode, @JsonKey(name: 'route_name_bn') required this.routeNameBn, @JsonKey(name: 'route_name_en') this.routeNameEn, @JsonKey(name: 'route_total_distance') required this.routeTotalDistance, @JsonKey(name: 'pdf_page_number') this.pdfPage, @JsonKey(name: 'pdf_url') this.pdfUrl, @JsonKey(name: 'btrc_url') this.btrcUrl, @JsonKey(name: 'base_rate') required this.baseRate, @JsonKey(name: 'min_fare') required this.minFare}): super._();
  factory _FareResultModel.fromJson(Map<String, dynamic> json) => _$FareResultModelFromJson(json);

@override@JsonKey(name: 'fare_id') final  String fareId;
@override@JsonKey(name: 'from_stop_id') final  String fromStopId;
@override@JsonKey(name: 'to_stop_id') final  String toStopId;
// Updated Localized Names
@override@JsonKey(name: 'origin_name_bn') final  String? originNameBn;
@override@JsonKey(name: 'origin_name_en') final  String? originNameEn;
@override@JsonKey(name: 'destination_name_bn') final  String? destinationNameBn;
@override@JsonKey(name: 'destination_name_en') final  String? destinationNameEn;
@override@JsonKey(name: 'fare_amount') final  double fareAmount;
@override@JsonKey(name: 'travel_distance_km') final  double travelDistanceKm;
@override@JsonKey(name: 'route_id') final  String routeId;
@override@JsonKey(name: 'route_code') final  String routeCode;
@override@JsonKey(name: 'route_name_bn') final  String routeNameBn;
@override@JsonKey(name: 'route_name_en') final  String? routeNameEn;
@override@JsonKey(name: 'route_total_distance') final  double routeTotalDistance;
@override@JsonKey(name: 'pdf_page_number') final  int? pdfPage;
@override@JsonKey(name: 'pdf_url') final  String? pdfUrl;
@override@JsonKey(name: 'btrc_url') final  String? btrcUrl;
@override@JsonKey(name: 'base_rate') final  double baseRate;
@override@JsonKey(name: 'min_fare') final  double minFare;

/// Create a copy of FareResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FareResultModelCopyWith<_FareResultModel> get copyWith => __$FareResultModelCopyWithImpl<_FareResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FareResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FareResultModel&&(identical(other.fareId, fareId) || other.fareId == fareId)&&(identical(other.fromStopId, fromStopId) || other.fromStopId == fromStopId)&&(identical(other.toStopId, toStopId) || other.toStopId == toStopId)&&(identical(other.originNameBn, originNameBn) || other.originNameBn == originNameBn)&&(identical(other.originNameEn, originNameEn) || other.originNameEn == originNameEn)&&(identical(other.destinationNameBn, destinationNameBn) || other.destinationNameBn == destinationNameBn)&&(identical(other.destinationNameEn, destinationNameEn) || other.destinationNameEn == destinationNameEn)&&(identical(other.fareAmount, fareAmount) || other.fareAmount == fareAmount)&&(identical(other.travelDistanceKm, travelDistanceKm) || other.travelDistanceKm == travelDistanceKm)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.routeNameBn, routeNameBn) || other.routeNameBn == routeNameBn)&&(identical(other.routeNameEn, routeNameEn) || other.routeNameEn == routeNameEn)&&(identical(other.routeTotalDistance, routeTotalDistance) || other.routeTotalDistance == routeTotalDistance)&&(identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseRate, baseRate) || other.baseRate == baseRate)&&(identical(other.minFare, minFare) || other.minFare == minFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,fareId,fromStopId,toStopId,originNameBn,originNameEn,destinationNameBn,destinationNameEn,fareAmount,travelDistanceKm,routeId,routeCode,routeNameBn,routeNameEn,routeTotalDistance,pdfPage,pdfUrl,btrcUrl,baseRate,minFare]);

@override
String toString() {
  return 'FareResultModel(fareId: $fareId, fromStopId: $fromStopId, toStopId: $toStopId, originNameBn: $originNameBn, originNameEn: $originNameEn, destinationNameBn: $destinationNameBn, destinationNameEn: $destinationNameEn, fareAmount: $fareAmount, travelDistanceKm: $travelDistanceKm, routeId: $routeId, routeCode: $routeCode, routeNameBn: $routeNameBn, routeNameEn: $routeNameEn, routeTotalDistance: $routeTotalDistance, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseRate: $baseRate, minFare: $minFare)';
}


}

/// @nodoc
abstract mixin class _$FareResultModelCopyWith<$Res> implements $FareResultModelCopyWith<$Res> {
  factory _$FareResultModelCopyWith(_FareResultModel value, $Res Function(_FareResultModel) _then) = __$FareResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'fare_id') String fareId,@JsonKey(name: 'from_stop_id') String fromStopId,@JsonKey(name: 'to_stop_id') String toStopId,@JsonKey(name: 'origin_name_bn') String? originNameBn,@JsonKey(name: 'origin_name_en') String? originNameEn,@JsonKey(name: 'destination_name_bn') String? destinationNameBn,@JsonKey(name: 'destination_name_en') String? destinationNameEn,@JsonKey(name: 'fare_amount') double fareAmount,@JsonKey(name: 'travel_distance_km') double travelDistanceKm,@JsonKey(name: 'route_id') String routeId,@JsonKey(name: 'route_code') String routeCode,@JsonKey(name: 'route_name_bn') String routeNameBn,@JsonKey(name: 'route_name_en') String? routeNameEn,@JsonKey(name: 'route_total_distance') double routeTotalDistance,@JsonKey(name: 'pdf_page_number') int? pdfPage,@JsonKey(name: 'pdf_url') String? pdfUrl,@JsonKey(name: 'btrc_url') String? btrcUrl,@JsonKey(name: 'base_rate') double baseRate,@JsonKey(name: 'min_fare') double minFare
});




}
/// @nodoc
class __$FareResultModelCopyWithImpl<$Res>
    implements _$FareResultModelCopyWith<$Res> {
  __$FareResultModelCopyWithImpl(this._self, this._then);

  final _FareResultModel _self;
  final $Res Function(_FareResultModel) _then;

/// Create a copy of FareResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fareId = null,Object? fromStopId = null,Object? toStopId = null,Object? originNameBn = freezed,Object? originNameEn = freezed,Object? destinationNameBn = freezed,Object? destinationNameEn = freezed,Object? fareAmount = null,Object? travelDistanceKm = null,Object? routeId = null,Object? routeCode = null,Object? routeNameBn = null,Object? routeNameEn = freezed,Object? routeTotalDistance = null,Object? pdfPage = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseRate = null,Object? minFare = null,}) {
  return _then(_FareResultModel(
fareId: null == fareId ? _self.fareId : fareId // ignore: cast_nullable_to_non_nullable
as String,fromStopId: null == fromStopId ? _self.fromStopId : fromStopId // ignore: cast_nullable_to_non_nullable
as String,toStopId: null == toStopId ? _self.toStopId : toStopId // ignore: cast_nullable_to_non_nullable
as String,originNameBn: freezed == originNameBn ? _self.originNameBn : originNameBn // ignore: cast_nullable_to_non_nullable
as String?,originNameEn: freezed == originNameEn ? _self.originNameEn : originNameEn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameBn: freezed == destinationNameBn ? _self.destinationNameBn : destinationNameBn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameEn: freezed == destinationNameEn ? _self.destinationNameEn : destinationNameEn // ignore: cast_nullable_to_non_nullable
as String?,fareAmount: null == fareAmount ? _self.fareAmount : fareAmount // ignore: cast_nullable_to_non_nullable
as double,travelDistanceKm: null == travelDistanceKm ? _self.travelDistanceKm : travelDistanceKm // ignore: cast_nullable_to_non_nullable
as double,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,routeNameBn: null == routeNameBn ? _self.routeNameBn : routeNameBn // ignore: cast_nullable_to_non_nullable
as String,routeNameEn: freezed == routeNameEn ? _self.routeNameEn : routeNameEn // ignore: cast_nullable_to_non_nullable
as String?,routeTotalDistance: null == routeTotalDistance ? _self.routeTotalDistance : routeTotalDistance // ignore: cast_nullable_to_non_nullable
as double,pdfPage: freezed == pdfPage ? _self.pdfPage : pdfPage // ignore: cast_nullable_to_non_nullable
as int?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,btrcUrl: freezed == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String?,baseRate: null == baseRate ? _self.baseRate : baseRate // ignore: cast_nullable_to_non_nullable
as double,minFare: null == minFare ? _self.minFare : minFare // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FareResultEntity {

 String get fareId; double get fareAmount; double get travelDistanceKm; String get fromStopId; String get toStopId;// Localized Names for the header/timeline
 String? get originNameBn; String? get originNameEn; String? get destinationNameBn; String? get destinationNameEn;// Nested Route Info
 String get routeId; String get routeCode; String get routeNameBn; String? get routeNameEn; double get routeTotalDistance; int? get pdfPage; String? get pdfUrl; String? get btrcUrl; double get baseRate; double get minFare;
/// Create a copy of FareResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FareResultEntityCopyWith<FareResultEntity> get copyWith => _$FareResultEntityCopyWithImpl<FareResultEntity>(this as FareResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FareResultEntity&&(identical(other.fareId, fareId) || other.fareId == fareId)&&(identical(other.fareAmount, fareAmount) || other.fareAmount == fareAmount)&&(identical(other.travelDistanceKm, travelDistanceKm) || other.travelDistanceKm == travelDistanceKm)&&(identical(other.fromStopId, fromStopId) || other.fromStopId == fromStopId)&&(identical(other.toStopId, toStopId) || other.toStopId == toStopId)&&(identical(other.originNameBn, originNameBn) || other.originNameBn == originNameBn)&&(identical(other.originNameEn, originNameEn) || other.originNameEn == originNameEn)&&(identical(other.destinationNameBn, destinationNameBn) || other.destinationNameBn == destinationNameBn)&&(identical(other.destinationNameEn, destinationNameEn) || other.destinationNameEn == destinationNameEn)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.routeNameBn, routeNameBn) || other.routeNameBn == routeNameBn)&&(identical(other.routeNameEn, routeNameEn) || other.routeNameEn == routeNameEn)&&(identical(other.routeTotalDistance, routeTotalDistance) || other.routeTotalDistance == routeTotalDistance)&&(identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseRate, baseRate) || other.baseRate == baseRate)&&(identical(other.minFare, minFare) || other.minFare == minFare));
}


@override
int get hashCode => Object.hashAll([runtimeType,fareId,fareAmount,travelDistanceKm,fromStopId,toStopId,originNameBn,originNameEn,destinationNameBn,destinationNameEn,routeId,routeCode,routeNameBn,routeNameEn,routeTotalDistance,pdfPage,pdfUrl,btrcUrl,baseRate,minFare]);

@override
String toString() {
  return 'FareResultEntity(fareId: $fareId, fareAmount: $fareAmount, travelDistanceKm: $travelDistanceKm, fromStopId: $fromStopId, toStopId: $toStopId, originNameBn: $originNameBn, originNameEn: $originNameEn, destinationNameBn: $destinationNameBn, destinationNameEn: $destinationNameEn, routeId: $routeId, routeCode: $routeCode, routeNameBn: $routeNameBn, routeNameEn: $routeNameEn, routeTotalDistance: $routeTotalDistance, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseRate: $baseRate, minFare: $minFare)';
}


}

/// @nodoc
abstract mixin class $FareResultEntityCopyWith<$Res>  {
  factory $FareResultEntityCopyWith(FareResultEntity value, $Res Function(FareResultEntity) _then) = _$FareResultEntityCopyWithImpl;
@useResult
$Res call({
 String fareId, double fareAmount, double travelDistanceKm, String fromStopId, String toStopId, String? originNameBn, String? originNameEn, String? destinationNameBn, String? destinationNameEn, String routeId, String routeCode, String routeNameBn, String? routeNameEn, double routeTotalDistance, int? pdfPage, String? pdfUrl, String? btrcUrl, double baseRate, double minFare
});




}
/// @nodoc
class _$FareResultEntityCopyWithImpl<$Res>
    implements $FareResultEntityCopyWith<$Res> {
  _$FareResultEntityCopyWithImpl(this._self, this._then);

  final FareResultEntity _self;
  final $Res Function(FareResultEntity) _then;

/// Create a copy of FareResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fareId = null,Object? fareAmount = null,Object? travelDistanceKm = null,Object? fromStopId = null,Object? toStopId = null,Object? originNameBn = freezed,Object? originNameEn = freezed,Object? destinationNameBn = freezed,Object? destinationNameEn = freezed,Object? routeId = null,Object? routeCode = null,Object? routeNameBn = null,Object? routeNameEn = freezed,Object? routeTotalDistance = null,Object? pdfPage = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseRate = null,Object? minFare = null,}) {
  return _then(_self.copyWith(
fareId: null == fareId ? _self.fareId : fareId // ignore: cast_nullable_to_non_nullable
as String,fareAmount: null == fareAmount ? _self.fareAmount : fareAmount // ignore: cast_nullable_to_non_nullable
as double,travelDistanceKm: null == travelDistanceKm ? _self.travelDistanceKm : travelDistanceKm // ignore: cast_nullable_to_non_nullable
as double,fromStopId: null == fromStopId ? _self.fromStopId : fromStopId // ignore: cast_nullable_to_non_nullable
as String,toStopId: null == toStopId ? _self.toStopId : toStopId // ignore: cast_nullable_to_non_nullable
as String,originNameBn: freezed == originNameBn ? _self.originNameBn : originNameBn // ignore: cast_nullable_to_non_nullable
as String?,originNameEn: freezed == originNameEn ? _self.originNameEn : originNameEn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameBn: freezed == destinationNameBn ? _self.destinationNameBn : destinationNameBn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameEn: freezed == destinationNameEn ? _self.destinationNameEn : destinationNameEn // ignore: cast_nullable_to_non_nullable
as String?,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [FareResultEntity].
extension FareResultEntityPatterns on FareResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FareResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FareResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FareResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _FareResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FareResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FareResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fareId,  double fareAmount,  double travelDistanceKm,  String fromStopId,  String toStopId,  String? originNameBn,  String? originNameEn,  String? destinationNameBn,  String? destinationNameEn,  String routeId,  String routeCode,  String routeNameBn,  String? routeNameEn,  double routeTotalDistance,  int? pdfPage,  String? pdfUrl,  String? btrcUrl,  double baseRate,  double minFare)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FareResultEntity() when $default != null:
return $default(_that.fareId,_that.fareAmount,_that.travelDistanceKm,_that.fromStopId,_that.toStopId,_that.originNameBn,_that.originNameEn,_that.destinationNameBn,_that.destinationNameEn,_that.routeId,_that.routeCode,_that.routeNameBn,_that.routeNameEn,_that.routeTotalDistance,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.baseRate,_that.minFare);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fareId,  double fareAmount,  double travelDistanceKm,  String fromStopId,  String toStopId,  String? originNameBn,  String? originNameEn,  String? destinationNameBn,  String? destinationNameEn,  String routeId,  String routeCode,  String routeNameBn,  String? routeNameEn,  double routeTotalDistance,  int? pdfPage,  String? pdfUrl,  String? btrcUrl,  double baseRate,  double minFare)  $default,) {final _that = this;
switch (_that) {
case _FareResultEntity():
return $default(_that.fareId,_that.fareAmount,_that.travelDistanceKm,_that.fromStopId,_that.toStopId,_that.originNameBn,_that.originNameEn,_that.destinationNameBn,_that.destinationNameEn,_that.routeId,_that.routeCode,_that.routeNameBn,_that.routeNameEn,_that.routeTotalDistance,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.baseRate,_that.minFare);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fareId,  double fareAmount,  double travelDistanceKm,  String fromStopId,  String toStopId,  String? originNameBn,  String? originNameEn,  String? destinationNameBn,  String? destinationNameEn,  String routeId,  String routeCode,  String routeNameBn,  String? routeNameEn,  double routeTotalDistance,  int? pdfPage,  String? pdfUrl,  String? btrcUrl,  double baseRate,  double minFare)?  $default,) {final _that = this;
switch (_that) {
case _FareResultEntity() when $default != null:
return $default(_that.fareId,_that.fareAmount,_that.travelDistanceKm,_that.fromStopId,_that.toStopId,_that.originNameBn,_that.originNameEn,_that.destinationNameBn,_that.destinationNameEn,_that.routeId,_that.routeCode,_that.routeNameBn,_that.routeNameEn,_that.routeTotalDistance,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.baseRate,_that.minFare);case _:
  return null;

}
}

}

/// @nodoc


class _FareResultEntity implements FareResultEntity {
  const _FareResultEntity({required this.fareId, required this.fareAmount, required this.travelDistanceKm, required this.fromStopId, required this.toStopId, required this.originNameBn, required this.originNameEn, required this.destinationNameBn, required this.destinationNameEn, required this.routeId, required this.routeCode, required this.routeNameBn, this.routeNameEn, required this.routeTotalDistance, required this.pdfPage, required this.pdfUrl, required this.btrcUrl, required this.baseRate, required this.minFare});
  

@override final  String fareId;
@override final  double fareAmount;
@override final  double travelDistanceKm;
@override final  String fromStopId;
@override final  String toStopId;
// Localized Names for the header/timeline
@override final  String? originNameBn;
@override final  String? originNameEn;
@override final  String? destinationNameBn;
@override final  String? destinationNameEn;
// Nested Route Info
@override final  String routeId;
@override final  String routeCode;
@override final  String routeNameBn;
@override final  String? routeNameEn;
@override final  double routeTotalDistance;
@override final  int? pdfPage;
@override final  String? pdfUrl;
@override final  String? btrcUrl;
@override final  double baseRate;
@override final  double minFare;

/// Create a copy of FareResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FareResultEntityCopyWith<_FareResultEntity> get copyWith => __$FareResultEntityCopyWithImpl<_FareResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FareResultEntity&&(identical(other.fareId, fareId) || other.fareId == fareId)&&(identical(other.fareAmount, fareAmount) || other.fareAmount == fareAmount)&&(identical(other.travelDistanceKm, travelDistanceKm) || other.travelDistanceKm == travelDistanceKm)&&(identical(other.fromStopId, fromStopId) || other.fromStopId == fromStopId)&&(identical(other.toStopId, toStopId) || other.toStopId == toStopId)&&(identical(other.originNameBn, originNameBn) || other.originNameBn == originNameBn)&&(identical(other.originNameEn, originNameEn) || other.originNameEn == originNameEn)&&(identical(other.destinationNameBn, destinationNameBn) || other.destinationNameBn == destinationNameBn)&&(identical(other.destinationNameEn, destinationNameEn) || other.destinationNameEn == destinationNameEn)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.routeNameBn, routeNameBn) || other.routeNameBn == routeNameBn)&&(identical(other.routeNameEn, routeNameEn) || other.routeNameEn == routeNameEn)&&(identical(other.routeTotalDistance, routeTotalDistance) || other.routeTotalDistance == routeTotalDistance)&&(identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseRate, baseRate) || other.baseRate == baseRate)&&(identical(other.minFare, minFare) || other.minFare == minFare));
}


@override
int get hashCode => Object.hashAll([runtimeType,fareId,fareAmount,travelDistanceKm,fromStopId,toStopId,originNameBn,originNameEn,destinationNameBn,destinationNameEn,routeId,routeCode,routeNameBn,routeNameEn,routeTotalDistance,pdfPage,pdfUrl,btrcUrl,baseRate,minFare]);

@override
String toString() {
  return 'FareResultEntity(fareId: $fareId, fareAmount: $fareAmount, travelDistanceKm: $travelDistanceKm, fromStopId: $fromStopId, toStopId: $toStopId, originNameBn: $originNameBn, originNameEn: $originNameEn, destinationNameBn: $destinationNameBn, destinationNameEn: $destinationNameEn, routeId: $routeId, routeCode: $routeCode, routeNameBn: $routeNameBn, routeNameEn: $routeNameEn, routeTotalDistance: $routeTotalDistance, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseRate: $baseRate, minFare: $minFare)';
}


}

/// @nodoc
abstract mixin class _$FareResultEntityCopyWith<$Res> implements $FareResultEntityCopyWith<$Res> {
  factory _$FareResultEntityCopyWith(_FareResultEntity value, $Res Function(_FareResultEntity) _then) = __$FareResultEntityCopyWithImpl;
@override @useResult
$Res call({
 String fareId, double fareAmount, double travelDistanceKm, String fromStopId, String toStopId, String? originNameBn, String? originNameEn, String? destinationNameBn, String? destinationNameEn, String routeId, String routeCode, String routeNameBn, String? routeNameEn, double routeTotalDistance, int? pdfPage, String? pdfUrl, String? btrcUrl, double baseRate, double minFare
});




}
/// @nodoc
class __$FareResultEntityCopyWithImpl<$Res>
    implements _$FareResultEntityCopyWith<$Res> {
  __$FareResultEntityCopyWithImpl(this._self, this._then);

  final _FareResultEntity _self;
  final $Res Function(_FareResultEntity) _then;

/// Create a copy of FareResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fareId = null,Object? fareAmount = null,Object? travelDistanceKm = null,Object? fromStopId = null,Object? toStopId = null,Object? originNameBn = freezed,Object? originNameEn = freezed,Object? destinationNameBn = freezed,Object? destinationNameEn = freezed,Object? routeId = null,Object? routeCode = null,Object? routeNameBn = null,Object? routeNameEn = freezed,Object? routeTotalDistance = null,Object? pdfPage = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseRate = null,Object? minFare = null,}) {
  return _then(_FareResultEntity(
fareId: null == fareId ? _self.fareId : fareId // ignore: cast_nullable_to_non_nullable
as String,fareAmount: null == fareAmount ? _self.fareAmount : fareAmount // ignore: cast_nullable_to_non_nullable
as double,travelDistanceKm: null == travelDistanceKm ? _self.travelDistanceKm : travelDistanceKm // ignore: cast_nullable_to_non_nullable
as double,fromStopId: null == fromStopId ? _self.fromStopId : fromStopId // ignore: cast_nullable_to_non_nullable
as String,toStopId: null == toStopId ? _self.toStopId : toStopId // ignore: cast_nullable_to_non_nullable
as String,originNameBn: freezed == originNameBn ? _self.originNameBn : originNameBn // ignore: cast_nullable_to_non_nullable
as String?,originNameEn: freezed == originNameEn ? _self.originNameEn : originNameEn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameBn: freezed == destinationNameBn ? _self.destinationNameBn : destinationNameBn // ignore: cast_nullable_to_non_nullable
as String?,destinationNameEn: freezed == destinationNameEn ? _self.destinationNameEn : destinationNameEn // ignore: cast_nullable_to_non_nullable
as String?,routeId: null == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
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

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteEntity {

 String get id; String get routeCode; String get nameBn; String? get nameEn; double get totalDistance; String get documentId; int get pdfPage; String get pdfUrl; String get btrcUrl;// --- New Verification & Analytical Fields ---
 String get issuedDate; double get baseRate; int get minFare; String? get notes;
/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteEntityCopyWith<RouteEntity> get copyWith => _$RouteEntityCopyWithImpl<RouteEntity>(this as RouteEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&(identical(other.baseRate, baseRate) || other.baseRate == baseRate)&&(identical(other.minFare, minFare) || other.minFare == minFare)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistance,documentId,pdfPage,pdfUrl,btrcUrl,issuedDate,baseRate,minFare,notes);

@override
String toString() {
  return 'RouteEntity(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistance: $totalDistance, documentId: $documentId, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, issuedDate: $issuedDate, baseRate: $baseRate, minFare: $minFare, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $RouteEntityCopyWith<$Res>  {
  factory $RouteEntityCopyWith(RouteEntity value, $Res Function(RouteEntity) _then) = _$RouteEntityCopyWithImpl;
@useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistance, String documentId, int pdfPage, String pdfUrl, String btrcUrl, String issuedDate, double baseRate, int minFare, String? notes
});




}
/// @nodoc
class _$RouteEntityCopyWithImpl<$Res>
    implements $RouteEntityCopyWith<$Res> {
  _$RouteEntityCopyWithImpl(this._self, this._then);

  final RouteEntity _self;
  final $Res Function(RouteEntity) _then;

/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistance = null,Object? documentId = null,Object? pdfPage = null,Object? pdfUrl = null,Object? btrcUrl = null,Object? issuedDate = null,Object? baseRate = null,Object? minFare = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,pdfPage: null == pdfPage ? _self.pdfPage : pdfPage // ignore: cast_nullable_to_non_nullable
as int,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,btrcUrl: null == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String,issuedDate: null == issuedDate ? _self.issuedDate : issuedDate // ignore: cast_nullable_to_non_nullable
as String,baseRate: null == baseRate ? _self.baseRate : baseRate // ignore: cast_nullable_to_non_nullable
as double,minFare: null == minFare ? _self.minFare : minFare // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteEntity].
extension RouteEntityPatterns on RouteEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteEntity value)  $default,){
final _that = this;
switch (_that) {
case _RouteEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistance,  String documentId,  int pdfPage,  String pdfUrl,  String btrcUrl,  String issuedDate,  double baseRate,  int minFare,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistance,_that.documentId,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.issuedDate,_that.baseRate,_that.minFare,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistance,  String documentId,  int pdfPage,  String pdfUrl,  String btrcUrl,  String issuedDate,  double baseRate,  int minFare,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _RouteEntity():
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistance,_that.documentId,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.issuedDate,_that.baseRate,_that.minFare,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistance,  String documentId,  int pdfPage,  String pdfUrl,  String btrcUrl,  String issuedDate,  double baseRate,  int minFare,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _RouteEntity() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistance,_that.documentId,_that.pdfPage,_that.pdfUrl,_that.btrcUrl,_that.issuedDate,_that.baseRate,_that.minFare,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _RouteEntity implements RouteEntity {
  const _RouteEntity({required this.id, required this.routeCode, required this.nameBn, this.nameEn, required this.totalDistance, required this.documentId, required this.pdfPage, required this.pdfUrl, required this.btrcUrl, required this.issuedDate, required this.baseRate, required this.minFare, this.notes});
  

@override final  String id;
@override final  String routeCode;
@override final  String nameBn;
@override final  String? nameEn;
@override final  double totalDistance;
@override final  String documentId;
@override final  int pdfPage;
@override final  String pdfUrl;
@override final  String btrcUrl;
// --- New Verification & Analytical Fields ---
@override final  String issuedDate;
@override final  double baseRate;
@override final  int minFare;
@override final  String? notes;

/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteEntityCopyWith<_RouteEntity> get copyWith => __$RouteEntityCopyWithImpl<_RouteEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&(identical(other.baseRate, baseRate) || other.baseRate == baseRate)&&(identical(other.minFare, minFare) || other.minFare == minFare)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistance,documentId,pdfPage,pdfUrl,btrcUrl,issuedDate,baseRate,minFare,notes);

@override
String toString() {
  return 'RouteEntity(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistance: $totalDistance, documentId: $documentId, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, issuedDate: $issuedDate, baseRate: $baseRate, minFare: $minFare, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$RouteEntityCopyWith<$Res> implements $RouteEntityCopyWith<$Res> {
  factory _$RouteEntityCopyWith(_RouteEntity value, $Res Function(_RouteEntity) _then) = __$RouteEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistance, String documentId, int pdfPage, String pdfUrl, String btrcUrl, String issuedDate, double baseRate, int minFare, String? notes
});




}
/// @nodoc
class __$RouteEntityCopyWithImpl<$Res>
    implements _$RouteEntityCopyWith<$Res> {
  __$RouteEntityCopyWithImpl(this._self, this._then);

  final _RouteEntity _self;
  final $Res Function(_RouteEntity) _then;

/// Create a copy of RouteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistance = null,Object? documentId = null,Object? pdfPage = null,Object? pdfUrl = null,Object? btrcUrl = null,Object? issuedDate = null,Object? baseRate = null,Object? minFare = null,Object? notes = freezed,}) {
  return _then(_RouteEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,pdfPage: null == pdfPage ? _self.pdfPage : pdfPage // ignore: cast_nullable_to_non_nullable
as int,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,btrcUrl: null == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String,issuedDate: null == issuedDate ? _self.issuedDate : issuedDate // ignore: cast_nullable_to_non_nullable
as String,baseRate: null == baseRate ? _self.baseRate : baseRate // ignore: cast_nullable_to_non_nullable
as double,minFare: null == minFare ? _self.minFare : minFare // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

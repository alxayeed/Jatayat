// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteModel {

 String get id; String get routeCode; String get nameBn; String? get nameEn; double get totalDistanceKm; String get documentId; int get pdfPageNumber; Map<String, dynamic> get documents;
/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteModelCopyWith<RouteModel> get copyWith => _$RouteModelCopyWithImpl<RouteModel>(this as RouteModel, _$identity);

  /// Serializes this RouteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistanceKm, totalDistanceKm) || other.totalDistanceKm == totalDistanceKm)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.pdfPageNumber, pdfPageNumber) || other.pdfPageNumber == pdfPageNumber)&&const DeepCollectionEquality().equals(other.documents, documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistanceKm,documentId,pdfPageNumber,const DeepCollectionEquality().hash(documents));

@override
String toString() {
  return 'RouteModel(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, documentId: $documentId, pdfPageNumber: $pdfPageNumber, documents: $documents)';
}


}

/// @nodoc
abstract mixin class $RouteModelCopyWith<$Res>  {
  factory $RouteModelCopyWith(RouteModel value, $Res Function(RouteModel) _then) = _$RouteModelCopyWithImpl;
@useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistanceKm, String documentId, int pdfPageNumber, Map<String, dynamic> documents
});




}
/// @nodoc
class _$RouteModelCopyWithImpl<$Res>
    implements $RouteModelCopyWith<$Res> {
  _$RouteModelCopyWithImpl(this._self, this._then);

  final RouteModel _self;
  final $Res Function(RouteModel) _then;

/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistanceKm = null,Object? documentId = null,Object? pdfPageNumber = null,Object? documents = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,totalDistanceKm: null == totalDistanceKm ? _self.totalDistanceKm : totalDistanceKm // ignore: cast_nullable_to_non_nullable
as double,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,pdfPageNumber: null == pdfPageNumber ? _self.pdfPageNumber : pdfPageNumber // ignore: cast_nullable_to_non_nullable
as int,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteModel].
extension RouteModelPatterns on RouteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  String documentId,  int pdfPageNumber,  Map<String, dynamic> documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.documentId,_that.pdfPageNumber,_that.documents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  String documentId,  int pdfPageNumber,  Map<String, dynamic> documents)  $default,) {final _that = this;
switch (_that) {
case _RouteModel():
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.documentId,_that.pdfPageNumber,_that.documents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  String documentId,  int pdfPageNumber,  Map<String, dynamic> documents)?  $default,) {final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.documentId,_that.pdfPageNumber,_that.documents);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _RouteModel extends RouteModel {
  const _RouteModel({required this.id, required this.routeCode, required this.nameBn, this.nameEn, required this.totalDistanceKm, required this.documentId, required this.pdfPageNumber, required final  Map<String, dynamic> documents}): _documents = documents,super._();
  factory _RouteModel.fromJson(Map<String, dynamic> json) => _$RouteModelFromJson(json);

@override final  String id;
@override final  String routeCode;
@override final  String nameBn;
@override final  String? nameEn;
@override final  double totalDistanceKm;
@override final  String documentId;
@override final  int pdfPageNumber;
 final  Map<String, dynamic> _documents;
@override Map<String, dynamic> get documents {
  if (_documents is EqualUnmodifiableMapView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_documents);
}


/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteModelCopyWith<_RouteModel> get copyWith => __$RouteModelCopyWithImpl<_RouteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistanceKm, totalDistanceKm) || other.totalDistanceKm == totalDistanceKm)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.pdfPageNumber, pdfPageNumber) || other.pdfPageNumber == pdfPageNumber)&&const DeepCollectionEquality().equals(other._documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistanceKm,documentId,pdfPageNumber,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'RouteModel(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, documentId: $documentId, pdfPageNumber: $pdfPageNumber, documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$RouteModelCopyWith<$Res> implements $RouteModelCopyWith<$Res> {
  factory _$RouteModelCopyWith(_RouteModel value, $Res Function(_RouteModel) _then) = __$RouteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistanceKm, String documentId, int pdfPageNumber, Map<String, dynamic> documents
});




}
/// @nodoc
class __$RouteModelCopyWithImpl<$Res>
    implements _$RouteModelCopyWith<$Res> {
  __$RouteModelCopyWithImpl(this._self, this._then);

  final _RouteModel _self;
  final $Res Function(_RouteModel) _then;

/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistanceKm = null,Object? documentId = null,Object? pdfPageNumber = null,Object? documents = null,}) {
  return _then(_RouteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,totalDistanceKm: null == totalDistanceKm ? _self.totalDistanceKm : totalDistanceKm // ignore: cast_nullable_to_non_nullable
as double,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,pdfPageNumber: null == pdfPageNumber ? _self.pdfPageNumber : pdfPageNumber // ignore: cast_nullable_to_non_nullable
as int,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on

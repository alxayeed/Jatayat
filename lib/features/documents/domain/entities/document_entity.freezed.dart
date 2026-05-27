// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DocumentEntity {

 String get id; String get title; String get btrcUrl; DateTime get createdAt; String get versionName; String get pdfUrl; String? get region; String? get notes;
/// Create a copy of DocumentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentEntityCopyWith<DocumentEntity> get copyWith => _$DocumentEntityCopyWithImpl<DocumentEntity>(this as DocumentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.region, region) || other.region == region)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,btrcUrl,createdAt,versionName,pdfUrl,region,notes);

@override
String toString() {
  return 'DocumentEntity(id: $id, title: $title, btrcUrl: $btrcUrl, createdAt: $createdAt, versionName: $versionName, pdfUrl: $pdfUrl, region: $region, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $DocumentEntityCopyWith<$Res>  {
  factory $DocumentEntityCopyWith(DocumentEntity value, $Res Function(DocumentEntity) _then) = _$DocumentEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String btrcUrl, DateTime createdAt, String versionName, String pdfUrl, String? region, String? notes
});




}
/// @nodoc
class _$DocumentEntityCopyWithImpl<$Res>
    implements $DocumentEntityCopyWith<$Res> {
  _$DocumentEntityCopyWithImpl(this._self, this._then);

  final DocumentEntity _self;
  final $Res Function(DocumentEntity) _then;

/// Create a copy of DocumentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? btrcUrl = null,Object? createdAt = null,Object? versionName = null,Object? pdfUrl = null,Object? region = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,btrcUrl: null == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentEntity].
extension DocumentEntityPatterns on DocumentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentEntity value)  $default,){
final _that = this;
switch (_that) {
case _DocumentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String btrcUrl,  DateTime createdAt,  String versionName,  String pdfUrl,  String? region,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentEntity() when $default != null:
return $default(_that.id,_that.title,_that.btrcUrl,_that.createdAt,_that.versionName,_that.pdfUrl,_that.region,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String btrcUrl,  DateTime createdAt,  String versionName,  String pdfUrl,  String? region,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _DocumentEntity():
return $default(_that.id,_that.title,_that.btrcUrl,_that.createdAt,_that.versionName,_that.pdfUrl,_that.region,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String btrcUrl,  DateTime createdAt,  String versionName,  String pdfUrl,  String? region,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _DocumentEntity() when $default != null:
return $default(_that.id,_that.title,_that.btrcUrl,_that.createdAt,_that.versionName,_that.pdfUrl,_that.region,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _DocumentEntity implements DocumentEntity {
  const _DocumentEntity({required this.id, required this.title, required this.btrcUrl, required this.createdAt, required this.versionName, required this.pdfUrl, this.region, this.notes});
  

@override final  String id;
@override final  String title;
@override final  String btrcUrl;
@override final  DateTime createdAt;
@override final  String versionName;
@override final  String pdfUrl;
@override final  String? region;
@override final  String? notes;

/// Create a copy of DocumentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentEntityCopyWith<_DocumentEntity> get copyWith => __$DocumentEntityCopyWithImpl<_DocumentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.region, region) || other.region == region)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,btrcUrl,createdAt,versionName,pdfUrl,region,notes);

@override
String toString() {
  return 'DocumentEntity(id: $id, title: $title, btrcUrl: $btrcUrl, createdAt: $createdAt, versionName: $versionName, pdfUrl: $pdfUrl, region: $region, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DocumentEntityCopyWith<$Res> implements $DocumentEntityCopyWith<$Res> {
  factory _$DocumentEntityCopyWith(_DocumentEntity value, $Res Function(_DocumentEntity) _then) = __$DocumentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String btrcUrl, DateTime createdAt, String versionName, String pdfUrl, String? region, String? notes
});




}
/// @nodoc
class __$DocumentEntityCopyWithImpl<$Res>
    implements _$DocumentEntityCopyWith<$Res> {
  __$DocumentEntityCopyWithImpl(this._self, this._then);

  final _DocumentEntity _self;
  final $Res Function(_DocumentEntity) _then;

/// Create a copy of DocumentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? btrcUrl = null,Object? createdAt = null,Object? versionName = null,Object? pdfUrl = null,Object? region = freezed,Object? notes = freezed,}) {
  return _then(_DocumentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,btrcUrl: null == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

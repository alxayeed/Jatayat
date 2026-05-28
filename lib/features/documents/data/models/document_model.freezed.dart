// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentModel {

 String get id; String get title;@JsonKey(name: 'btrc_url') String? get btrcUrl;@JsonKey(name: 'pdf_url') String get pdfUrl;// Added
@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'version_name') String get versionName; String? get region;// Added (Nullable)
 String? get notes;
/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentModelCopyWith<DocumentModel> get copyWith => _$DocumentModelCopyWithImpl<DocumentModel>(this as DocumentModel, _$identity);

  /// Serializes this DocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.region, region) || other.region == region)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,btrcUrl,pdfUrl,createdAt,versionName,region,notes);

@override
String toString() {
  return 'DocumentModel(id: $id, title: $title, btrcUrl: $btrcUrl, pdfUrl: $pdfUrl, createdAt: $createdAt, versionName: $versionName, region: $region, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $DocumentModelCopyWith<$Res>  {
  factory $DocumentModelCopyWith(DocumentModel value, $Res Function(DocumentModel) _then) = _$DocumentModelCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'btrc_url') String? btrcUrl,@JsonKey(name: 'pdf_url') String pdfUrl,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'version_name') String versionName, String? region, String? notes
});




}
/// @nodoc
class _$DocumentModelCopyWithImpl<$Res>
    implements $DocumentModelCopyWith<$Res> {
  _$DocumentModelCopyWithImpl(this._self, this._then);

  final DocumentModel _self;
  final $Res Function(DocumentModel) _then;

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? btrcUrl = freezed,Object? pdfUrl = null,Object? createdAt = null,Object? versionName = null,Object? region = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,btrcUrl: freezed == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentModel].
extension DocumentModelPatterns on DocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _DocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'btrc_url')  String? btrcUrl, @JsonKey(name: 'pdf_url')  String pdfUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'version_name')  String versionName,  String? region,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
return $default(_that.id,_that.title,_that.btrcUrl,_that.pdfUrl,_that.createdAt,_that.versionName,_that.region,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'btrc_url')  String? btrcUrl, @JsonKey(name: 'pdf_url')  String pdfUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'version_name')  String versionName,  String? region,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _DocumentModel():
return $default(_that.id,_that.title,_that.btrcUrl,_that.pdfUrl,_that.createdAt,_that.versionName,_that.region,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'btrc_url')  String? btrcUrl, @JsonKey(name: 'pdf_url')  String pdfUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'version_name')  String versionName,  String? region,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
return $default(_that.id,_that.title,_that.btrcUrl,_that.pdfUrl,_that.createdAt,_that.versionName,_that.region,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentModel extends DocumentModel {
  const _DocumentModel({required this.id, required this.title, @JsonKey(name: 'btrc_url') this.btrcUrl, @JsonKey(name: 'pdf_url') required this.pdfUrl, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'version_name') required this.versionName, this.region, this.notes}): super._();
  factory _DocumentModel.fromJson(Map<String, dynamic> json) => _$DocumentModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'btrc_url') final  String? btrcUrl;
@override@JsonKey(name: 'pdf_url') final  String pdfUrl;
// Added
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'version_name') final  String versionName;
@override final  String? region;
// Added (Nullable)
@override final  String? notes;

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentModelCopyWith<_DocumentModel> get copyWith => __$DocumentModelCopyWithImpl<_DocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.region, region) || other.region == region)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,btrcUrl,pdfUrl,createdAt,versionName,region,notes);

@override
String toString() {
  return 'DocumentModel(id: $id, title: $title, btrcUrl: $btrcUrl, pdfUrl: $pdfUrl, createdAt: $createdAt, versionName: $versionName, region: $region, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DocumentModelCopyWith<$Res> implements $DocumentModelCopyWith<$Res> {
  factory _$DocumentModelCopyWith(_DocumentModel value, $Res Function(_DocumentModel) _then) = __$DocumentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'btrc_url') String? btrcUrl,@JsonKey(name: 'pdf_url') String pdfUrl,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'version_name') String versionName, String? region, String? notes
});




}
/// @nodoc
class __$DocumentModelCopyWithImpl<$Res>
    implements _$DocumentModelCopyWith<$Res> {
  __$DocumentModelCopyWithImpl(this._self, this._then);

  final _DocumentModel _self;
  final $Res Function(_DocumentModel) _then;

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? btrcUrl = freezed,Object? pdfUrl = null,Object? createdAt = null,Object? versionName = null,Object? region = freezed,Object? notes = freezed,}) {
  return _then(_DocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,btrcUrl: freezed == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

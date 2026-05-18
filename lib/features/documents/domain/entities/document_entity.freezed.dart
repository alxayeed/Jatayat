// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DocumentEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get btrcUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get versionName => throw _privateConstructorUsedError;
  String get pdfUrl => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentEntityCopyWith<DocumentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentEntityCopyWith<$Res> {
  factory $DocumentEntityCopyWith(
    DocumentEntity value,
    $Res Function(DocumentEntity) then,
  ) = _$DocumentEntityCopyWithImpl<$Res, DocumentEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String btrcUrl,
    DateTime createdAt,
    String versionName,
    String pdfUrl,
    String? region,
    String? notes,
  });
}

/// @nodoc
class _$DocumentEntityCopyWithImpl<$Res, $Val extends DocumentEntity>
    implements $DocumentEntityCopyWith<$Res> {
  _$DocumentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? btrcUrl = null,
    Object? createdAt = null,
    Object? versionName = null,
    Object? pdfUrl = null,
    Object? region = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            btrcUrl: null == btrcUrl
                ? _value.btrcUrl
                : btrcUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            versionName: null == versionName
                ? _value.versionName
                : versionName // ignore: cast_nullable_to_non_nullable
                      as String,
            pdfUrl: null == pdfUrl
                ? _value.pdfUrl
                : pdfUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocumentEntityImplCopyWith<$Res>
    implements $DocumentEntityCopyWith<$Res> {
  factory _$$DocumentEntityImplCopyWith(
    _$DocumentEntityImpl value,
    $Res Function(_$DocumentEntityImpl) then,
  ) = __$$DocumentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String btrcUrl,
    DateTime createdAt,
    String versionName,
    String pdfUrl,
    String? region,
    String? notes,
  });
}

/// @nodoc
class __$$DocumentEntityImplCopyWithImpl<$Res>
    extends _$DocumentEntityCopyWithImpl<$Res, _$DocumentEntityImpl>
    implements _$$DocumentEntityImplCopyWith<$Res> {
  __$$DocumentEntityImplCopyWithImpl(
    _$DocumentEntityImpl _value,
    $Res Function(_$DocumentEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? btrcUrl = null,
    Object? createdAt = null,
    Object? versionName = null,
    Object? pdfUrl = null,
    Object? region = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$DocumentEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        btrcUrl: null == btrcUrl
            ? _value.btrcUrl
            : btrcUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        versionName: null == versionName
            ? _value.versionName
            : versionName // ignore: cast_nullable_to_non_nullable
                  as String,
        pdfUrl: null == pdfUrl
            ? _value.pdfUrl
            : pdfUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DocumentEntityImpl implements _DocumentEntity {
  const _$DocumentEntityImpl({
    required this.id,
    required this.title,
    required this.btrcUrl,
    required this.createdAt,
    required this.versionName,
    required this.pdfUrl,
    this.region,
    this.notes,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final String btrcUrl;
  @override
  final DateTime createdAt;
  @override
  final String versionName;
  @override
  final String pdfUrl;
  @override
  final String? region;
  @override
  final String? notes;

  @override
  String toString() {
    return 'DocumentEntity(id: $id, title: $title, btrcUrl: $btrcUrl, createdAt: $createdAt, versionName: $versionName, pdfUrl: $pdfUrl, region: $region, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.versionName, versionName) ||
                other.versionName == versionName) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    btrcUrl,
    createdAt,
    versionName,
    pdfUrl,
    region,
    notes,
  );

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentEntityImplCopyWith<_$DocumentEntityImpl> get copyWith =>
      __$$DocumentEntityImplCopyWithImpl<_$DocumentEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _DocumentEntity implements DocumentEntity {
  const factory _DocumentEntity({
    required final String id,
    required final String title,
    required final String btrcUrl,
    required final DateTime createdAt,
    required final String versionName,
    required final String pdfUrl,
    final String? region,
    final String? notes,
  }) = _$DocumentEntityImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get btrcUrl;
  @override
  DateTime get createdAt;
  @override
  String get versionName;
  @override
  String get pdfUrl;
  @override
  String? get region;
  @override
  String? get notes;

  /// Create a copy of DocumentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentEntityImplCopyWith<_$DocumentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StopEntity {
  String get id => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;

  /// Create a copy of StopEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StopEntityCopyWith<StopEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopEntityCopyWith<$Res> {
  factory $StopEntityCopyWith(
    StopEntity value,
    $Res Function(StopEntity) then,
  ) = _$StopEntityCopyWithImpl<$Res, StopEntity>;
  @useResult
  $Res call({String id, String nameBn, String nameEn});
}

/// @nodoc
class _$StopEntityCopyWithImpl<$Res, $Val extends StopEntity>
    implements $StopEntityCopyWith<$Res> {
  _$StopEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StopEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? nameBn = null, Object? nameEn = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            nameBn: null == nameBn
                ? _value.nameBn
                : nameBn // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEn: null == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StopEntityImplCopyWith<$Res>
    implements $StopEntityCopyWith<$Res> {
  factory _$$StopEntityImplCopyWith(
    _$StopEntityImpl value,
    $Res Function(_$StopEntityImpl) then,
  ) = __$$StopEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nameBn, String nameEn});
}

/// @nodoc
class __$$StopEntityImplCopyWithImpl<$Res>
    extends _$StopEntityCopyWithImpl<$Res, _$StopEntityImpl>
    implements _$$StopEntityImplCopyWith<$Res> {
  __$$StopEntityImplCopyWithImpl(
    _$StopEntityImpl _value,
    $Res Function(_$StopEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StopEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? nameBn = null, Object? nameEn = null}) {
    return _then(
      _$StopEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        nameBn: null == nameBn
            ? _value.nameBn
            : nameBn // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StopEntityImpl implements _StopEntity {
  const _$StopEntityImpl({
    required this.id,
    required this.nameBn,
    required this.nameEn,
  });

  @override
  final String id;
  @override
  final String nameBn;
  @override
  final String nameEn;

  @override
  String toString() {
    return 'StopEntity(id: $id, nameBn: $nameBn, nameEn: $nameEn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nameBn, nameEn);

  /// Create a copy of StopEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopEntityImplCopyWith<_$StopEntityImpl> get copyWith =>
      __$$StopEntityImplCopyWithImpl<_$StopEntityImpl>(this, _$identity);
}

abstract class _StopEntity implements StopEntity {
  const factory _StopEntity({
    required final String id,
    required final String nameBn,
    required final String nameEn,
  }) = _$StopEntityImpl;

  @override
  String get id;
  @override
  String get nameBn;
  @override
  String get nameEn;

  /// Create a copy of StopEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopEntityImplCopyWith<_$StopEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

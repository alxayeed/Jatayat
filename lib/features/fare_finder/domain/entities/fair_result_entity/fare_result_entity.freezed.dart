// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FareResultEntity {
  double get officialFare => throw _privateConstructorUsedError;
  double get calculatedFare => throw _privateConstructorUsedError;
  RouteEntity get route => throw _privateConstructorUsedError;

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FareResultEntityCopyWith<FareResultEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FareResultEntityCopyWith<$Res> {
  factory $FareResultEntityCopyWith(
    FareResultEntity value,
    $Res Function(FareResultEntity) then,
  ) = _$FareResultEntityCopyWithImpl<$Res, FareResultEntity>;
  @useResult
  $Res call({double officialFare, double calculatedFare, RouteEntity route});

  $RouteEntityCopyWith<$Res> get route;
}

/// @nodoc
class _$FareResultEntityCopyWithImpl<$Res, $Val extends FareResultEntity>
    implements $FareResultEntityCopyWith<$Res> {
  _$FareResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialFare = null,
    Object? calculatedFare = null,
    Object? route = null,
  }) {
    return _then(
      _value.copyWith(
            officialFare: null == officialFare
                ? _value.officialFare
                : officialFare // ignore: cast_nullable_to_non_nullable
                      as double,
            calculatedFare: null == calculatedFare
                ? _value.calculatedFare
                : calculatedFare // ignore: cast_nullable_to_non_nullable
                      as double,
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as RouteEntity,
          )
          as $Val,
    );
  }

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteEntityCopyWith<$Res> get route {
    return $RouteEntityCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FareResultEntityImplCopyWith<$Res>
    implements $FareResultEntityCopyWith<$Res> {
  factory _$$FareResultEntityImplCopyWith(
    _$FareResultEntityImpl value,
    $Res Function(_$FareResultEntityImpl) then,
  ) = __$$FareResultEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double officialFare, double calculatedFare, RouteEntity route});

  @override
  $RouteEntityCopyWith<$Res> get route;
}

/// @nodoc
class __$$FareResultEntityImplCopyWithImpl<$Res>
    extends _$FareResultEntityCopyWithImpl<$Res, _$FareResultEntityImpl>
    implements _$$FareResultEntityImplCopyWith<$Res> {
  __$$FareResultEntityImplCopyWithImpl(
    _$FareResultEntityImpl _value,
    $Res Function(_$FareResultEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialFare = null,
    Object? calculatedFare = null,
    Object? route = null,
  }) {
    return _then(
      _$FareResultEntityImpl(
        officialFare: null == officialFare
            ? _value.officialFare
            : officialFare // ignore: cast_nullable_to_non_nullable
                  as double,
        calculatedFare: null == calculatedFare
            ? _value.calculatedFare
            : calculatedFare // ignore: cast_nullable_to_non_nullable
                  as double,
        route: null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as RouteEntity,
      ),
    );
  }
}

/// @nodoc

class _$FareResultEntityImpl implements _FareResultEntity {
  const _$FareResultEntityImpl({
    required this.officialFare,
    required this.calculatedFare,
    required this.route,
  });

  @override
  final double officialFare;
  @override
  final double calculatedFare;
  @override
  final RouteEntity route;

  @override
  String toString() {
    return 'FareResultEntity(officialFare: $officialFare, calculatedFare: $calculatedFare, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FareResultEntityImpl &&
            (identical(other.officialFare, officialFare) ||
                other.officialFare == officialFare) &&
            (identical(other.calculatedFare, calculatedFare) ||
                other.calculatedFare == calculatedFare) &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, officialFare, calculatedFare, route);

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FareResultEntityImplCopyWith<_$FareResultEntityImpl> get copyWith =>
      __$$FareResultEntityImplCopyWithImpl<_$FareResultEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _FareResultEntity implements FareResultEntity {
  const factory _FareResultEntity({
    required final double officialFare,
    required final double calculatedFare,
    required final RouteEntity route,
  }) = _$FareResultEntityImpl;

  @override
  double get officialFare;
  @override
  double get calculatedFare;
  @override
  RouteEntity get route;

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FareResultEntityImplCopyWith<_$FareResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

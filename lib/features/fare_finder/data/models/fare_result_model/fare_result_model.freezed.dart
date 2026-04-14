// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FareResultModel _$FareResultModelFromJson(Map<String, dynamic> json) {
  return _FareResultModel.fromJson(json);
}

/// @nodoc
mixin _$FareResultModel {
  @JsonKey(name: 'fare_amount')
  double get officialFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'calculated_amount')
  double get calculatedFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'routes')
  RouteModel get route => throw _privateConstructorUsedError;

  /// Serializes this FareResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FareResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FareResultModelCopyWith<FareResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FareResultModelCopyWith<$Res> {
  factory $FareResultModelCopyWith(
    FareResultModel value,
    $Res Function(FareResultModel) then,
  ) = _$FareResultModelCopyWithImpl<$Res, FareResultModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'fare_amount') double officialFare,
    @JsonKey(name: 'calculated_amount') double calculatedFare,
    @JsonKey(name: 'routes') RouteModel route,
  });

  $RouteModelCopyWith<$Res> get route;
}

/// @nodoc
class _$FareResultModelCopyWithImpl<$Res, $Val extends FareResultModel>
    implements $FareResultModelCopyWith<$Res> {
  _$FareResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FareResultModel
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
                      as RouteModel,
          )
          as $Val,
    );
  }

  /// Create a copy of FareResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteModelCopyWith<$Res> get route {
    return $RouteModelCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FareResultModelImplCopyWith<$Res>
    implements $FareResultModelCopyWith<$Res> {
  factory _$$FareResultModelImplCopyWith(
    _$FareResultModelImpl value,
    $Res Function(_$FareResultModelImpl) then,
  ) = __$$FareResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'fare_amount') double officialFare,
    @JsonKey(name: 'calculated_amount') double calculatedFare,
    @JsonKey(name: 'routes') RouteModel route,
  });

  @override
  $RouteModelCopyWith<$Res> get route;
}

/// @nodoc
class __$$FareResultModelImplCopyWithImpl<$Res>
    extends _$FareResultModelCopyWithImpl<$Res, _$FareResultModelImpl>
    implements _$$FareResultModelImplCopyWith<$Res> {
  __$$FareResultModelImplCopyWithImpl(
    _$FareResultModelImpl _value,
    $Res Function(_$FareResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FareResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialFare = null,
    Object? calculatedFare = null,
    Object? route = null,
  }) {
    return _then(
      _$FareResultModelImpl(
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
                  as RouteModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FareResultModelImpl extends _FareResultModel {
  const _$FareResultModelImpl({
    @JsonKey(name: 'fare_amount') required this.officialFare,
    @JsonKey(name: 'calculated_amount') required this.calculatedFare,
    @JsonKey(name: 'routes') required this.route,
  }) : super._();

  factory _$FareResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FareResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'fare_amount')
  final double officialFare;
  @override
  @JsonKey(name: 'calculated_amount')
  final double calculatedFare;
  @override
  @JsonKey(name: 'routes')
  final RouteModel route;

  @override
  String toString() {
    return 'FareResultModel(officialFare: $officialFare, calculatedFare: $calculatedFare, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FareResultModelImpl &&
            (identical(other.officialFare, officialFare) ||
                other.officialFare == officialFare) &&
            (identical(other.calculatedFare, calculatedFare) ||
                other.calculatedFare == calculatedFare) &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, officialFare, calculatedFare, route);

  /// Create a copy of FareResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FareResultModelImplCopyWith<_$FareResultModelImpl> get copyWith =>
      __$$FareResultModelImplCopyWithImpl<_$FareResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FareResultModelImplToJson(this);
  }
}

abstract class _FareResultModel extends FareResultModel {
  const factory _FareResultModel({
    @JsonKey(name: 'fare_amount') required final double officialFare,
    @JsonKey(name: 'calculated_amount') required final double calculatedFare,
    @JsonKey(name: 'routes') required final RouteModel route,
  }) = _$FareResultModelImpl;
  const _FareResultModel._() : super._();

  factory _FareResultModel.fromJson(Map<String, dynamic> json) =
      _$FareResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'fare_amount')
  double get officialFare;
  @override
  @JsonKey(name: 'calculated_amount')
  double get calculatedFare;
  @override
  @JsonKey(name: 'routes')
  RouteModel get route;

  /// Create a copy of FareResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FareResultModelImplCopyWith<_$FareResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

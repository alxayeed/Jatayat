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
  String get fareId => throw _privateConstructorUsedError;
  double get fareAmount => throw _privateConstructorUsedError;
  double get travelDistanceKm => throw _privateConstructorUsedError;
  String get fromStopId => throw _privateConstructorUsedError;
  String get toStopId =>
      throw _privateConstructorUsedError; // Localized Names for the header/timeline
  String? get originNameBn => throw _privateConstructorUsedError;
  String? get originNameEn => throw _privateConstructorUsedError;
  String? get destinationNameBn => throw _privateConstructorUsedError;
  String? get destinationNameEn =>
      throw _privateConstructorUsedError; // Nested Route Info
  String get routeId => throw _privateConstructorUsedError;
  String get routeCode => throw _privateConstructorUsedError;
  String get routeNameBn => throw _privateConstructorUsedError;
  double get routeTotalDistance => throw _privateConstructorUsedError;
  int? get pdfPage => throw _privateConstructorUsedError;
  String? get pdfUrl => throw _privateConstructorUsedError;
  String? get btrcUrl => throw _privateConstructorUsedError;
  double get baseRate => throw _privateConstructorUsedError;
  double get minFare => throw _privateConstructorUsedError;

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
  $Res call({
    String fareId,
    double fareAmount,
    double travelDistanceKm,
    String fromStopId,
    String toStopId,
    String? originNameBn,
    String? originNameEn,
    String? destinationNameBn,
    String? destinationNameEn,
    String routeId,
    String routeCode,
    String routeNameBn,
    double routeTotalDistance,
    int? pdfPage,
    String? pdfUrl,
    String? btrcUrl,
    double baseRate,
    double minFare,
  });
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
    Object? fareId = null,
    Object? fareAmount = null,
    Object? travelDistanceKm = null,
    Object? fromStopId = null,
    Object? toStopId = null,
    Object? originNameBn = freezed,
    Object? originNameEn = freezed,
    Object? destinationNameBn = freezed,
    Object? destinationNameEn = freezed,
    Object? routeId = null,
    Object? routeCode = null,
    Object? routeNameBn = null,
    Object? routeTotalDistance = null,
    Object? pdfPage = freezed,
    Object? pdfUrl = freezed,
    Object? btrcUrl = freezed,
    Object? baseRate = null,
    Object? minFare = null,
  }) {
    return _then(
      _value.copyWith(
            fareId: null == fareId
                ? _value.fareId
                : fareId // ignore: cast_nullable_to_non_nullable
                      as String,
            fareAmount: null == fareAmount
                ? _value.fareAmount
                : fareAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            travelDistanceKm: null == travelDistanceKm
                ? _value.travelDistanceKm
                : travelDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            fromStopId: null == fromStopId
                ? _value.fromStopId
                : fromStopId // ignore: cast_nullable_to_non_nullable
                      as String,
            toStopId: null == toStopId
                ? _value.toStopId
                : toStopId // ignore: cast_nullable_to_non_nullable
                      as String,
            originNameBn: freezed == originNameBn
                ? _value.originNameBn
                : originNameBn // ignore: cast_nullable_to_non_nullable
                      as String?,
            originNameEn: freezed == originNameEn
                ? _value.originNameEn
                : originNameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationNameBn: freezed == destinationNameBn
                ? _value.destinationNameBn
                : destinationNameBn // ignore: cast_nullable_to_non_nullable
                      as String?,
            destinationNameEn: freezed == destinationNameEn
                ? _value.destinationNameEn
                : destinationNameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            routeId: null == routeId
                ? _value.routeId
                : routeId // ignore: cast_nullable_to_non_nullable
                      as String,
            routeCode: null == routeCode
                ? _value.routeCode
                : routeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            routeNameBn: null == routeNameBn
                ? _value.routeNameBn
                : routeNameBn // ignore: cast_nullable_to_non_nullable
                      as String,
            routeTotalDistance: null == routeTotalDistance
                ? _value.routeTotalDistance
                : routeTotalDistance // ignore: cast_nullable_to_non_nullable
                      as double,
            pdfPage: freezed == pdfPage
                ? _value.pdfPage
                : pdfPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            pdfUrl: freezed == pdfUrl
                ? _value.pdfUrl
                : pdfUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            btrcUrl: freezed == btrcUrl
                ? _value.btrcUrl
                : btrcUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            baseRate: null == baseRate
                ? _value.baseRate
                : baseRate // ignore: cast_nullable_to_non_nullable
                      as double,
            minFare: null == minFare
                ? _value.minFare
                : minFare // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
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
  $Res call({
    String fareId,
    double fareAmount,
    double travelDistanceKm,
    String fromStopId,
    String toStopId,
    String? originNameBn,
    String? originNameEn,
    String? destinationNameBn,
    String? destinationNameEn,
    String routeId,
    String routeCode,
    String routeNameBn,
    double routeTotalDistance,
    int? pdfPage,
    String? pdfUrl,
    String? btrcUrl,
    double baseRate,
    double minFare,
  });
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
    Object? fareId = null,
    Object? fareAmount = null,
    Object? travelDistanceKm = null,
    Object? fromStopId = null,
    Object? toStopId = null,
    Object? originNameBn = freezed,
    Object? originNameEn = freezed,
    Object? destinationNameBn = freezed,
    Object? destinationNameEn = freezed,
    Object? routeId = null,
    Object? routeCode = null,
    Object? routeNameBn = null,
    Object? routeTotalDistance = null,
    Object? pdfPage = freezed,
    Object? pdfUrl = freezed,
    Object? btrcUrl = freezed,
    Object? baseRate = null,
    Object? minFare = null,
  }) {
    return _then(
      _$FareResultEntityImpl(
        fareId: null == fareId
            ? _value.fareId
            : fareId // ignore: cast_nullable_to_non_nullable
                  as String,
        fareAmount: null == fareAmount
            ? _value.fareAmount
            : fareAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        travelDistanceKm: null == travelDistanceKm
            ? _value.travelDistanceKm
            : travelDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        fromStopId: null == fromStopId
            ? _value.fromStopId
            : fromStopId // ignore: cast_nullable_to_non_nullable
                  as String,
        toStopId: null == toStopId
            ? _value.toStopId
            : toStopId // ignore: cast_nullable_to_non_nullable
                  as String,
        originNameBn: freezed == originNameBn
            ? _value.originNameBn
            : originNameBn // ignore: cast_nullable_to_non_nullable
                  as String?,
        originNameEn: freezed == originNameEn
            ? _value.originNameEn
            : originNameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationNameBn: freezed == destinationNameBn
            ? _value.destinationNameBn
            : destinationNameBn // ignore: cast_nullable_to_non_nullable
                  as String?,
        destinationNameEn: freezed == destinationNameEn
            ? _value.destinationNameEn
            : destinationNameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        routeId: null == routeId
            ? _value.routeId
            : routeId // ignore: cast_nullable_to_non_nullable
                  as String,
        routeCode: null == routeCode
            ? _value.routeCode
            : routeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        routeNameBn: null == routeNameBn
            ? _value.routeNameBn
            : routeNameBn // ignore: cast_nullable_to_non_nullable
                  as String,
        routeTotalDistance: null == routeTotalDistance
            ? _value.routeTotalDistance
            : routeTotalDistance // ignore: cast_nullable_to_non_nullable
                  as double,
        pdfPage: freezed == pdfPage
            ? _value.pdfPage
            : pdfPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        pdfUrl: freezed == pdfUrl
            ? _value.pdfUrl
            : pdfUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        btrcUrl: freezed == btrcUrl
            ? _value.btrcUrl
            : btrcUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        baseRate: null == baseRate
            ? _value.baseRate
            : baseRate // ignore: cast_nullable_to_non_nullable
                  as double,
        minFare: null == minFare
            ? _value.minFare
            : minFare // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$FareResultEntityImpl implements _FareResultEntity {
  const _$FareResultEntityImpl({
    required this.fareId,
    required this.fareAmount,
    required this.travelDistanceKm,
    required this.fromStopId,
    required this.toStopId,
    required this.originNameBn,
    required this.originNameEn,
    required this.destinationNameBn,
    required this.destinationNameEn,
    required this.routeId,
    required this.routeCode,
    required this.routeNameBn,
    required this.routeTotalDistance,
    required this.pdfPage,
    required this.pdfUrl,
    required this.btrcUrl,
    required this.baseRate,
    required this.minFare,
  });

  @override
  final String fareId;
  @override
  final double fareAmount;
  @override
  final double travelDistanceKm;
  @override
  final String fromStopId;
  @override
  final String toStopId;
  // Localized Names for the header/timeline
  @override
  final String? originNameBn;
  @override
  final String? originNameEn;
  @override
  final String? destinationNameBn;
  @override
  final String? destinationNameEn;
  // Nested Route Info
  @override
  final String routeId;
  @override
  final String routeCode;
  @override
  final String routeNameBn;
  @override
  final double routeTotalDistance;
  @override
  final int? pdfPage;
  @override
  final String? pdfUrl;
  @override
  final String? btrcUrl;
  @override
  final double baseRate;
  @override
  final double minFare;

  @override
  String toString() {
    return 'FareResultEntity(fareId: $fareId, fareAmount: $fareAmount, travelDistanceKm: $travelDistanceKm, fromStopId: $fromStopId, toStopId: $toStopId, originNameBn: $originNameBn, originNameEn: $originNameEn, destinationNameBn: $destinationNameBn, destinationNameEn: $destinationNameEn, routeId: $routeId, routeCode: $routeCode, routeNameBn: $routeNameBn, routeTotalDistance: $routeTotalDistance, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseRate: $baseRate, minFare: $minFare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FareResultEntityImpl &&
            (identical(other.fareId, fareId) || other.fareId == fareId) &&
            (identical(other.fareAmount, fareAmount) ||
                other.fareAmount == fareAmount) &&
            (identical(other.travelDistanceKm, travelDistanceKm) ||
                other.travelDistanceKm == travelDistanceKm) &&
            (identical(other.fromStopId, fromStopId) ||
                other.fromStopId == fromStopId) &&
            (identical(other.toStopId, toStopId) ||
                other.toStopId == toStopId) &&
            (identical(other.originNameBn, originNameBn) ||
                other.originNameBn == originNameBn) &&
            (identical(other.originNameEn, originNameEn) ||
                other.originNameEn == originNameEn) &&
            (identical(other.destinationNameBn, destinationNameBn) ||
                other.destinationNameBn == destinationNameBn) &&
            (identical(other.destinationNameEn, destinationNameEn) ||
                other.destinationNameEn == destinationNameEn) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.routeNameBn, routeNameBn) ||
                other.routeNameBn == routeNameBn) &&
            (identical(other.routeTotalDistance, routeTotalDistance) ||
                other.routeTotalDistance == routeTotalDistance) &&
            (identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl) &&
            (identical(other.baseRate, baseRate) ||
                other.baseRate == baseRate) &&
            (identical(other.minFare, minFare) || other.minFare == minFare));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    fareId,
    fareAmount,
    travelDistanceKm,
    fromStopId,
    toStopId,
    originNameBn,
    originNameEn,
    destinationNameBn,
    destinationNameEn,
    routeId,
    routeCode,
    routeNameBn,
    routeTotalDistance,
    pdfPage,
    pdfUrl,
    btrcUrl,
    baseRate,
    minFare,
  );

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
    required final String fareId,
    required final double fareAmount,
    required final double travelDistanceKm,
    required final String fromStopId,
    required final String toStopId,
    required final String? originNameBn,
    required final String? originNameEn,
    required final String? destinationNameBn,
    required final String? destinationNameEn,
    required final String routeId,
    required final String routeCode,
    required final String routeNameBn,
    required final double routeTotalDistance,
    required final int? pdfPage,
    required final String? pdfUrl,
    required final String? btrcUrl,
    required final double baseRate,
    required final double minFare,
  }) = _$FareResultEntityImpl;

  @override
  String get fareId;
  @override
  double get fareAmount;
  @override
  double get travelDistanceKm;
  @override
  String get fromStopId;
  @override
  String get toStopId; // Localized Names for the header/timeline
  @override
  String? get originNameBn;
  @override
  String? get originNameEn;
  @override
  String? get destinationNameBn;
  @override
  String? get destinationNameEn; // Nested Route Info
  @override
  String get routeId;
  @override
  String get routeCode;
  @override
  String get routeNameBn;
  @override
  double get routeTotalDistance;
  @override
  int? get pdfPage;
  @override
  String? get pdfUrl;
  @override
  String? get btrcUrl;
  @override
  double get baseRate;
  @override
  double get minFare;

  /// Create a copy of FareResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FareResultEntityImplCopyWith<_$FareResultEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

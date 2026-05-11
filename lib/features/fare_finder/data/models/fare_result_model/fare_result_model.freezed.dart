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
  @JsonKey(name: 'fare_id')
  String get fareId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_stop_id')
  String get fromStopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_stop_id')
  String get toStopId => throw _privateConstructorUsedError; // Updated Localized Names
  @JsonKey(name: 'origin_name_bn')
  String? get originNameBn => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_name_en')
  String? get originNameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_name_bn')
  String? get destinationNameBn => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_name_en')
  String? get destinationNameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'fare_amount')
  double get fareAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'travel_distance_km')
  double get travelDistanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_id')
  String get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_code')
  String get routeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_name_bn')
  String get routeNameBn => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_total_distance')
  double get routeTotalDistance => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_page_number')
  int? get pdfPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_url')
  String? get pdfUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'btrc_url')
  String? get btrcUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_rate')
  double get baseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_fare')
  double get minFare => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'fare_id') String fareId,
    @JsonKey(name: 'from_stop_id') String fromStopId,
    @JsonKey(name: 'to_stop_id') String toStopId,
    @JsonKey(name: 'origin_name_bn') String? originNameBn,
    @JsonKey(name: 'origin_name_en') String? originNameEn,
    @JsonKey(name: 'destination_name_bn') String? destinationNameBn,
    @JsonKey(name: 'destination_name_en') String? destinationNameEn,
    @JsonKey(name: 'fare_amount') double fareAmount,
    @JsonKey(name: 'travel_distance_km') double travelDistanceKm,
    @JsonKey(name: 'route_id') String routeId,
    @JsonKey(name: 'route_code') String routeCode,
    @JsonKey(name: 'route_name_bn') String routeNameBn,
    @JsonKey(name: 'route_total_distance') double routeTotalDistance,
    @JsonKey(name: 'pdf_page_number') int? pdfPage,
    @JsonKey(name: 'pdf_url') String? pdfUrl,
    @JsonKey(name: 'btrc_url') String? btrcUrl,
    @JsonKey(name: 'base_rate') double baseRate,
    @JsonKey(name: 'min_fare') double minFare,
  });
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
    Object? fareId = null,
    Object? fromStopId = null,
    Object? toStopId = null,
    Object? originNameBn = freezed,
    Object? originNameEn = freezed,
    Object? destinationNameBn = freezed,
    Object? destinationNameEn = freezed,
    Object? fareAmount = null,
    Object? travelDistanceKm = null,
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
            fareAmount: null == fareAmount
                ? _value.fareAmount
                : fareAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            travelDistanceKm: null == travelDistanceKm
                ? _value.travelDistanceKm
                : travelDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$FareResultModelImplCopyWith<$Res>
    implements $FareResultModelCopyWith<$Res> {
  factory _$$FareResultModelImplCopyWith(
    _$FareResultModelImpl value,
    $Res Function(_$FareResultModelImpl) then,
  ) = __$$FareResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'fare_id') String fareId,
    @JsonKey(name: 'from_stop_id') String fromStopId,
    @JsonKey(name: 'to_stop_id') String toStopId,
    @JsonKey(name: 'origin_name_bn') String? originNameBn,
    @JsonKey(name: 'origin_name_en') String? originNameEn,
    @JsonKey(name: 'destination_name_bn') String? destinationNameBn,
    @JsonKey(name: 'destination_name_en') String? destinationNameEn,
    @JsonKey(name: 'fare_amount') double fareAmount,
    @JsonKey(name: 'travel_distance_km') double travelDistanceKm,
    @JsonKey(name: 'route_id') String routeId,
    @JsonKey(name: 'route_code') String routeCode,
    @JsonKey(name: 'route_name_bn') String routeNameBn,
    @JsonKey(name: 'route_total_distance') double routeTotalDistance,
    @JsonKey(name: 'pdf_page_number') int? pdfPage,
    @JsonKey(name: 'pdf_url') String? pdfUrl,
    @JsonKey(name: 'btrc_url') String? btrcUrl,
    @JsonKey(name: 'base_rate') double baseRate,
    @JsonKey(name: 'min_fare') double minFare,
  });
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
    Object? fareId = null,
    Object? fromStopId = null,
    Object? toStopId = null,
    Object? originNameBn = freezed,
    Object? originNameEn = freezed,
    Object? destinationNameBn = freezed,
    Object? destinationNameEn = freezed,
    Object? fareAmount = null,
    Object? travelDistanceKm = null,
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
      _$FareResultModelImpl(
        fareId: null == fareId
            ? _value.fareId
            : fareId // ignore: cast_nullable_to_non_nullable
                  as String,
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
        fareAmount: null == fareAmount
            ? _value.fareAmount
            : fareAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        travelDistanceKm: null == travelDistanceKm
            ? _value.travelDistanceKm
            : travelDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
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
@JsonSerializable()
class _$FareResultModelImpl extends _FareResultModel {
  const _$FareResultModelImpl({
    @JsonKey(name: 'fare_id') required this.fareId,
    @JsonKey(name: 'from_stop_id') required this.fromStopId,
    @JsonKey(name: 'to_stop_id') required this.toStopId,
    @JsonKey(name: 'origin_name_bn') this.originNameBn,
    @JsonKey(name: 'origin_name_en') this.originNameEn,
    @JsonKey(name: 'destination_name_bn') this.destinationNameBn,
    @JsonKey(name: 'destination_name_en') this.destinationNameEn,
    @JsonKey(name: 'fare_amount') required this.fareAmount,
    @JsonKey(name: 'travel_distance_km') required this.travelDistanceKm,
    @JsonKey(name: 'route_id') required this.routeId,
    @JsonKey(name: 'route_code') required this.routeCode,
    @JsonKey(name: 'route_name_bn') required this.routeNameBn,
    @JsonKey(name: 'route_total_distance') required this.routeTotalDistance,
    @JsonKey(name: 'pdf_page_number') this.pdfPage,
    @JsonKey(name: 'pdf_url') this.pdfUrl,
    @JsonKey(name: 'btrc_url') this.btrcUrl,
    @JsonKey(name: 'base_rate') required this.baseRate,
    @JsonKey(name: 'min_fare') required this.minFare,
  }) : super._();

  factory _$FareResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FareResultModelImplFromJson(json);

  @override
  @JsonKey(name: 'fare_id')
  final String fareId;
  @override
  @JsonKey(name: 'from_stop_id')
  final String fromStopId;
  @override
  @JsonKey(name: 'to_stop_id')
  final String toStopId;
  // Updated Localized Names
  @override
  @JsonKey(name: 'origin_name_bn')
  final String? originNameBn;
  @override
  @JsonKey(name: 'origin_name_en')
  final String? originNameEn;
  @override
  @JsonKey(name: 'destination_name_bn')
  final String? destinationNameBn;
  @override
  @JsonKey(name: 'destination_name_en')
  final String? destinationNameEn;
  @override
  @JsonKey(name: 'fare_amount')
  final double fareAmount;
  @override
  @JsonKey(name: 'travel_distance_km')
  final double travelDistanceKm;
  @override
  @JsonKey(name: 'route_id')
  final String routeId;
  @override
  @JsonKey(name: 'route_code')
  final String routeCode;
  @override
  @JsonKey(name: 'route_name_bn')
  final String routeNameBn;
  @override
  @JsonKey(name: 'route_total_distance')
  final double routeTotalDistance;
  @override
  @JsonKey(name: 'pdf_page_number')
  final int? pdfPage;
  @override
  @JsonKey(name: 'pdf_url')
  final String? pdfUrl;
  @override
  @JsonKey(name: 'btrc_url')
  final String? btrcUrl;
  @override
  @JsonKey(name: 'base_rate')
  final double baseRate;
  @override
  @JsonKey(name: 'min_fare')
  final double minFare;

  @override
  String toString() {
    return 'FareResultModel(fareId: $fareId, fromStopId: $fromStopId, toStopId: $toStopId, originNameBn: $originNameBn, originNameEn: $originNameEn, destinationNameBn: $destinationNameBn, destinationNameEn: $destinationNameEn, fareAmount: $fareAmount, travelDistanceKm: $travelDistanceKm, routeId: $routeId, routeCode: $routeCode, routeNameBn: $routeNameBn, routeTotalDistance: $routeTotalDistance, pdfPage: $pdfPage, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseRate: $baseRate, minFare: $minFare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FareResultModelImpl &&
            (identical(other.fareId, fareId) || other.fareId == fareId) &&
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
            (identical(other.fareAmount, fareAmount) ||
                other.fareAmount == fareAmount) &&
            (identical(other.travelDistanceKm, travelDistanceKm) ||
                other.travelDistanceKm == travelDistanceKm) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    fareId,
    fromStopId,
    toStopId,
    originNameBn,
    originNameEn,
    destinationNameBn,
    destinationNameEn,
    fareAmount,
    travelDistanceKm,
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
    @JsonKey(name: 'fare_id') required final String fareId,
    @JsonKey(name: 'from_stop_id') required final String fromStopId,
    @JsonKey(name: 'to_stop_id') required final String toStopId,
    @JsonKey(name: 'origin_name_bn') final String? originNameBn,
    @JsonKey(name: 'origin_name_en') final String? originNameEn,
    @JsonKey(name: 'destination_name_bn') final String? destinationNameBn,
    @JsonKey(name: 'destination_name_en') final String? destinationNameEn,
    @JsonKey(name: 'fare_amount') required final double fareAmount,
    @JsonKey(name: 'travel_distance_km') required final double travelDistanceKm,
    @JsonKey(name: 'route_id') required final String routeId,
    @JsonKey(name: 'route_code') required final String routeCode,
    @JsonKey(name: 'route_name_bn') required final String routeNameBn,
    @JsonKey(name: 'route_total_distance')
    required final double routeTotalDistance,
    @JsonKey(name: 'pdf_page_number') final int? pdfPage,
    @JsonKey(name: 'pdf_url') final String? pdfUrl,
    @JsonKey(name: 'btrc_url') final String? btrcUrl,
    @JsonKey(name: 'base_rate') required final double baseRate,
    @JsonKey(name: 'min_fare') required final double minFare,
  }) = _$FareResultModelImpl;
  const _FareResultModel._() : super._();

  factory _FareResultModel.fromJson(Map<String, dynamic> json) =
      _$FareResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'fare_id')
  String get fareId;
  @override
  @JsonKey(name: 'from_stop_id')
  String get fromStopId;
  @override
  @JsonKey(name: 'to_stop_id')
  String get toStopId; // Updated Localized Names
  @override
  @JsonKey(name: 'origin_name_bn')
  String? get originNameBn;
  @override
  @JsonKey(name: 'origin_name_en')
  String? get originNameEn;
  @override
  @JsonKey(name: 'destination_name_bn')
  String? get destinationNameBn;
  @override
  @JsonKey(name: 'destination_name_en')
  String? get destinationNameEn;
  @override
  @JsonKey(name: 'fare_amount')
  double get fareAmount;
  @override
  @JsonKey(name: 'travel_distance_km')
  double get travelDistanceKm;
  @override
  @JsonKey(name: 'route_id')
  String get routeId;
  @override
  @JsonKey(name: 'route_code')
  String get routeCode;
  @override
  @JsonKey(name: 'route_name_bn')
  String get routeNameBn;
  @override
  @JsonKey(name: 'route_total_distance')
  double get routeTotalDistance;
  @override
  @JsonKey(name: 'pdf_page_number')
  int? get pdfPage;
  @override
  @JsonKey(name: 'pdf_url')
  String? get pdfUrl;
  @override
  @JsonKey(name: 'btrc_url')
  String? get btrcUrl;
  @override
  @JsonKey(name: 'base_rate')
  double get baseRate;
  @override
  @JsonKey(name: 'min_fare')
  double get minFare;

  /// Create a copy of FareResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FareResultModelImplCopyWith<_$FareResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

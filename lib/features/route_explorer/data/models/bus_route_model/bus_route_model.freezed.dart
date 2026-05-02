// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BusRouteModel _$BusRouteModelFromJson(Map<String, dynamic> json) {
  return _BusRouteModel.fromJson(json);
}

/// @nodoc
mixin _$BusRouteModel {
  @JsonKey(name: 'route_code')
  String get routeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_bn')
  String get nameBn => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_distance_km')
  double get totalDistanceKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_stops')
  int get totalStops => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_page_number')
  int get pdfPageNumber => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_url')
  String get pdfUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'btrc_url')
  String get btrcUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_fare_per_km')
  double get baseFarePerKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_fare')
  int get minimumFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_date')
  DateTime get issuedDate => throw _privateConstructorUsedError;

  /// Serializes this BusRouteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusRouteModelCopyWith<BusRouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusRouteModelCopyWith<$Res> {
  factory $BusRouteModelCopyWith(
    BusRouteModel value,
    $Res Function(BusRouteModel) then,
  ) = _$BusRouteModelCopyWithImpl<$Res, BusRouteModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'route_code') String routeCode,
    @JsonKey(name: 'name_bn') String nameBn,
    @JsonKey(name: 'total_distance_km') double totalDistanceKm,
    @JsonKey(name: 'total_stops') int totalStops,
    @JsonKey(name: 'pdf_page_number') int pdfPageNumber,
    String region,
    @JsonKey(name: 'pdf_url') String pdfUrl,
    @JsonKey(name: 'btrc_url') String btrcUrl,
    @JsonKey(name: 'base_fare_per_km') double baseFarePerKm,
    @JsonKey(name: 'minimum_fare') int minimumFare,
    @JsonKey(name: 'issued_date') DateTime issuedDate,
  });
}

/// @nodoc
class _$BusRouteModelCopyWithImpl<$Res, $Val extends BusRouteModel>
    implements $BusRouteModelCopyWith<$Res> {
  _$BusRouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeCode = null,
    Object? nameBn = null,
    Object? totalDistanceKm = null,
    Object? totalStops = null,
    Object? pdfPageNumber = null,
    Object? region = null,
    Object? pdfUrl = null,
    Object? btrcUrl = null,
    Object? baseFarePerKm = null,
    Object? minimumFare = null,
    Object? issuedDate = null,
  }) {
    return _then(
      _value.copyWith(
            routeCode: null == routeCode
                ? _value.routeCode
                : routeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            nameBn: null == nameBn
                ? _value.nameBn
                : nameBn // ignore: cast_nullable_to_non_nullable
                      as String,
            totalDistanceKm: null == totalDistanceKm
                ? _value.totalDistanceKm
                : totalDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            totalStops: null == totalStops
                ? _value.totalStops
                : totalStops // ignore: cast_nullable_to_non_nullable
                      as int,
            pdfPageNumber: null == pdfPageNumber
                ? _value.pdfPageNumber
                : pdfPageNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            region: null == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String,
            pdfUrl: null == pdfUrl
                ? _value.pdfUrl
                : pdfUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            btrcUrl: null == btrcUrl
                ? _value.btrcUrl
                : btrcUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            baseFarePerKm: null == baseFarePerKm
                ? _value.baseFarePerKm
                : baseFarePerKm // ignore: cast_nullable_to_non_nullable
                      as double,
            minimumFare: null == minimumFare
                ? _value.minimumFare
                : minimumFare // ignore: cast_nullable_to_non_nullable
                      as int,
            issuedDate: null == issuedDate
                ? _value.issuedDate
                : issuedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BusRouteModelImplCopyWith<$Res>
    implements $BusRouteModelCopyWith<$Res> {
  factory _$$BusRouteModelImplCopyWith(
    _$BusRouteModelImpl value,
    $Res Function(_$BusRouteModelImpl) then,
  ) = __$$BusRouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'route_code') String routeCode,
    @JsonKey(name: 'name_bn') String nameBn,
    @JsonKey(name: 'total_distance_km') double totalDistanceKm,
    @JsonKey(name: 'total_stops') int totalStops,
    @JsonKey(name: 'pdf_page_number') int pdfPageNumber,
    String region,
    @JsonKey(name: 'pdf_url') String pdfUrl,
    @JsonKey(name: 'btrc_url') String btrcUrl,
    @JsonKey(name: 'base_fare_per_km') double baseFarePerKm,
    @JsonKey(name: 'minimum_fare') int minimumFare,
    @JsonKey(name: 'issued_date') DateTime issuedDate,
  });
}

/// @nodoc
class __$$BusRouteModelImplCopyWithImpl<$Res>
    extends _$BusRouteModelCopyWithImpl<$Res, _$BusRouteModelImpl>
    implements _$$BusRouteModelImplCopyWith<$Res> {
  __$$BusRouteModelImplCopyWithImpl(
    _$BusRouteModelImpl _value,
    $Res Function(_$BusRouteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BusRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeCode = null,
    Object? nameBn = null,
    Object? totalDistanceKm = null,
    Object? totalStops = null,
    Object? pdfPageNumber = null,
    Object? region = null,
    Object? pdfUrl = null,
    Object? btrcUrl = null,
    Object? baseFarePerKm = null,
    Object? minimumFare = null,
    Object? issuedDate = null,
  }) {
    return _then(
      _$BusRouteModelImpl(
        routeCode: null == routeCode
            ? _value.routeCode
            : routeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        nameBn: null == nameBn
            ? _value.nameBn
            : nameBn // ignore: cast_nullable_to_non_nullable
                  as String,
        totalDistanceKm: null == totalDistanceKm
            ? _value.totalDistanceKm
            : totalDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        totalStops: null == totalStops
            ? _value.totalStops
            : totalStops // ignore: cast_nullable_to_non_nullable
                  as int,
        pdfPageNumber: null == pdfPageNumber
            ? _value.pdfPageNumber
            : pdfPageNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        region: null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String,
        pdfUrl: null == pdfUrl
            ? _value.pdfUrl
            : pdfUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        btrcUrl: null == btrcUrl
            ? _value.btrcUrl
            : btrcUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        baseFarePerKm: null == baseFarePerKm
            ? _value.baseFarePerKm
            : baseFarePerKm // ignore: cast_nullable_to_non_nullable
                  as double,
        minimumFare: null == minimumFare
            ? _value.minimumFare
            : minimumFare // ignore: cast_nullable_to_non_nullable
                  as int,
        issuedDate: null == issuedDate
            ? _value.issuedDate
            : issuedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BusRouteModelImpl extends _BusRouteModel {
  const _$BusRouteModelImpl({
    @JsonKey(name: 'route_code') required this.routeCode,
    @JsonKey(name: 'name_bn') required this.nameBn,
    @JsonKey(name: 'total_distance_km') required this.totalDistanceKm,
    @JsonKey(name: 'total_stops') required this.totalStops,
    @JsonKey(name: 'pdf_page_number') required this.pdfPageNumber,
    required this.region,
    @JsonKey(name: 'pdf_url') required this.pdfUrl,
    @JsonKey(name: 'btrc_url') required this.btrcUrl,
    @JsonKey(name: 'base_fare_per_km') required this.baseFarePerKm,
    @JsonKey(name: 'minimum_fare') required this.minimumFare,
    @JsonKey(name: 'issued_date') required this.issuedDate,
  }) : super._();

  factory _$BusRouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusRouteModelImplFromJson(json);

  @override
  @JsonKey(name: 'route_code')
  final String routeCode;
  @override
  @JsonKey(name: 'name_bn')
  final String nameBn;
  @override
  @JsonKey(name: 'total_distance_km')
  final double totalDistanceKm;
  @override
  @JsonKey(name: 'total_stops')
  final int totalStops;
  @override
  @JsonKey(name: 'pdf_page_number')
  final int pdfPageNumber;
  @override
  final String region;
  @override
  @JsonKey(name: 'pdf_url')
  final String pdfUrl;
  @override
  @JsonKey(name: 'btrc_url')
  final String btrcUrl;
  @override
  @JsonKey(name: 'base_fare_per_km')
  final double baseFarePerKm;
  @override
  @JsonKey(name: 'minimum_fare')
  final int minimumFare;
  @override
  @JsonKey(name: 'issued_date')
  final DateTime issuedDate;

  @override
  String toString() {
    return 'BusRouteModel(routeCode: $routeCode, nameBn: $nameBn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, pdfPageNumber: $pdfPageNumber, region: $region, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusRouteModelImpl &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.totalStops, totalStops) ||
                other.totalStops == totalStops) &&
            (identical(other.pdfPageNumber, pdfPageNumber) ||
                other.pdfPageNumber == pdfPageNumber) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl) &&
            (identical(other.baseFarePerKm, baseFarePerKm) ||
                other.baseFarePerKm == baseFarePerKm) &&
            (identical(other.minimumFare, minimumFare) ||
                other.minimumFare == minimumFare) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    routeCode,
    nameBn,
    totalDistanceKm,
    totalStops,
    pdfPageNumber,
    region,
    pdfUrl,
    btrcUrl,
    baseFarePerKm,
    minimumFare,
    issuedDate,
  );

  /// Create a copy of BusRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusRouteModelImplCopyWith<_$BusRouteModelImpl> get copyWith =>
      __$$BusRouteModelImplCopyWithImpl<_$BusRouteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusRouteModelImplToJson(this);
  }
}

abstract class _BusRouteModel extends BusRouteModel {
  const factory _BusRouteModel({
    @JsonKey(name: 'route_code') required final String routeCode,
    @JsonKey(name: 'name_bn') required final String nameBn,
    @JsonKey(name: 'total_distance_km') required final double totalDistanceKm,
    @JsonKey(name: 'total_stops') required final int totalStops,
    @JsonKey(name: 'pdf_page_number') required final int pdfPageNumber,
    required final String region,
    @JsonKey(name: 'pdf_url') required final String pdfUrl,
    @JsonKey(name: 'btrc_url') required final String btrcUrl,
    @JsonKey(name: 'base_fare_per_km') required final double baseFarePerKm,
    @JsonKey(name: 'minimum_fare') required final int minimumFare,
    @JsonKey(name: 'issued_date') required final DateTime issuedDate,
  }) = _$BusRouteModelImpl;
  const _BusRouteModel._() : super._();

  factory _BusRouteModel.fromJson(Map<String, dynamic> json) =
      _$BusRouteModelImpl.fromJson;

  @override
  @JsonKey(name: 'route_code')
  String get routeCode;
  @override
  @JsonKey(name: 'name_bn')
  String get nameBn;
  @override
  @JsonKey(name: 'total_distance_km')
  double get totalDistanceKm;
  @override
  @JsonKey(name: 'total_stops')
  int get totalStops;
  @override
  @JsonKey(name: 'pdf_page_number')
  int get pdfPageNumber;
  @override
  String get region;
  @override
  @JsonKey(name: 'pdf_url')
  String get pdfUrl;
  @override
  @JsonKey(name: 'btrc_url')
  String get btrcUrl;
  @override
  @JsonKey(name: 'base_fare_per_km')
  double get baseFarePerKm;
  @override
  @JsonKey(name: 'minimum_fare')
  int get minimumFare;
  @override
  @JsonKey(name: 'issued_date')
  DateTime get issuedDate;

  /// Create a copy of BusRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusRouteModelImplCopyWith<_$BusRouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RouteStop _$RouteStopFromJson(Map<String, dynamic> json) {
  return _RouteStop.fromJson(json);
}

/// @nodoc
mixin _$RouteStop {
  String get stopId => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  int get sequenceOrder => throw _privateConstructorUsedError;
  double get cumulativeDistanceKm => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  /// Serializes this RouteStop to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteStop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteStopCopyWith<RouteStop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStopCopyWith<$Res> {
  factory $RouteStopCopyWith(RouteStop value, $Res Function(RouteStop) then) =
      _$RouteStopCopyWithImpl<$Res, RouteStop>;
  @useResult
  $Res call({
    String stopId,
    String nameBn,
    int sequenceOrder,
    double cumulativeDistanceKm,
    String? nameEn,
    double? lat,
    double? lng,
  });
}

/// @nodoc
class _$RouteStopCopyWithImpl<$Res, $Val extends RouteStop>
    implements $RouteStopCopyWith<$Res> {
  _$RouteStopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteStop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopId = null,
    Object? nameBn = null,
    Object? sequenceOrder = null,
    Object? cumulativeDistanceKm = null,
    Object? nameEn = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(
      _value.copyWith(
            stopId: null == stopId
                ? _value.stopId
                : stopId // ignore: cast_nullable_to_non_nullable
                      as String,
            nameBn: null == nameBn
                ? _value.nameBn
                : nameBn // ignore: cast_nullable_to_non_nullable
                      as String,
            sequenceOrder: null == sequenceOrder
                ? _value.sequenceOrder
                : sequenceOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            cumulativeDistanceKm: null == cumulativeDistanceKm
                ? _value.cumulativeDistanceKm
                : cumulativeDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            nameEn: freezed == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            lat: freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double?,
            lng: freezed == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteStopImplCopyWith<$Res>
    implements $RouteStopCopyWith<$Res> {
  factory _$$RouteStopImplCopyWith(
    _$RouteStopImpl value,
    $Res Function(_$RouteStopImpl) then,
  ) = __$$RouteStopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String stopId,
    String nameBn,
    int sequenceOrder,
    double cumulativeDistanceKm,
    String? nameEn,
    double? lat,
    double? lng,
  });
}

/// @nodoc
class __$$RouteStopImplCopyWithImpl<$Res>
    extends _$RouteStopCopyWithImpl<$Res, _$RouteStopImpl>
    implements _$$RouteStopImplCopyWith<$Res> {
  __$$RouteStopImplCopyWithImpl(
    _$RouteStopImpl _value,
    $Res Function(_$RouteStopImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteStop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopId = null,
    Object? nameBn = null,
    Object? sequenceOrder = null,
    Object? cumulativeDistanceKm = null,
    Object? nameEn = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(
      _$RouteStopImpl(
        stopId: null == stopId
            ? _value.stopId
            : stopId // ignore: cast_nullable_to_non_nullable
                  as String,
        nameBn: null == nameBn
            ? _value.nameBn
            : nameBn // ignore: cast_nullable_to_non_nullable
                  as String,
        sequenceOrder: null == sequenceOrder
            ? _value.sequenceOrder
            : sequenceOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        cumulativeDistanceKm: null == cumulativeDistanceKm
            ? _value.cumulativeDistanceKm
            : cumulativeDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        nameEn: freezed == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        lat: freezed == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double?,
        lng: freezed == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RouteStopImpl implements _RouteStop {
  const _$RouteStopImpl({
    required this.stopId,
    required this.nameBn,
    required this.sequenceOrder,
    required this.cumulativeDistanceKm,
    this.nameEn,
    this.lat,
    this.lng,
  });

  factory _$RouteStopImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteStopImplFromJson(json);

  @override
  final String stopId;
  @override
  final String nameBn;
  @override
  final int sequenceOrder;
  @override
  final double cumulativeDistanceKm;
  @override
  final String? nameEn;
  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString() {
    return 'RouteStop(stopId: $stopId, nameBn: $nameBn, sequenceOrder: $sequenceOrder, cumulativeDistanceKm: $cumulativeDistanceKm, nameEn: $nameEn, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStopImpl &&
            (identical(other.stopId, stopId) || other.stopId == stopId) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
            (identical(other.sequenceOrder, sequenceOrder) ||
                other.sequenceOrder == sequenceOrder) &&
            (identical(other.cumulativeDistanceKm, cumulativeDistanceKm) ||
                other.cumulativeDistanceKm == cumulativeDistanceKm) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stopId,
    nameBn,
    sequenceOrder,
    cumulativeDistanceKm,
    nameEn,
    lat,
    lng,
  );

  /// Create a copy of RouteStop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStopImplCopyWith<_$RouteStopImpl> get copyWith =>
      __$$RouteStopImplCopyWithImpl<_$RouteStopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteStopImplToJson(this);
  }
}

abstract class _RouteStop implements RouteStop {
  const factory _RouteStop({
    required final String stopId,
    required final String nameBn,
    required final int sequenceOrder,
    required final double cumulativeDistanceKm,
    final String? nameEn,
    final double? lat,
    final double? lng,
  }) = _$RouteStopImpl;

  factory _RouteStop.fromJson(Map<String, dynamic> json) =
      _$RouteStopImpl.fromJson;

  @override
  String get stopId;
  @override
  String get nameBn;
  @override
  int get sequenceOrder;
  @override
  double get cumulativeDistanceKm;
  @override
  String? get nameEn;
  @override
  double? get lat;
  @override
  double? get lng;

  /// Create a copy of RouteStop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteStopImplCopyWith<_$RouteStopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BusRoute _$BusRouteFromJson(Map<String, dynamic> json) {
  return _BusRoute.fromJson(json);
}

/// @nodoc
mixin _$BusRoute {
  String get id =>
      throw _privateConstructorUsedError; // Strongly recommended to keep for DB lookups
  String get routeCode => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  double get totalDistanceKm => throw _privateConstructorUsedError;
  int get totalStops => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  int? get pdfPageNumber => throw _privateConstructorUsedError;
  String? get pdfUrl => throw _privateConstructorUsedError;
  String? get btrcUrl => throw _privateConstructorUsedError;
  double? get baseFarePerKm => throw _privateConstructorUsedError;
  int? get minimumFare => throw _privateConstructorUsedError;
  DateTime? get issuedDate =>
      throw _privateConstructorUsedError; // The missing stops! Defaults to empty for the summary list view.
  List<RouteStop> get stops => throw _privateConstructorUsedError;

  /// Serializes this BusRoute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusRouteCopyWith<BusRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusRouteCopyWith<$Res> {
  factory $BusRouteCopyWith(BusRoute value, $Res Function(BusRoute) then) =
      _$BusRouteCopyWithImpl<$Res, BusRoute>;
  @useResult
  $Res call({
    String id,
    String routeCode,
    String nameBn,
    String? nameEn,
    double totalDistanceKm,
    int totalStops,
    String region,
    int? pdfPageNumber,
    String? pdfUrl,
    String? btrcUrl,
    double? baseFarePerKm,
    int? minimumFare,
    DateTime? issuedDate,
    List<RouteStop> stops,
  });
}

/// @nodoc
class _$BusRouteCopyWithImpl<$Res, $Val extends BusRoute>
    implements $BusRouteCopyWith<$Res> {
  _$BusRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
    Object? nameEn = freezed,
    Object? totalDistanceKm = null,
    Object? totalStops = null,
    Object? region = null,
    Object? pdfPageNumber = freezed,
    Object? pdfUrl = freezed,
    Object? btrcUrl = freezed,
    Object? baseFarePerKm = freezed,
    Object? minimumFare = freezed,
    Object? issuedDate = freezed,
    Object? stops = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            routeCode: null == routeCode
                ? _value.routeCode
                : routeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            nameBn: null == nameBn
                ? _value.nameBn
                : nameBn // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEn: freezed == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalDistanceKm: null == totalDistanceKm
                ? _value.totalDistanceKm
                : totalDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            totalStops: null == totalStops
                ? _value.totalStops
                : totalStops // ignore: cast_nullable_to_non_nullable
                      as int,
            region: null == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String,
            pdfPageNumber: freezed == pdfPageNumber
                ? _value.pdfPageNumber
                : pdfPageNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            pdfUrl: freezed == pdfUrl
                ? _value.pdfUrl
                : pdfUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            btrcUrl: freezed == btrcUrl
                ? _value.btrcUrl
                : btrcUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            baseFarePerKm: freezed == baseFarePerKm
                ? _value.baseFarePerKm
                : baseFarePerKm // ignore: cast_nullable_to_non_nullable
                      as double?,
            minimumFare: freezed == minimumFare
                ? _value.minimumFare
                : minimumFare // ignore: cast_nullable_to_non_nullable
                      as int?,
            issuedDate: freezed == issuedDate
                ? _value.issuedDate
                : issuedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            stops: null == stops
                ? _value.stops
                : stops // ignore: cast_nullable_to_non_nullable
                      as List<RouteStop>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BusRouteImplCopyWith<$Res>
    implements $BusRouteCopyWith<$Res> {
  factory _$$BusRouteImplCopyWith(
    _$BusRouteImpl value,
    $Res Function(_$BusRouteImpl) then,
  ) = __$$BusRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String routeCode,
    String nameBn,
    String? nameEn,
    double totalDistanceKm,
    int totalStops,
    String region,
    int? pdfPageNumber,
    String? pdfUrl,
    String? btrcUrl,
    double? baseFarePerKm,
    int? minimumFare,
    DateTime? issuedDate,
    List<RouteStop> stops,
  });
}

/// @nodoc
class __$$BusRouteImplCopyWithImpl<$Res>
    extends _$BusRouteCopyWithImpl<$Res, _$BusRouteImpl>
    implements _$$BusRouteImplCopyWith<$Res> {
  __$$BusRouteImplCopyWithImpl(
    _$BusRouteImpl _value,
    $Res Function(_$BusRouteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BusRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
    Object? nameEn = freezed,
    Object? totalDistanceKm = null,
    Object? totalStops = null,
    Object? region = null,
    Object? pdfPageNumber = freezed,
    Object? pdfUrl = freezed,
    Object? btrcUrl = freezed,
    Object? baseFarePerKm = freezed,
    Object? minimumFare = freezed,
    Object? issuedDate = freezed,
    Object? stops = null,
  }) {
    return _then(
      _$BusRouteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        routeCode: null == routeCode
            ? _value.routeCode
            : routeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        nameBn: null == nameBn
            ? _value.nameBn
            : nameBn // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: freezed == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalDistanceKm: null == totalDistanceKm
            ? _value.totalDistanceKm
            : totalDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        totalStops: null == totalStops
            ? _value.totalStops
            : totalStops // ignore: cast_nullable_to_non_nullable
                  as int,
        region: null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String,
        pdfPageNumber: freezed == pdfPageNumber
            ? _value.pdfPageNumber
            : pdfPageNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        pdfUrl: freezed == pdfUrl
            ? _value.pdfUrl
            : pdfUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        btrcUrl: freezed == btrcUrl
            ? _value.btrcUrl
            : btrcUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        baseFarePerKm: freezed == baseFarePerKm
            ? _value.baseFarePerKm
            : baseFarePerKm // ignore: cast_nullable_to_non_nullable
                  as double?,
        minimumFare: freezed == minimumFare
            ? _value.minimumFare
            : minimumFare // ignore: cast_nullable_to_non_nullable
                  as int?,
        issuedDate: freezed == issuedDate
            ? _value.issuedDate
            : issuedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        stops: null == stops
            ? _value._stops
            : stops // ignore: cast_nullable_to_non_nullable
                  as List<RouteStop>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BusRouteImpl implements _BusRoute {
  const _$BusRouteImpl({
    required this.id,
    required this.routeCode,
    required this.nameBn,
    this.nameEn,
    required this.totalDistanceKm,
    required this.totalStops,
    required this.region,
    this.pdfPageNumber,
    this.pdfUrl,
    this.btrcUrl,
    this.baseFarePerKm,
    this.minimumFare,
    this.issuedDate,
    final List<RouteStop> stops = const [],
  }) : _stops = stops;

  factory _$BusRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusRouteImplFromJson(json);

  @override
  final String id;
  // Strongly recommended to keep for DB lookups
  @override
  final String routeCode;
  @override
  final String nameBn;
  @override
  final String? nameEn;
  @override
  final double totalDistanceKm;
  @override
  final int totalStops;
  @override
  final String region;
  @override
  final int? pdfPageNumber;
  @override
  final String? pdfUrl;
  @override
  final String? btrcUrl;
  @override
  final double? baseFarePerKm;
  @override
  final int? minimumFare;
  @override
  final DateTime? issuedDate;
  // The missing stops! Defaults to empty for the summary list view.
  final List<RouteStop> _stops;
  // The missing stops! Defaults to empty for the summary list view.
  @override
  @JsonKey()
  List<RouteStop> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  String toString() {
    return 'BusRoute(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, region: $region, pdfPageNumber: $pdfPageNumber, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate, stops: $stops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.totalStops, totalStops) ||
                other.totalStops == totalStops) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.pdfPageNumber, pdfPageNumber) ||
                other.pdfPageNumber == pdfPageNumber) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl) &&
            (identical(other.baseFarePerKm, baseFarePerKm) ||
                other.baseFarePerKm == baseFarePerKm) &&
            (identical(other.minimumFare, minimumFare) ||
                other.minimumFare == minimumFare) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            const DeepCollectionEquality().equals(other._stops, _stops));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    routeCode,
    nameBn,
    nameEn,
    totalDistanceKm,
    totalStops,
    region,
    pdfPageNumber,
    pdfUrl,
    btrcUrl,
    baseFarePerKm,
    minimumFare,
    issuedDate,
    const DeepCollectionEquality().hash(_stops),
  );

  /// Create a copy of BusRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusRouteImplCopyWith<_$BusRouteImpl> get copyWith =>
      __$$BusRouteImplCopyWithImpl<_$BusRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusRouteImplToJson(this);
  }
}

abstract class _BusRoute implements BusRoute {
  const factory _BusRoute({
    required final String id,
    required final String routeCode,
    required final String nameBn,
    final String? nameEn,
    required final double totalDistanceKm,
    required final int totalStops,
    required final String region,
    final int? pdfPageNumber,
    final String? pdfUrl,
    final String? btrcUrl,
    final double? baseFarePerKm,
    final int? minimumFare,
    final DateTime? issuedDate,
    final List<RouteStop> stops,
  }) = _$BusRouteImpl;

  factory _BusRoute.fromJson(Map<String, dynamic> json) =
      _$BusRouteImpl.fromJson;

  @override
  String get id; // Strongly recommended to keep for DB lookups
  @override
  String get routeCode;
  @override
  String get nameBn;
  @override
  String? get nameEn;
  @override
  double get totalDistanceKm;
  @override
  int get totalStops;
  @override
  String get region;
  @override
  int? get pdfPageNumber;
  @override
  String? get pdfUrl;
  @override
  String? get btrcUrl;
  @override
  double? get baseFarePerKm;
  @override
  int? get minimumFare;
  @override
  DateTime? get issuedDate; // The missing stops! Defaults to empty for the summary list view.
  @override
  List<RouteStop> get stops;

  /// Create a copy of BusRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusRouteImplCopyWith<_$BusRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

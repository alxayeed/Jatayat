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

RouteStopModel _$RouteStopModelFromJson(Map<String, dynamic> json) {
  return _RouteStopModel.fromJson(json);
}

/// @nodoc
mixin _$RouteStopModel {
  String get stopId => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  int get sequenceOrder => throw _privateConstructorUsedError;
  double get cumulativeDistanceKm => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  /// Serializes this RouteStopModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteStopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteStopModelCopyWith<RouteStopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStopModelCopyWith<$Res> {
  factory $RouteStopModelCopyWith(
    RouteStopModel value,
    $Res Function(RouteStopModel) then,
  ) = _$RouteStopModelCopyWithImpl<$Res, RouteStopModel>;
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
class _$RouteStopModelCopyWithImpl<$Res, $Val extends RouteStopModel>
    implements $RouteStopModelCopyWith<$Res> {
  _$RouteStopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteStopModel
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
abstract class _$$RouteStopModelImplCopyWith<$Res>
    implements $RouteStopModelCopyWith<$Res> {
  factory _$$RouteStopModelImplCopyWith(
    _$RouteStopModelImpl value,
    $Res Function(_$RouteStopModelImpl) then,
  ) = __$$RouteStopModelImplCopyWithImpl<$Res>;
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
class __$$RouteStopModelImplCopyWithImpl<$Res>
    extends _$RouteStopModelCopyWithImpl<$Res, _$RouteStopModelImpl>
    implements _$$RouteStopModelImplCopyWith<$Res> {
  __$$RouteStopModelImplCopyWithImpl(
    _$RouteStopModelImpl _value,
    $Res Function(_$RouteStopModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteStopModel
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
      _$RouteStopModelImpl(
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
class _$RouteStopModelImpl extends _RouteStopModel {
  const _$RouteStopModelImpl({
    required this.stopId,
    required this.nameBn,
    required this.sequenceOrder,
    required this.cumulativeDistanceKm,
    this.nameEn,
    this.lat,
    this.lng,
  }) : super._();

  factory _$RouteStopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteStopModelImplFromJson(json);

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
    return 'RouteStopModel(stopId: $stopId, nameBn: $nameBn, sequenceOrder: $sequenceOrder, cumulativeDistanceKm: $cumulativeDistanceKm, nameEn: $nameEn, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStopModelImpl &&
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

  /// Create a copy of RouteStopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStopModelImplCopyWith<_$RouteStopModelImpl> get copyWith =>
      __$$RouteStopModelImplCopyWithImpl<_$RouteStopModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteStopModelImplToJson(this);
  }
}

abstract class _RouteStopModel extends RouteStopModel {
  const factory _RouteStopModel({
    required final String stopId,
    required final String nameBn,
    required final int sequenceOrder,
    required final double cumulativeDistanceKm,
    final String? nameEn,
    final double? lat,
    final double? lng,
  }) = _$RouteStopModelImpl;
  const _RouteStopModel._() : super._();

  factory _RouteStopModel.fromJson(Map<String, dynamic> json) =
      _$RouteStopModelImpl.fromJson;

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

  /// Create a copy of RouteStopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteStopModelImplCopyWith<_$RouteStopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BusRouteModel _$BusRouteModelFromJson(Map<String, dynamic> json) {
  return _BusRouteModel.fromJson(json);
}

/// @nodoc
mixin _$BusRouteModel {
  String get id => throw _privateConstructorUsedError; // Added Primary Key
  String get routeCode => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  double get totalDistanceKm => throw _privateConstructorUsedError;
  int get totalStops => throw _privateConstructorUsedError;
  String get region =>
      throw _privateConstructorUsedError; // Nullable fields matching DB schema
  int? get pdfPageNumber => throw _privateConstructorUsedError;
  String? get pdfUrl => throw _privateConstructorUsedError;
  String? get btrcUrl => throw _privateConstructorUsedError;
  double? get baseFarePerKm => throw _privateConstructorUsedError;
  int? get minimumFare => throw _privateConstructorUsedError;
  DateTime? get issuedDate =>
      throw _privateConstructorUsedError; // The list of stops (defaults to empty for the "Lazy Loading" list view)
  List<RouteStopModel> get stops => throw _privateConstructorUsedError;

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
    String id,
    String routeCode,
    String nameBn,
    double totalDistanceKm,
    int totalStops,
    String region,
    int? pdfPageNumber,
    String? pdfUrl,
    String? btrcUrl,
    double? baseFarePerKm,
    int? minimumFare,
    DateTime? issuedDate,
    List<RouteStopModel> stops,
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
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
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
                      as List<RouteStopModel>,
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
    String id,
    String routeCode,
    String nameBn,
    double totalDistanceKm,
    int totalStops,
    String region,
    int? pdfPageNumber,
    String? pdfUrl,
    String? btrcUrl,
    double? baseFarePerKm,
    int? minimumFare,
    DateTime? issuedDate,
    List<RouteStopModel> stops,
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
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
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
      _$BusRouteModelImpl(
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
                  as List<RouteStopModel>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BusRouteModelImpl extends _BusRouteModel {
  const _$BusRouteModelImpl({
    required this.id,
    required this.routeCode,
    required this.nameBn,
    required this.totalDistanceKm,
    required this.totalStops,
    required this.region,
    this.pdfPageNumber,
    this.pdfUrl,
    this.btrcUrl,
    this.baseFarePerKm,
    this.minimumFare,
    this.issuedDate,
    final List<RouteStopModel> stops = const [],
  }) : _stops = stops,
       super._();

  factory _$BusRouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusRouteModelImplFromJson(json);

  @override
  final String id;
  // Added Primary Key
  @override
  final String routeCode;
  @override
  final String nameBn;
  @override
  final double totalDistanceKm;
  @override
  final int totalStops;
  @override
  final String region;
  // Nullable fields matching DB schema
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
  // The list of stops (defaults to empty for the "Lazy Loading" list view)
  final List<RouteStopModel> _stops;
  // The list of stops (defaults to empty for the "Lazy Loading" list view)
  @override
  @JsonKey()
  List<RouteStopModel> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  String toString() {
    return 'BusRouteModel(id: $id, routeCode: $routeCode, nameBn: $nameBn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, region: $region, pdfPageNumber: $pdfPageNumber, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate, stops: $stops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusRouteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
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
    required final String id,
    required final String routeCode,
    required final String nameBn,
    required final double totalDistanceKm,
    required final int totalStops,
    required final String region,
    final int? pdfPageNumber,
    final String? pdfUrl,
    final String? btrcUrl,
    final double? baseFarePerKm,
    final int? minimumFare,
    final DateTime? issuedDate,
    final List<RouteStopModel> stops,
  }) = _$BusRouteModelImpl;
  const _BusRouteModel._() : super._();

  factory _BusRouteModel.fromJson(Map<String, dynamic> json) =
      _$BusRouteModelImpl.fromJson;

  @override
  String get id; // Added Primary Key
  @override
  String get routeCode;
  @override
  String get nameBn;
  @override
  double get totalDistanceKm;
  @override
  int get totalStops;
  @override
  String get region; // Nullable fields matching DB schema
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
  DateTime? get issuedDate; // The list of stops (defaults to empty for the "Lazy Loading" list view)
  @override
  List<RouteStopModel> get stops;

  /// Create a copy of BusRouteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusRouteModelImplCopyWith<_$BusRouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

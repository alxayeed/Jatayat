// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteStop {

 String get stopId; String get nameBn; int get sequenceOrder; double get cumulativeDistanceKm; String? get nameEn; double? get lat; double? get lng;
/// Create a copy of RouteStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStopCopyWith<RouteStop> get copyWith => _$RouteStopCopyWithImpl<RouteStop>(this as RouteStop, _$identity);

  /// Serializes this RouteStop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteStop&&(identical(other.stopId, stopId) || other.stopId == stopId)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.cumulativeDistanceKm, cumulativeDistanceKm) || other.cumulativeDistanceKm == cumulativeDistanceKm)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stopId,nameBn,sequenceOrder,cumulativeDistanceKm,nameEn,lat,lng);

@override
String toString() {
  return 'RouteStop(stopId: $stopId, nameBn: $nameBn, sequenceOrder: $sequenceOrder, cumulativeDistanceKm: $cumulativeDistanceKm, nameEn: $nameEn, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $RouteStopCopyWith<$Res>  {
  factory $RouteStopCopyWith(RouteStop value, $Res Function(RouteStop) _then) = _$RouteStopCopyWithImpl;
@useResult
$Res call({
 String stopId, String nameBn, int sequenceOrder, double cumulativeDistanceKm, String? nameEn, double? lat, double? lng
});




}
/// @nodoc
class _$RouteStopCopyWithImpl<$Res>
    implements $RouteStopCopyWith<$Res> {
  _$RouteStopCopyWithImpl(this._self, this._then);

  final RouteStop _self;
  final $Res Function(RouteStop) _then;

/// Create a copy of RouteStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stopId = null,Object? nameBn = null,Object? sequenceOrder = null,Object? cumulativeDistanceKm = null,Object? nameEn = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
stopId: null == stopId ? _self.stopId : stopId // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,cumulativeDistanceKm: null == cumulativeDistanceKm ? _self.cumulativeDistanceKm : cumulativeDistanceKm // ignore: cast_nullable_to_non_nullable
as double,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteStop].
extension RouteStopPatterns on RouteStop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteStop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteStop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteStop value)  $default,){
final _that = this;
switch (_that) {
case _RouteStop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteStop value)?  $default,){
final _that = this;
switch (_that) {
case _RouteStop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stopId,  String nameBn,  int sequenceOrder,  double cumulativeDistanceKm,  String? nameEn,  double? lat,  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteStop() when $default != null:
return $default(_that.stopId,_that.nameBn,_that.sequenceOrder,_that.cumulativeDistanceKm,_that.nameEn,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stopId,  String nameBn,  int sequenceOrder,  double cumulativeDistanceKm,  String? nameEn,  double? lat,  double? lng)  $default,) {final _that = this;
switch (_that) {
case _RouteStop():
return $default(_that.stopId,_that.nameBn,_that.sequenceOrder,_that.cumulativeDistanceKm,_that.nameEn,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stopId,  String nameBn,  int sequenceOrder,  double cumulativeDistanceKm,  String? nameEn,  double? lat,  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _RouteStop() when $default != null:
return $default(_that.stopId,_that.nameBn,_that.sequenceOrder,_that.cumulativeDistanceKm,_that.nameEn,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RouteStop implements RouteStop {
  const _RouteStop({required this.stopId, required this.nameBn, required this.sequenceOrder, required this.cumulativeDistanceKm, this.nameEn, this.lat, this.lng});
  factory _RouteStop.fromJson(Map<String, dynamic> json) => _$RouteStopFromJson(json);

@override final  String stopId;
@override final  String nameBn;
@override final  int sequenceOrder;
@override final  double cumulativeDistanceKm;
@override final  String? nameEn;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of RouteStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteStopCopyWith<_RouteStop> get copyWith => __$RouteStopCopyWithImpl<_RouteStop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteStopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteStop&&(identical(other.stopId, stopId) || other.stopId == stopId)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.cumulativeDistanceKm, cumulativeDistanceKm) || other.cumulativeDistanceKm == cumulativeDistanceKm)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stopId,nameBn,sequenceOrder,cumulativeDistanceKm,nameEn,lat,lng);

@override
String toString() {
  return 'RouteStop(stopId: $stopId, nameBn: $nameBn, sequenceOrder: $sequenceOrder, cumulativeDistanceKm: $cumulativeDistanceKm, nameEn: $nameEn, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$RouteStopCopyWith<$Res> implements $RouteStopCopyWith<$Res> {
  factory _$RouteStopCopyWith(_RouteStop value, $Res Function(_RouteStop) _then) = __$RouteStopCopyWithImpl;
@override @useResult
$Res call({
 String stopId, String nameBn, int sequenceOrder, double cumulativeDistanceKm, String? nameEn, double? lat, double? lng
});




}
/// @nodoc
class __$RouteStopCopyWithImpl<$Res>
    implements _$RouteStopCopyWith<$Res> {
  __$RouteStopCopyWithImpl(this._self, this._then);

  final _RouteStop _self;
  final $Res Function(_RouteStop) _then;

/// Create a copy of RouteStop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stopId = null,Object? nameBn = null,Object? sequenceOrder = null,Object? cumulativeDistanceKm = null,Object? nameEn = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_RouteStop(
stopId: null == stopId ? _self.stopId : stopId // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,cumulativeDistanceKm: null == cumulativeDistanceKm ? _self.cumulativeDistanceKm : cumulativeDistanceKm // ignore: cast_nullable_to_non_nullable
as double,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$BusRoute {

 String get id;// Strongly recommended to keep for DB lookups
 String get routeCode; String get nameBn; String? get nameEn; double get totalDistanceKm; int get totalStops; String get region; int? get pdfPageNumber; String? get pdfUrl; String? get btrcUrl; double? get baseFarePerKm; int? get minimumFare; DateTime? get issuedDate;// The missing stops! Defaults to empty for the summary list view.
 List<RouteStop> get stops;
/// Create a copy of BusRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusRouteCopyWith<BusRoute> get copyWith => _$BusRouteCopyWithImpl<BusRoute>(this as BusRoute, _$identity);

  /// Serializes this BusRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistanceKm, totalDistanceKm) || other.totalDistanceKm == totalDistanceKm)&&(identical(other.totalStops, totalStops) || other.totalStops == totalStops)&&(identical(other.region, region) || other.region == region)&&(identical(other.pdfPageNumber, pdfPageNumber) || other.pdfPageNumber == pdfPageNumber)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseFarePerKm, baseFarePerKm) || other.baseFarePerKm == baseFarePerKm)&&(identical(other.minimumFare, minimumFare) || other.minimumFare == minimumFare)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&const DeepCollectionEquality().equals(other.stops, stops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistanceKm,totalStops,region,pdfPageNumber,pdfUrl,btrcUrl,baseFarePerKm,minimumFare,issuedDate,const DeepCollectionEquality().hash(stops));

@override
String toString() {
  return 'BusRoute(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, region: $region, pdfPageNumber: $pdfPageNumber, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate, stops: $stops)';
}


}

/// @nodoc
abstract mixin class $BusRouteCopyWith<$Res>  {
  factory $BusRouteCopyWith(BusRoute value, $Res Function(BusRoute) _then) = _$BusRouteCopyWithImpl;
@useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistanceKm, int totalStops, String region, int? pdfPageNumber, String? pdfUrl, String? btrcUrl, double? baseFarePerKm, int? minimumFare, DateTime? issuedDate, List<RouteStop> stops
});




}
/// @nodoc
class _$BusRouteCopyWithImpl<$Res>
    implements $BusRouteCopyWith<$Res> {
  _$BusRouteCopyWithImpl(this._self, this._then);

  final BusRoute _self;
  final $Res Function(BusRoute) _then;

/// Create a copy of BusRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistanceKm = null,Object? totalStops = null,Object? region = null,Object? pdfPageNumber = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseFarePerKm = freezed,Object? minimumFare = freezed,Object? issuedDate = freezed,Object? stops = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,totalDistanceKm: null == totalDistanceKm ? _self.totalDistanceKm : totalDistanceKm // ignore: cast_nullable_to_non_nullable
as double,totalStops: null == totalStops ? _self.totalStops : totalStops // ignore: cast_nullable_to_non_nullable
as int,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,pdfPageNumber: freezed == pdfPageNumber ? _self.pdfPageNumber : pdfPageNumber // ignore: cast_nullable_to_non_nullable
as int?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,btrcUrl: freezed == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String?,baseFarePerKm: freezed == baseFarePerKm ? _self.baseFarePerKm : baseFarePerKm // ignore: cast_nullable_to_non_nullable
as double?,minimumFare: freezed == minimumFare ? _self.minimumFare : minimumFare // ignore: cast_nullable_to_non_nullable
as int?,issuedDate: freezed == issuedDate ? _self.issuedDate : issuedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,stops: null == stops ? _self.stops : stops // ignore: cast_nullable_to_non_nullable
as List<RouteStop>,
  ));
}

}


/// Adds pattern-matching-related methods to [BusRoute].
extension BusRoutePatterns on BusRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusRoute value)  $default,){
final _that = this;
switch (_that) {
case _BusRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusRoute value)?  $default,){
final _that = this;
switch (_that) {
case _BusRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  int totalStops,  String region,  int? pdfPageNumber,  String? pdfUrl,  String? btrcUrl,  double? baseFarePerKm,  int? minimumFare,  DateTime? issuedDate,  List<RouteStop> stops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusRoute() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.totalStops,_that.region,_that.pdfPageNumber,_that.pdfUrl,_that.btrcUrl,_that.baseFarePerKm,_that.minimumFare,_that.issuedDate,_that.stops);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  int totalStops,  String region,  int? pdfPageNumber,  String? pdfUrl,  String? btrcUrl,  double? baseFarePerKm,  int? minimumFare,  DateTime? issuedDate,  List<RouteStop> stops)  $default,) {final _that = this;
switch (_that) {
case _BusRoute():
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.totalStops,_that.region,_that.pdfPageNumber,_that.pdfUrl,_that.btrcUrl,_that.baseFarePerKm,_that.minimumFare,_that.issuedDate,_that.stops);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  int totalStops,  String region,  int? pdfPageNumber,  String? pdfUrl,  String? btrcUrl,  double? baseFarePerKm,  int? minimumFare,  DateTime? issuedDate,  List<RouteStop> stops)?  $default,) {final _that = this;
switch (_that) {
case _BusRoute() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.totalStops,_that.region,_that.pdfPageNumber,_that.pdfUrl,_that.btrcUrl,_that.baseFarePerKm,_that.minimumFare,_that.issuedDate,_that.stops);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _BusRoute implements BusRoute {
  const _BusRoute({required this.id, required this.routeCode, required this.nameBn, this.nameEn, required this.totalDistanceKm, required this.totalStops, required this.region, this.pdfPageNumber, this.pdfUrl, this.btrcUrl, this.baseFarePerKm, this.minimumFare, this.issuedDate, final  List<RouteStop> stops = const []}): _stops = stops;
  factory _BusRoute.fromJson(Map<String, dynamic> json) => _$BusRouteFromJson(json);

@override final  String id;
// Strongly recommended to keep for DB lookups
@override final  String routeCode;
@override final  String nameBn;
@override final  String? nameEn;
@override final  double totalDistanceKm;
@override final  int totalStops;
@override final  String region;
@override final  int? pdfPageNumber;
@override final  String? pdfUrl;
@override final  String? btrcUrl;
@override final  double? baseFarePerKm;
@override final  int? minimumFare;
@override final  DateTime? issuedDate;
// The missing stops! Defaults to empty for the summary list view.
 final  List<RouteStop> _stops;
// The missing stops! Defaults to empty for the summary list view.
@override@JsonKey() List<RouteStop> get stops {
  if (_stops is EqualUnmodifiableListView) return _stops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stops);
}


/// Create a copy of BusRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusRouteCopyWith<_BusRoute> get copyWith => __$BusRouteCopyWithImpl<_BusRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistanceKm, totalDistanceKm) || other.totalDistanceKm == totalDistanceKm)&&(identical(other.totalStops, totalStops) || other.totalStops == totalStops)&&(identical(other.region, region) || other.region == region)&&(identical(other.pdfPageNumber, pdfPageNumber) || other.pdfPageNumber == pdfPageNumber)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseFarePerKm, baseFarePerKm) || other.baseFarePerKm == baseFarePerKm)&&(identical(other.minimumFare, minimumFare) || other.minimumFare == minimumFare)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&const DeepCollectionEquality().equals(other._stops, _stops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistanceKm,totalStops,region,pdfPageNumber,pdfUrl,btrcUrl,baseFarePerKm,minimumFare,issuedDate,const DeepCollectionEquality().hash(_stops));

@override
String toString() {
  return 'BusRoute(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, region: $region, pdfPageNumber: $pdfPageNumber, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate, stops: $stops)';
}


}

/// @nodoc
abstract mixin class _$BusRouteCopyWith<$Res> implements $BusRouteCopyWith<$Res> {
  factory _$BusRouteCopyWith(_BusRoute value, $Res Function(_BusRoute) _then) = __$BusRouteCopyWithImpl;
@override @useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistanceKm, int totalStops, String region, int? pdfPageNumber, String? pdfUrl, String? btrcUrl, double? baseFarePerKm, int? minimumFare, DateTime? issuedDate, List<RouteStop> stops
});




}
/// @nodoc
class __$BusRouteCopyWithImpl<$Res>
    implements _$BusRouteCopyWith<$Res> {
  __$BusRouteCopyWithImpl(this._self, this._then);

  final _BusRoute _self;
  final $Res Function(_BusRoute) _then;

/// Create a copy of BusRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistanceKm = null,Object? totalStops = null,Object? region = null,Object? pdfPageNumber = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseFarePerKm = freezed,Object? minimumFare = freezed,Object? issuedDate = freezed,Object? stops = null,}) {
  return _then(_BusRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,nameBn: null == nameBn ? _self.nameBn : nameBn // ignore: cast_nullable_to_non_nullable
as String,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,totalDistanceKm: null == totalDistanceKm ? _self.totalDistanceKm : totalDistanceKm // ignore: cast_nullable_to_non_nullable
as double,totalStops: null == totalStops ? _self.totalStops : totalStops // ignore: cast_nullable_to_non_nullable
as int,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,pdfPageNumber: freezed == pdfPageNumber ? _self.pdfPageNumber : pdfPageNumber // ignore: cast_nullable_to_non_nullable
as int?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,btrcUrl: freezed == btrcUrl ? _self.btrcUrl : btrcUrl // ignore: cast_nullable_to_non_nullable
as String?,baseFarePerKm: freezed == baseFarePerKm ? _self.baseFarePerKm : baseFarePerKm // ignore: cast_nullable_to_non_nullable
as double?,minimumFare: freezed == minimumFare ? _self.minimumFare : minimumFare // ignore: cast_nullable_to_non_nullable
as int?,issuedDate: freezed == issuedDate ? _self.issuedDate : issuedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,stops: null == stops ? _self._stops : stops // ignore: cast_nullable_to_non_nullable
as List<RouteStop>,
  ));
}


}

// dart format on

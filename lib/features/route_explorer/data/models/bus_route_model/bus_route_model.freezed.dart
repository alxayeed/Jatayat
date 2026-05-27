// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteStopModel {

 String get stopId; String get nameBn; int get sequenceOrder; double get cumulativeDistanceKm; String? get nameEn; double? get lat; double? get lng;
/// Create a copy of RouteStopModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteStopModelCopyWith<RouteStopModel> get copyWith => _$RouteStopModelCopyWithImpl<RouteStopModel>(this as RouteStopModel, _$identity);

  /// Serializes this RouteStopModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteStopModel&&(identical(other.stopId, stopId) || other.stopId == stopId)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.cumulativeDistanceKm, cumulativeDistanceKm) || other.cumulativeDistanceKm == cumulativeDistanceKm)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stopId,nameBn,sequenceOrder,cumulativeDistanceKm,nameEn,lat,lng);

@override
String toString() {
  return 'RouteStopModel(stopId: $stopId, nameBn: $nameBn, sequenceOrder: $sequenceOrder, cumulativeDistanceKm: $cumulativeDistanceKm, nameEn: $nameEn, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $RouteStopModelCopyWith<$Res>  {
  factory $RouteStopModelCopyWith(RouteStopModel value, $Res Function(RouteStopModel) _then) = _$RouteStopModelCopyWithImpl;
@useResult
$Res call({
 String stopId, String nameBn, int sequenceOrder, double cumulativeDistanceKm, String? nameEn, double? lat, double? lng
});




}
/// @nodoc
class _$RouteStopModelCopyWithImpl<$Res>
    implements $RouteStopModelCopyWith<$Res> {
  _$RouteStopModelCopyWithImpl(this._self, this._then);

  final RouteStopModel _self;
  final $Res Function(RouteStopModel) _then;

/// Create a copy of RouteStopModel
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


/// Adds pattern-matching-related methods to [RouteStopModel].
extension RouteStopModelPatterns on RouteStopModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteStopModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteStopModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteStopModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteStopModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteStopModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteStopModel() when $default != null:
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
case _RouteStopModel() when $default != null:
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
case _RouteStopModel():
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
case _RouteStopModel() when $default != null:
return $default(_that.stopId,_that.nameBn,_that.sequenceOrder,_that.cumulativeDistanceKm,_that.nameEn,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RouteStopModel extends RouteStopModel {
  const _RouteStopModel({required this.stopId, required this.nameBn, required this.sequenceOrder, required this.cumulativeDistanceKm, this.nameEn, this.lat, this.lng}): super._();
  factory _RouteStopModel.fromJson(Map<String, dynamic> json) => _$RouteStopModelFromJson(json);

@override final  String stopId;
@override final  String nameBn;
@override final  int sequenceOrder;
@override final  double cumulativeDistanceKm;
@override final  String? nameEn;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of RouteStopModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteStopModelCopyWith<_RouteStopModel> get copyWith => __$RouteStopModelCopyWithImpl<_RouteStopModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteStopModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteStopModel&&(identical(other.stopId, stopId) || other.stopId == stopId)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.cumulativeDistanceKm, cumulativeDistanceKm) || other.cumulativeDistanceKm == cumulativeDistanceKm)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stopId,nameBn,sequenceOrder,cumulativeDistanceKm,nameEn,lat,lng);

@override
String toString() {
  return 'RouteStopModel(stopId: $stopId, nameBn: $nameBn, sequenceOrder: $sequenceOrder, cumulativeDistanceKm: $cumulativeDistanceKm, nameEn: $nameEn, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$RouteStopModelCopyWith<$Res> implements $RouteStopModelCopyWith<$Res> {
  factory _$RouteStopModelCopyWith(_RouteStopModel value, $Res Function(_RouteStopModel) _then) = __$RouteStopModelCopyWithImpl;
@override @useResult
$Res call({
 String stopId, String nameBn, int sequenceOrder, double cumulativeDistanceKm, String? nameEn, double? lat, double? lng
});




}
/// @nodoc
class __$RouteStopModelCopyWithImpl<$Res>
    implements _$RouteStopModelCopyWith<$Res> {
  __$RouteStopModelCopyWithImpl(this._self, this._then);

  final _RouteStopModel _self;
  final $Res Function(_RouteStopModel) _then;

/// Create a copy of RouteStopModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stopId = null,Object? nameBn = null,Object? sequenceOrder = null,Object? cumulativeDistanceKm = null,Object? nameEn = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_RouteStopModel(
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
mixin _$BusRouteModel {

 String get id;// Added Primary Key
 String get routeCode; String get nameBn; String? get nameEn; double get totalDistanceKm; int get totalStops; String get region;// Nullable fields matching DB schema
 int? get pdfPageNumber; String? get pdfUrl; String? get btrcUrl; double? get baseFarePerKm; int? get minimumFare; DateTime? get issuedDate;// The list of stops (defaults to empty for the "Lazy Loading" list view)
 List<RouteStopModel> get stops;
/// Create a copy of BusRouteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusRouteModelCopyWith<BusRouteModel> get copyWith => _$BusRouteModelCopyWithImpl<BusRouteModel>(this as BusRouteModel, _$identity);

  /// Serializes this BusRouteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusRouteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistanceKm, totalDistanceKm) || other.totalDistanceKm == totalDistanceKm)&&(identical(other.totalStops, totalStops) || other.totalStops == totalStops)&&(identical(other.region, region) || other.region == region)&&(identical(other.pdfPageNumber, pdfPageNumber) || other.pdfPageNumber == pdfPageNumber)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseFarePerKm, baseFarePerKm) || other.baseFarePerKm == baseFarePerKm)&&(identical(other.minimumFare, minimumFare) || other.minimumFare == minimumFare)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&const DeepCollectionEquality().equals(other.stops, stops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistanceKm,totalStops,region,pdfPageNumber,pdfUrl,btrcUrl,baseFarePerKm,minimumFare,issuedDate,const DeepCollectionEquality().hash(stops));

@override
String toString() {
  return 'BusRouteModel(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, region: $region, pdfPageNumber: $pdfPageNumber, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate, stops: $stops)';
}


}

/// @nodoc
abstract mixin class $BusRouteModelCopyWith<$Res>  {
  factory $BusRouteModelCopyWith(BusRouteModel value, $Res Function(BusRouteModel) _then) = _$BusRouteModelCopyWithImpl;
@useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistanceKm, int totalStops, String region, int? pdfPageNumber, String? pdfUrl, String? btrcUrl, double? baseFarePerKm, int? minimumFare, DateTime? issuedDate, List<RouteStopModel> stops
});




}
/// @nodoc
class _$BusRouteModelCopyWithImpl<$Res>
    implements $BusRouteModelCopyWith<$Res> {
  _$BusRouteModelCopyWithImpl(this._self, this._then);

  final BusRouteModel _self;
  final $Res Function(BusRouteModel) _then;

/// Create a copy of BusRouteModel
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
as List<RouteStopModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BusRouteModel].
extension BusRouteModelPatterns on BusRouteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusRouteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusRouteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusRouteModel value)  $default,){
final _that = this;
switch (_that) {
case _BusRouteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusRouteModel value)?  $default,){
final _that = this;
switch (_that) {
case _BusRouteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  int totalStops,  String region,  int? pdfPageNumber,  String? pdfUrl,  String? btrcUrl,  double? baseFarePerKm,  int? minimumFare,  DateTime? issuedDate,  List<RouteStopModel> stops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusRouteModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  int totalStops,  String region,  int? pdfPageNumber,  String? pdfUrl,  String? btrcUrl,  double? baseFarePerKm,  int? minimumFare,  DateTime? issuedDate,  List<RouteStopModel> stops)  $default,) {final _that = this;
switch (_that) {
case _BusRouteModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String routeCode,  String nameBn,  String? nameEn,  double totalDistanceKm,  int totalStops,  String region,  int? pdfPageNumber,  String? pdfUrl,  String? btrcUrl,  double? baseFarePerKm,  int? minimumFare,  DateTime? issuedDate,  List<RouteStopModel> stops)?  $default,) {final _that = this;
switch (_that) {
case _BusRouteModel() when $default != null:
return $default(_that.id,_that.routeCode,_that.nameBn,_that.nameEn,_that.totalDistanceKm,_that.totalStops,_that.region,_that.pdfPageNumber,_that.pdfUrl,_that.btrcUrl,_that.baseFarePerKm,_that.minimumFare,_that.issuedDate,_that.stops);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _BusRouteModel extends BusRouteModel {
  const _BusRouteModel({required this.id, required this.routeCode, required this.nameBn, this.nameEn, required this.totalDistanceKm, required this.totalStops, required this.region, this.pdfPageNumber, this.pdfUrl, this.btrcUrl, this.baseFarePerKm, this.minimumFare, this.issuedDate, final  List<RouteStopModel> stops = const []}): _stops = stops,super._();
  factory _BusRouteModel.fromJson(Map<String, dynamic> json) => _$BusRouteModelFromJson(json);

@override final  String id;
// Added Primary Key
@override final  String routeCode;
@override final  String nameBn;
@override final  String? nameEn;
@override final  double totalDistanceKm;
@override final  int totalStops;
@override final  String region;
// Nullable fields matching DB schema
@override final  int? pdfPageNumber;
@override final  String? pdfUrl;
@override final  String? btrcUrl;
@override final  double? baseFarePerKm;
@override final  int? minimumFare;
@override final  DateTime? issuedDate;
// The list of stops (defaults to empty for the "Lazy Loading" list view)
 final  List<RouteStopModel> _stops;
// The list of stops (defaults to empty for the "Lazy Loading" list view)
@override@JsonKey() List<RouteStopModel> get stops {
  if (_stops is EqualUnmodifiableListView) return _stops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stops);
}


/// Create a copy of BusRouteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusRouteModelCopyWith<_BusRouteModel> get copyWith => __$BusRouteModelCopyWithImpl<_BusRouteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusRouteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusRouteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.nameBn, nameBn) || other.nameBn == nameBn)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.totalDistanceKm, totalDistanceKm) || other.totalDistanceKm == totalDistanceKm)&&(identical(other.totalStops, totalStops) || other.totalStops == totalStops)&&(identical(other.region, region) || other.region == region)&&(identical(other.pdfPageNumber, pdfPageNumber) || other.pdfPageNumber == pdfPageNumber)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.btrcUrl, btrcUrl) || other.btrcUrl == btrcUrl)&&(identical(other.baseFarePerKm, baseFarePerKm) || other.baseFarePerKm == baseFarePerKm)&&(identical(other.minimumFare, minimumFare) || other.minimumFare == minimumFare)&&(identical(other.issuedDate, issuedDate) || other.issuedDate == issuedDate)&&const DeepCollectionEquality().equals(other._stops, _stops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,routeCode,nameBn,nameEn,totalDistanceKm,totalStops,region,pdfPageNumber,pdfUrl,btrcUrl,baseFarePerKm,minimumFare,issuedDate,const DeepCollectionEquality().hash(_stops));

@override
String toString() {
  return 'BusRouteModel(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, totalStops: $totalStops, region: $region, pdfPageNumber: $pdfPageNumber, pdfUrl: $pdfUrl, btrcUrl: $btrcUrl, baseFarePerKm: $baseFarePerKm, minimumFare: $minimumFare, issuedDate: $issuedDate, stops: $stops)';
}


}

/// @nodoc
abstract mixin class _$BusRouteModelCopyWith<$Res> implements $BusRouteModelCopyWith<$Res> {
  factory _$BusRouteModelCopyWith(_BusRouteModel value, $Res Function(_BusRouteModel) _then) = __$BusRouteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String routeCode, String nameBn, String? nameEn, double totalDistanceKm, int totalStops, String region, int? pdfPageNumber, String? pdfUrl, String? btrcUrl, double? baseFarePerKm, int? minimumFare, DateTime? issuedDate, List<RouteStopModel> stops
});




}
/// @nodoc
class __$BusRouteModelCopyWithImpl<$Res>
    implements _$BusRouteModelCopyWith<$Res> {
  __$BusRouteModelCopyWithImpl(this._self, this._then);

  final _BusRouteModel _self;
  final $Res Function(_BusRouteModel) _then;

/// Create a copy of BusRouteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? routeCode = null,Object? nameBn = null,Object? nameEn = freezed,Object? totalDistanceKm = null,Object? totalStops = null,Object? region = null,Object? pdfPageNumber = freezed,Object? pdfUrl = freezed,Object? btrcUrl = freezed,Object? baseFarePerKm = freezed,Object? minimumFare = freezed,Object? issuedDate = freezed,Object? stops = null,}) {
  return _then(_BusRouteModel(
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
as List<RouteStopModel>,
  ));
}


}

// dart format on

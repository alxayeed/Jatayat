// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FareSearchState {

 List<StopEntity> get originSuggestions; List<StopEntity> get destinationSuggestions; List<FareResultEntity> get fareResults; StopEntity? get selectedOrigin; StopEntity? get selectedDestination; bool get isLoading; bool get isDestinationsLoading; bool get isCalculatingFare; bool get isOriginDropdownOpen; bool get isDestinationDropdownOpen; String? get errorMessage; TransitRegion get selectedRegion;
/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FareSearchStateCopyWith<FareSearchState> get copyWith => _$FareSearchStateCopyWithImpl<FareSearchState>(this as FareSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FareSearchState&&const DeepCollectionEquality().equals(other.originSuggestions, originSuggestions)&&const DeepCollectionEquality().equals(other.destinationSuggestions, destinationSuggestions)&&const DeepCollectionEquality().equals(other.fareResults, fareResults)&&(identical(other.selectedOrigin, selectedOrigin) || other.selectedOrigin == selectedOrigin)&&(identical(other.selectedDestination, selectedDestination) || other.selectedDestination == selectedDestination)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDestinationsLoading, isDestinationsLoading) || other.isDestinationsLoading == isDestinationsLoading)&&(identical(other.isCalculatingFare, isCalculatingFare) || other.isCalculatingFare == isCalculatingFare)&&(identical(other.isOriginDropdownOpen, isOriginDropdownOpen) || other.isOriginDropdownOpen == isOriginDropdownOpen)&&(identical(other.isDestinationDropdownOpen, isDestinationDropdownOpen) || other.isDestinationDropdownOpen == isDestinationDropdownOpen)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedRegion, selectedRegion) || other.selectedRegion == selectedRegion));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(originSuggestions),const DeepCollectionEquality().hash(destinationSuggestions),const DeepCollectionEquality().hash(fareResults),selectedOrigin,selectedDestination,isLoading,isDestinationsLoading,isCalculatingFare,isOriginDropdownOpen,isDestinationDropdownOpen,errorMessage,selectedRegion);

@override
String toString() {
  return 'FareSearchState(originSuggestions: $originSuggestions, destinationSuggestions: $destinationSuggestions, fareResults: $fareResults, selectedOrigin: $selectedOrigin, selectedDestination: $selectedDestination, isLoading: $isLoading, isDestinationsLoading: $isDestinationsLoading, isCalculatingFare: $isCalculatingFare, isOriginDropdownOpen: $isOriginDropdownOpen, isDestinationDropdownOpen: $isDestinationDropdownOpen, errorMessage: $errorMessage, selectedRegion: $selectedRegion)';
}


}

/// @nodoc
abstract mixin class $FareSearchStateCopyWith<$Res>  {
  factory $FareSearchStateCopyWith(FareSearchState value, $Res Function(FareSearchState) _then) = _$FareSearchStateCopyWithImpl;
@useResult
$Res call({
 List<StopEntity> originSuggestions, List<StopEntity> destinationSuggestions, List<FareResultEntity> fareResults, StopEntity? selectedOrigin, StopEntity? selectedDestination, bool isLoading, bool isDestinationsLoading, bool isCalculatingFare, bool isOriginDropdownOpen, bool isDestinationDropdownOpen, String? errorMessage, TransitRegion selectedRegion
});


$StopEntityCopyWith<$Res>? get selectedOrigin;$StopEntityCopyWith<$Res>? get selectedDestination;

}
/// @nodoc
class _$FareSearchStateCopyWithImpl<$Res>
    implements $FareSearchStateCopyWith<$Res> {
  _$FareSearchStateCopyWithImpl(this._self, this._then);

  final FareSearchState _self;
  final $Res Function(FareSearchState) _then;

/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originSuggestions = null,Object? destinationSuggestions = null,Object? fareResults = null,Object? selectedOrigin = freezed,Object? selectedDestination = freezed,Object? isLoading = null,Object? isDestinationsLoading = null,Object? isCalculatingFare = null,Object? isOriginDropdownOpen = null,Object? isDestinationDropdownOpen = null,Object? errorMessage = freezed,Object? selectedRegion = null,}) {
  return _then(_self.copyWith(
originSuggestions: null == originSuggestions ? _self.originSuggestions : originSuggestions // ignore: cast_nullable_to_non_nullable
as List<StopEntity>,destinationSuggestions: null == destinationSuggestions ? _self.destinationSuggestions : destinationSuggestions // ignore: cast_nullable_to_non_nullable
as List<StopEntity>,fareResults: null == fareResults ? _self.fareResults : fareResults // ignore: cast_nullable_to_non_nullable
as List<FareResultEntity>,selectedOrigin: freezed == selectedOrigin ? _self.selectedOrigin : selectedOrigin // ignore: cast_nullable_to_non_nullable
as StopEntity?,selectedDestination: freezed == selectedDestination ? _self.selectedDestination : selectedDestination // ignore: cast_nullable_to_non_nullable
as StopEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDestinationsLoading: null == isDestinationsLoading ? _self.isDestinationsLoading : isDestinationsLoading // ignore: cast_nullable_to_non_nullable
as bool,isCalculatingFare: null == isCalculatingFare ? _self.isCalculatingFare : isCalculatingFare // ignore: cast_nullable_to_non_nullable
as bool,isOriginDropdownOpen: null == isOriginDropdownOpen ? _self.isOriginDropdownOpen : isOriginDropdownOpen // ignore: cast_nullable_to_non_nullable
as bool,isDestinationDropdownOpen: null == isDestinationDropdownOpen ? _self.isDestinationDropdownOpen : isDestinationDropdownOpen // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedRegion: null == selectedRegion ? _self.selectedRegion : selectedRegion // ignore: cast_nullable_to_non_nullable
as TransitRegion,
  ));
}
/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopEntityCopyWith<$Res>? get selectedOrigin {
    if (_self.selectedOrigin == null) {
    return null;
  }

  return $StopEntityCopyWith<$Res>(_self.selectedOrigin!, (value) {
    return _then(_self.copyWith(selectedOrigin: value));
  });
}/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopEntityCopyWith<$Res>? get selectedDestination {
    if (_self.selectedDestination == null) {
    return null;
  }

  return $StopEntityCopyWith<$Res>(_self.selectedDestination!, (value) {
    return _then(_self.copyWith(selectedDestination: value));
  });
}
}


/// Adds pattern-matching-related methods to [FareSearchState].
extension FareSearchStatePatterns on FareSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FareSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FareSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FareSearchState value)  $default,){
final _that = this;
switch (_that) {
case _FareSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FareSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _FareSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StopEntity> originSuggestions,  List<StopEntity> destinationSuggestions,  List<FareResultEntity> fareResults,  StopEntity? selectedOrigin,  StopEntity? selectedDestination,  bool isLoading,  bool isDestinationsLoading,  bool isCalculatingFare,  bool isOriginDropdownOpen,  bool isDestinationDropdownOpen,  String? errorMessage,  TransitRegion selectedRegion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FareSearchState() when $default != null:
return $default(_that.originSuggestions,_that.destinationSuggestions,_that.fareResults,_that.selectedOrigin,_that.selectedDestination,_that.isLoading,_that.isDestinationsLoading,_that.isCalculatingFare,_that.isOriginDropdownOpen,_that.isDestinationDropdownOpen,_that.errorMessage,_that.selectedRegion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StopEntity> originSuggestions,  List<StopEntity> destinationSuggestions,  List<FareResultEntity> fareResults,  StopEntity? selectedOrigin,  StopEntity? selectedDestination,  bool isLoading,  bool isDestinationsLoading,  bool isCalculatingFare,  bool isOriginDropdownOpen,  bool isDestinationDropdownOpen,  String? errorMessage,  TransitRegion selectedRegion)  $default,) {final _that = this;
switch (_that) {
case _FareSearchState():
return $default(_that.originSuggestions,_that.destinationSuggestions,_that.fareResults,_that.selectedOrigin,_that.selectedDestination,_that.isLoading,_that.isDestinationsLoading,_that.isCalculatingFare,_that.isOriginDropdownOpen,_that.isDestinationDropdownOpen,_that.errorMessage,_that.selectedRegion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StopEntity> originSuggestions,  List<StopEntity> destinationSuggestions,  List<FareResultEntity> fareResults,  StopEntity? selectedOrigin,  StopEntity? selectedDestination,  bool isLoading,  bool isDestinationsLoading,  bool isCalculatingFare,  bool isOriginDropdownOpen,  bool isDestinationDropdownOpen,  String? errorMessage,  TransitRegion selectedRegion)?  $default,) {final _that = this;
switch (_that) {
case _FareSearchState() when $default != null:
return $default(_that.originSuggestions,_that.destinationSuggestions,_that.fareResults,_that.selectedOrigin,_that.selectedDestination,_that.isLoading,_that.isDestinationsLoading,_that.isCalculatingFare,_that.isOriginDropdownOpen,_that.isDestinationDropdownOpen,_that.errorMessage,_that.selectedRegion);case _:
  return null;

}
}

}

/// @nodoc


class _FareSearchState implements FareSearchState {
  const _FareSearchState({final  List<StopEntity> originSuggestions = const [], final  List<StopEntity> destinationSuggestions = const [], final  List<FareResultEntity> fareResults = const [], this.selectedOrigin, this.selectedDestination, this.isLoading = false, this.isDestinationsLoading = false, this.isCalculatingFare = false, this.isOriginDropdownOpen = false, this.isDestinationDropdownOpen = false, this.errorMessage, this.selectedRegion = TransitRegion.dhakaMetro}): _originSuggestions = originSuggestions,_destinationSuggestions = destinationSuggestions,_fareResults = fareResults;
  

 final  List<StopEntity> _originSuggestions;
@override@JsonKey() List<StopEntity> get originSuggestions {
  if (_originSuggestions is EqualUnmodifiableListView) return _originSuggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originSuggestions);
}

 final  List<StopEntity> _destinationSuggestions;
@override@JsonKey() List<StopEntity> get destinationSuggestions {
  if (_destinationSuggestions is EqualUnmodifiableListView) return _destinationSuggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_destinationSuggestions);
}

 final  List<FareResultEntity> _fareResults;
@override@JsonKey() List<FareResultEntity> get fareResults {
  if (_fareResults is EqualUnmodifiableListView) return _fareResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fareResults);
}

@override final  StopEntity? selectedOrigin;
@override final  StopEntity? selectedDestination;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isDestinationsLoading;
@override@JsonKey() final  bool isCalculatingFare;
@override@JsonKey() final  bool isOriginDropdownOpen;
@override@JsonKey() final  bool isDestinationDropdownOpen;
@override final  String? errorMessage;
@override@JsonKey() final  TransitRegion selectedRegion;

/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FareSearchStateCopyWith<_FareSearchState> get copyWith => __$FareSearchStateCopyWithImpl<_FareSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FareSearchState&&const DeepCollectionEquality().equals(other._originSuggestions, _originSuggestions)&&const DeepCollectionEquality().equals(other._destinationSuggestions, _destinationSuggestions)&&const DeepCollectionEquality().equals(other._fareResults, _fareResults)&&(identical(other.selectedOrigin, selectedOrigin) || other.selectedOrigin == selectedOrigin)&&(identical(other.selectedDestination, selectedDestination) || other.selectedDestination == selectedDestination)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDestinationsLoading, isDestinationsLoading) || other.isDestinationsLoading == isDestinationsLoading)&&(identical(other.isCalculatingFare, isCalculatingFare) || other.isCalculatingFare == isCalculatingFare)&&(identical(other.isOriginDropdownOpen, isOriginDropdownOpen) || other.isOriginDropdownOpen == isOriginDropdownOpen)&&(identical(other.isDestinationDropdownOpen, isDestinationDropdownOpen) || other.isDestinationDropdownOpen == isDestinationDropdownOpen)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.selectedRegion, selectedRegion) || other.selectedRegion == selectedRegion));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originSuggestions),const DeepCollectionEquality().hash(_destinationSuggestions),const DeepCollectionEquality().hash(_fareResults),selectedOrigin,selectedDestination,isLoading,isDestinationsLoading,isCalculatingFare,isOriginDropdownOpen,isDestinationDropdownOpen,errorMessage,selectedRegion);

@override
String toString() {
  return 'FareSearchState(originSuggestions: $originSuggestions, destinationSuggestions: $destinationSuggestions, fareResults: $fareResults, selectedOrigin: $selectedOrigin, selectedDestination: $selectedDestination, isLoading: $isLoading, isDestinationsLoading: $isDestinationsLoading, isCalculatingFare: $isCalculatingFare, isOriginDropdownOpen: $isOriginDropdownOpen, isDestinationDropdownOpen: $isDestinationDropdownOpen, errorMessage: $errorMessage, selectedRegion: $selectedRegion)';
}


}

/// @nodoc
abstract mixin class _$FareSearchStateCopyWith<$Res> implements $FareSearchStateCopyWith<$Res> {
  factory _$FareSearchStateCopyWith(_FareSearchState value, $Res Function(_FareSearchState) _then) = __$FareSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<StopEntity> originSuggestions, List<StopEntity> destinationSuggestions, List<FareResultEntity> fareResults, StopEntity? selectedOrigin, StopEntity? selectedDestination, bool isLoading, bool isDestinationsLoading, bool isCalculatingFare, bool isOriginDropdownOpen, bool isDestinationDropdownOpen, String? errorMessage, TransitRegion selectedRegion
});


@override $StopEntityCopyWith<$Res>? get selectedOrigin;@override $StopEntityCopyWith<$Res>? get selectedDestination;

}
/// @nodoc
class __$FareSearchStateCopyWithImpl<$Res>
    implements _$FareSearchStateCopyWith<$Res> {
  __$FareSearchStateCopyWithImpl(this._self, this._then);

  final _FareSearchState _self;
  final $Res Function(_FareSearchState) _then;

/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originSuggestions = null,Object? destinationSuggestions = null,Object? fareResults = null,Object? selectedOrigin = freezed,Object? selectedDestination = freezed,Object? isLoading = null,Object? isDestinationsLoading = null,Object? isCalculatingFare = null,Object? isOriginDropdownOpen = null,Object? isDestinationDropdownOpen = null,Object? errorMessage = freezed,Object? selectedRegion = null,}) {
  return _then(_FareSearchState(
originSuggestions: null == originSuggestions ? _self._originSuggestions : originSuggestions // ignore: cast_nullable_to_non_nullable
as List<StopEntity>,destinationSuggestions: null == destinationSuggestions ? _self._destinationSuggestions : destinationSuggestions // ignore: cast_nullable_to_non_nullable
as List<StopEntity>,fareResults: null == fareResults ? _self._fareResults : fareResults // ignore: cast_nullable_to_non_nullable
as List<FareResultEntity>,selectedOrigin: freezed == selectedOrigin ? _self.selectedOrigin : selectedOrigin // ignore: cast_nullable_to_non_nullable
as StopEntity?,selectedDestination: freezed == selectedDestination ? _self.selectedDestination : selectedDestination // ignore: cast_nullable_to_non_nullable
as StopEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDestinationsLoading: null == isDestinationsLoading ? _self.isDestinationsLoading : isDestinationsLoading // ignore: cast_nullable_to_non_nullable
as bool,isCalculatingFare: null == isCalculatingFare ? _self.isCalculatingFare : isCalculatingFare // ignore: cast_nullable_to_non_nullable
as bool,isOriginDropdownOpen: null == isOriginDropdownOpen ? _self.isOriginDropdownOpen : isOriginDropdownOpen // ignore: cast_nullable_to_non_nullable
as bool,isDestinationDropdownOpen: null == isDestinationDropdownOpen ? _self.isDestinationDropdownOpen : isDestinationDropdownOpen // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,selectedRegion: null == selectedRegion ? _self.selectedRegion : selectedRegion // ignore: cast_nullable_to_non_nullable
as TransitRegion,
  ));
}

/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopEntityCopyWith<$Res>? get selectedOrigin {
    if (_self.selectedOrigin == null) {
    return null;
  }

  return $StopEntityCopyWith<$Res>(_self.selectedOrigin!, (value) {
    return _then(_self.copyWith(selectedOrigin: value));
  });
}/// Create a copy of FareSearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopEntityCopyWith<$Res>? get selectedDestination {
    if (_self.selectedDestination == null) {
    return null;
  }

  return $StopEntityCopyWith<$Res>(_self.selectedDestination!, (value) {
    return _then(_self.copyWith(selectedDestination: value));
  });
}
}

// dart format on

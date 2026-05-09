// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FareSearchState {
  List<StopEntity> get originSuggestions => throw _privateConstructorUsedError;
  List<StopEntity> get destinationSuggestions =>
      throw _privateConstructorUsedError;
  List<FareResultEntity> get fareResults => throw _privateConstructorUsedError;
  StopEntity? get selectedOrigin => throw _privateConstructorUsedError;
  StopEntity? get selectedDestination => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FareSearchStateCopyWith<FareSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FareSearchStateCopyWith<$Res> {
  factory $FareSearchStateCopyWith(
    FareSearchState value,
    $Res Function(FareSearchState) then,
  ) = _$FareSearchStateCopyWithImpl<$Res, FareSearchState>;
  @useResult
  $Res call({
    List<StopEntity> originSuggestions,
    List<StopEntity> destinationSuggestions,
    List<FareResultEntity> fareResults,
    StopEntity? selectedOrigin,
    StopEntity? selectedDestination,
    bool isLoading,
    String? errorMessage,
  });

  $StopEntityCopyWith<$Res>? get selectedOrigin;
  $StopEntityCopyWith<$Res>? get selectedDestination;
}

/// @nodoc
class _$FareSearchStateCopyWithImpl<$Res, $Val extends FareSearchState>
    implements $FareSearchStateCopyWith<$Res> {
  _$FareSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originSuggestions = null,
    Object? destinationSuggestions = null,
    Object? fareResults = null,
    Object? selectedOrigin = freezed,
    Object? selectedDestination = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            originSuggestions: null == originSuggestions
                ? _value.originSuggestions
                : originSuggestions // ignore: cast_nullable_to_non_nullable
                      as List<StopEntity>,
            destinationSuggestions: null == destinationSuggestions
                ? _value.destinationSuggestions
                : destinationSuggestions // ignore: cast_nullable_to_non_nullable
                      as List<StopEntity>,
            fareResults: null == fareResults
                ? _value.fareResults
                : fareResults // ignore: cast_nullable_to_non_nullable
                      as List<FareResultEntity>,
            selectedOrigin: freezed == selectedOrigin
                ? _value.selectedOrigin
                : selectedOrigin // ignore: cast_nullable_to_non_nullable
                      as StopEntity?,
            selectedDestination: freezed == selectedDestination
                ? _value.selectedDestination
                : selectedDestination // ignore: cast_nullable_to_non_nullable
                      as StopEntity?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StopEntityCopyWith<$Res>? get selectedOrigin {
    if (_value.selectedOrigin == null) {
      return null;
    }

    return $StopEntityCopyWith<$Res>(_value.selectedOrigin!, (value) {
      return _then(_value.copyWith(selectedOrigin: value) as $Val);
    });
  }

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StopEntityCopyWith<$Res>? get selectedDestination {
    if (_value.selectedDestination == null) {
      return null;
    }

    return $StopEntityCopyWith<$Res>(_value.selectedDestination!, (value) {
      return _then(_value.copyWith(selectedDestination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FareSearchStateImplCopyWith<$Res>
    implements $FareSearchStateCopyWith<$Res> {
  factory _$$FareSearchStateImplCopyWith(
    _$FareSearchStateImpl value,
    $Res Function(_$FareSearchStateImpl) then,
  ) = __$$FareSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<StopEntity> originSuggestions,
    List<StopEntity> destinationSuggestions,
    List<FareResultEntity> fareResults,
    StopEntity? selectedOrigin,
    StopEntity? selectedDestination,
    bool isLoading,
    String? errorMessage,
  });

  @override
  $StopEntityCopyWith<$Res>? get selectedOrigin;
  @override
  $StopEntityCopyWith<$Res>? get selectedDestination;
}

/// @nodoc
class __$$FareSearchStateImplCopyWithImpl<$Res>
    extends _$FareSearchStateCopyWithImpl<$Res, _$FareSearchStateImpl>
    implements _$$FareSearchStateImplCopyWith<$Res> {
  __$$FareSearchStateImplCopyWithImpl(
    _$FareSearchStateImpl _value,
    $Res Function(_$FareSearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originSuggestions = null,
    Object? destinationSuggestions = null,
    Object? fareResults = null,
    Object? selectedOrigin = freezed,
    Object? selectedDestination = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$FareSearchStateImpl(
        originSuggestions: null == originSuggestions
            ? _value._originSuggestions
            : originSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<StopEntity>,
        destinationSuggestions: null == destinationSuggestions
            ? _value._destinationSuggestions
            : destinationSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<StopEntity>,
        fareResults: null == fareResults
            ? _value._fareResults
            : fareResults // ignore: cast_nullable_to_non_nullable
                  as List<FareResultEntity>,
        selectedOrigin: freezed == selectedOrigin
            ? _value.selectedOrigin
            : selectedOrigin // ignore: cast_nullable_to_non_nullable
                  as StopEntity?,
        selectedDestination: freezed == selectedDestination
            ? _value.selectedDestination
            : selectedDestination // ignore: cast_nullable_to_non_nullable
                  as StopEntity?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FareSearchStateImpl implements _FareSearchState {
  const _$FareSearchStateImpl({
    final List<StopEntity> originSuggestions = const [],
    final List<StopEntity> destinationSuggestions = const [],
    final List<FareResultEntity> fareResults = const [],
    this.selectedOrigin,
    this.selectedDestination,
    this.isLoading = false,
    this.errorMessage,
  }) : _originSuggestions = originSuggestions,
       _destinationSuggestions = destinationSuggestions,
       _fareResults = fareResults;

  final List<StopEntity> _originSuggestions;
  @override
  @JsonKey()
  List<StopEntity> get originSuggestions {
    if (_originSuggestions is EqualUnmodifiableListView)
      return _originSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_originSuggestions);
  }

  final List<StopEntity> _destinationSuggestions;
  @override
  @JsonKey()
  List<StopEntity> get destinationSuggestions {
    if (_destinationSuggestions is EqualUnmodifiableListView)
      return _destinationSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinationSuggestions);
  }

  final List<FareResultEntity> _fareResults;
  @override
  @JsonKey()
  List<FareResultEntity> get fareResults {
    if (_fareResults is EqualUnmodifiableListView) return _fareResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fareResults);
  }

  @override
  final StopEntity? selectedOrigin;
  @override
  final StopEntity? selectedDestination;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FareSearchState(originSuggestions: $originSuggestions, destinationSuggestions: $destinationSuggestions, fareResults: $fareResults, selectedOrigin: $selectedOrigin, selectedDestination: $selectedDestination, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FareSearchStateImpl &&
            const DeepCollectionEquality().equals(
              other._originSuggestions,
              _originSuggestions,
            ) &&
            const DeepCollectionEquality().equals(
              other._destinationSuggestions,
              _destinationSuggestions,
            ) &&
            const DeepCollectionEquality().equals(
              other._fareResults,
              _fareResults,
            ) &&
            (identical(other.selectedOrigin, selectedOrigin) ||
                other.selectedOrigin == selectedOrigin) &&
            (identical(other.selectedDestination, selectedDestination) ||
                other.selectedDestination == selectedDestination) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_originSuggestions),
    const DeepCollectionEquality().hash(_destinationSuggestions),
    const DeepCollectionEquality().hash(_fareResults),
    selectedOrigin,
    selectedDestination,
    isLoading,
    errorMessage,
  );

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FareSearchStateImplCopyWith<_$FareSearchStateImpl> get copyWith =>
      __$$FareSearchStateImplCopyWithImpl<_$FareSearchStateImpl>(
        this,
        _$identity,
      );
}

abstract class _FareSearchState implements FareSearchState {
  const factory _FareSearchState({
    final List<StopEntity> originSuggestions,
    final List<StopEntity> destinationSuggestions,
    final List<FareResultEntity> fareResults,
    final StopEntity? selectedOrigin,
    final StopEntity? selectedDestination,
    final bool isLoading,
    final String? errorMessage,
  }) = _$FareSearchStateImpl;

  @override
  List<StopEntity> get originSuggestions;
  @override
  List<StopEntity> get destinationSuggestions;
  @override
  List<FareResultEntity> get fareResults;
  @override
  StopEntity? get selectedOrigin;
  @override
  StopEntity? get selectedDestination;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of FareSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FareSearchStateImplCopyWith<_$FareSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

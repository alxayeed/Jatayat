// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RouteEntity {
  String get id => throw _privateConstructorUsedError;
  String get routeCode => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  double get totalDistance => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  int get pdfPage => throw _privateConstructorUsedError;

  /// Create a copy of RouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteEntityCopyWith<RouteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteEntityCopyWith<$Res> {
  factory $RouteEntityCopyWith(
    RouteEntity value,
    $Res Function(RouteEntity) then,
  ) = _$RouteEntityCopyWithImpl<$Res, RouteEntity>;
  @useResult
  $Res call({
    String id,
    String routeCode,
    String nameBn,
    double totalDistance,
    String documentId,
    int pdfPage,
  });
}

/// @nodoc
class _$RouteEntityCopyWithImpl<$Res, $Val extends RouteEntity>
    implements $RouteEntityCopyWith<$Res> {
  _$RouteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
    Object? totalDistance = null,
    Object? documentId = null,
    Object? pdfPage = null,
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
            totalDistance: null == totalDistance
                ? _value.totalDistance
                : totalDistance // ignore: cast_nullable_to_non_nullable
                      as double,
            documentId: null == documentId
                ? _value.documentId
                : documentId // ignore: cast_nullable_to_non_nullable
                      as String,
            pdfPage: null == pdfPage
                ? _value.pdfPage
                : pdfPage // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteEntityImplCopyWith<$Res>
    implements $RouteEntityCopyWith<$Res> {
  factory _$$RouteEntityImplCopyWith(
    _$RouteEntityImpl value,
    $Res Function(_$RouteEntityImpl) then,
  ) = __$$RouteEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String routeCode,
    String nameBn,
    double totalDistance,
    String documentId,
    int pdfPage,
  });
}

/// @nodoc
class __$$RouteEntityImplCopyWithImpl<$Res>
    extends _$RouteEntityCopyWithImpl<$Res, _$RouteEntityImpl>
    implements _$$RouteEntityImplCopyWith<$Res> {
  __$$RouteEntityImplCopyWithImpl(
    _$RouteEntityImpl _value,
    $Res Function(_$RouteEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
    Object? totalDistance = null,
    Object? documentId = null,
    Object? pdfPage = null,
  }) {
    return _then(
      _$RouteEntityImpl(
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
        totalDistance: null == totalDistance
            ? _value.totalDistance
            : totalDistance // ignore: cast_nullable_to_non_nullable
                  as double,
        documentId: null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                  as String,
        pdfPage: null == pdfPage
            ? _value.pdfPage
            : pdfPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RouteEntityImpl implements _RouteEntity {
  const _$RouteEntityImpl({
    required this.id,
    required this.routeCode,
    required this.nameBn,
    required this.totalDistance,
    required this.documentId,
    required this.pdfPage,
  });

  @override
  final String id;
  @override
  final String routeCode;
  @override
  final String nameBn;
  @override
  final double totalDistance;
  @override
  final String documentId;
  @override
  final int pdfPage;

  @override
  String toString() {
    return 'RouteEntity(id: $id, routeCode: $routeCode, nameBn: $nameBn, totalDistance: $totalDistance, documentId: $documentId, pdfPage: $pdfPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.pdfPage, pdfPage) || other.pdfPage == pdfPage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    routeCode,
    nameBn,
    totalDistance,
    documentId,
    pdfPage,
  );

  /// Create a copy of RouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteEntityImplCopyWith<_$RouteEntityImpl> get copyWith =>
      __$$RouteEntityImplCopyWithImpl<_$RouteEntityImpl>(this, _$identity);
}

abstract class _RouteEntity implements RouteEntity {
  const factory _RouteEntity({
    required final String id,
    required final String routeCode,
    required final String nameBn,
    required final double totalDistance,
    required final String documentId,
    required final int pdfPage,
  }) = _$RouteEntityImpl;

  @override
  String get id;
  @override
  String get routeCode;
  @override
  String get nameBn;
  @override
  double get totalDistance;
  @override
  String get documentId;
  @override
  int get pdfPage;

  /// Create a copy of RouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteEntityImplCopyWith<_$RouteEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

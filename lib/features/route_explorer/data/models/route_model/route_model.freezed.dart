// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) {
  return _RouteModel.fromJson(json);
}

/// @nodoc
mixin _$RouteModel {
  String get id => throw _privateConstructorUsedError;
  String get routeCode => throw _privateConstructorUsedError;
  String get nameBn => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  double get totalDistanceKm => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  int get pdfPageNumber => throw _privateConstructorUsedError;
  Map<String, dynamic> get documents => throw _privateConstructorUsedError;

  /// Serializes this RouteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteModelCopyWith<RouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteModelCopyWith<$Res> {
  factory $RouteModelCopyWith(
    RouteModel value,
    $Res Function(RouteModel) then,
  ) = _$RouteModelCopyWithImpl<$Res, RouteModel>;
  @useResult
  $Res call({
    String id,
    String routeCode,
    String nameBn,
    String? nameEn,
    double totalDistanceKm,
    String documentId,
    int pdfPageNumber,
    Map<String, dynamic> documents,
  });
}

/// @nodoc
class _$RouteModelCopyWithImpl<$Res, $Val extends RouteModel>
    implements $RouteModelCopyWith<$Res> {
  _$RouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
    Object? nameEn = freezed,
    Object? totalDistanceKm = null,
    Object? documentId = null,
    Object? pdfPageNumber = null,
    Object? documents = null,
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
            documentId: null == documentId
                ? _value.documentId
                : documentId // ignore: cast_nullable_to_non_nullable
                      as String,
            pdfPageNumber: null == pdfPageNumber
                ? _value.pdfPageNumber
                : pdfPageNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            documents: null == documents
                ? _value.documents
                : documents // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteModelImplCopyWith<$Res>
    implements $RouteModelCopyWith<$Res> {
  factory _$$RouteModelImplCopyWith(
    _$RouteModelImpl value,
    $Res Function(_$RouteModelImpl) then,
  ) = __$$RouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String routeCode,
    String nameBn,
    String? nameEn,
    double totalDistanceKm,
    String documentId,
    int pdfPageNumber,
    Map<String, dynamic> documents,
  });
}

/// @nodoc
class __$$RouteModelImplCopyWithImpl<$Res>
    extends _$RouteModelCopyWithImpl<$Res, _$RouteModelImpl>
    implements _$$RouteModelImplCopyWith<$Res> {
  __$$RouteModelImplCopyWithImpl(
    _$RouteModelImpl _value,
    $Res Function(_$RouteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeCode = null,
    Object? nameBn = null,
    Object? nameEn = freezed,
    Object? totalDistanceKm = null,
    Object? documentId = null,
    Object? pdfPageNumber = null,
    Object? documents = null,
  }) {
    return _then(
      _$RouteModelImpl(
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
        documentId: null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                  as String,
        pdfPageNumber: null == pdfPageNumber
            ? _value.pdfPageNumber
            : pdfPageNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        documents: null == documents
            ? _value._documents
            : documents // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$RouteModelImpl extends _RouteModel {
  const _$RouteModelImpl({
    required this.id,
    required this.routeCode,
    required this.nameBn,
    this.nameEn,
    required this.totalDistanceKm,
    required this.documentId,
    required this.pdfPageNumber,
    required final Map<String, dynamic> documents,
  }) : _documents = documents,
       super._();

  factory _$RouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteModelImplFromJson(json);

  @override
  final String id;
  @override
  final String routeCode;
  @override
  final String nameBn;
  @override
  final String? nameEn;
  @override
  final double totalDistanceKm;
  @override
  final String documentId;
  @override
  final int pdfPageNumber;
  final Map<String, dynamic> _documents;
  @override
  Map<String, dynamic> get documents {
    if (_documents is EqualUnmodifiableMapView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_documents);
  }

  @override
  String toString() {
    return 'RouteModel(id: $id, routeCode: $routeCode, nameBn: $nameBn, nameEn: $nameEn, totalDistanceKm: $totalDistanceKm, documentId: $documentId, pdfPageNumber: $pdfPageNumber, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.nameBn, nameBn) || other.nameBn == nameBn) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.pdfPageNumber, pdfPageNumber) ||
                other.pdfPageNumber == pdfPageNumber) &&
            const DeepCollectionEquality().equals(
              other._documents,
              _documents,
            ));
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
    documentId,
    pdfPageNumber,
    const DeepCollectionEquality().hash(_documents),
  );

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteModelImplCopyWith<_$RouteModelImpl> get copyWith =>
      __$$RouteModelImplCopyWithImpl<_$RouteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteModelImplToJson(this);
  }
}

abstract class _RouteModel extends RouteModel {
  const factory _RouteModel({
    required final String id,
    required final String routeCode,
    required final String nameBn,
    final String? nameEn,
    required final double totalDistanceKm,
    required final String documentId,
    required final int pdfPageNumber,
    required final Map<String, dynamic> documents,
  }) = _$RouteModelImpl;
  const _RouteModel._() : super._();

  factory _RouteModel.fromJson(Map<String, dynamic> json) =
      _$RouteModelImpl.fromJson;

  @override
  String get id;
  @override
  String get routeCode;
  @override
  String get nameBn;
  @override
  String? get nameEn;
  @override
  double get totalDistanceKm;
  @override
  String get documentId;
  @override
  int get pdfPageNumber;
  @override
  Map<String, dynamic> get documents;

  /// Create a copy of RouteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteModelImplCopyWith<_$RouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

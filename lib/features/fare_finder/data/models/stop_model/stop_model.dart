import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/stop_entity/stop_entity.dart';

part 'stop_model.freezed.dart';
part 'stop_model.g.dart';

@freezed
class StopModel with _$StopModel {
  const StopModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StopModel({
    required String id,
    required String nameBn,
    String? nameEn,
  }) = _StopModel;

  factory StopModel.fromJson(Map<String, dynamic> json) => _$StopModelFromJson(json);

  /// Converts Model (Data Layer) to Entity (Domain Layer)
  StopEntity toEntity() => StopEntity(
    id: id,
    nameBn: nameBn,
    nameEn: nameEn,
  );

  /// Converts Entity (Domain Layer) to Model (Data Layer)
  factory StopModel.fromEntity(StopEntity entity) => StopModel(
    id: entity.id,
    nameBn: entity.nameBn,
    nameEn: entity.nameEn,
  );
}
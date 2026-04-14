import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_entity.freezed.dart';

@freezed
class StopEntity with _$StopEntity {
  const factory StopEntity({
    required String id,
    required String nameBn,
    required String nameEn,
  }) = _StopEntity;
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_entity.freezed.dart';

@freezed
abstract class StopEntity with _$StopEntity {
  const factory StopEntity({
    required String id,
    required String nameBn,
    String? nameEn,
  }) = _StopEntity;
}
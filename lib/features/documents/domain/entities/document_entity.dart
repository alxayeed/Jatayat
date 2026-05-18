import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_entity.freezed.dart';

@freezed
class DocumentEntity with _$DocumentEntity {
  const factory DocumentEntity({
    required String id,
    required String title,
    required String btrcUrl,
    required DateTime createdAt,
    required String versionName,
    required String pdfUrl,
    String? region,
    String? notes,
  }) = _DocumentEntity;
}

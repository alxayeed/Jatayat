import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/document_entity.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

@freezed
abstract class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    required String id,
    required String title,
    @JsonKey(name: 'btrc_url') required String btrcUrl,
    @JsonKey(name: 'pdf_url') required String pdfUrl, // Added
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'version_name') required String versionName,
    String? region, // Added (Nullable)
    String? notes, // Added (Nullable)
  }) = _DocumentModel;

  // Serialization methods stay strictly inside the data model layer
  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  factory DocumentModel.fromEntity(DocumentEntity entity) {
    return DocumentModel(
      id: entity.id,
      title: entity.title,
      btrcUrl: entity.btrcUrl,
      pdfUrl: entity.pdfUrl,
      createdAt: entity.createdAt,
      versionName: entity.versionName,
      region: entity.region,
      notes: entity.notes,
    );
  }

  const DocumentModel._();

  DocumentEntity toEntity() {
    return DocumentEntity(
      id: id,
      title: title,
      btrcUrl: btrcUrl,
      pdfUrl: pdfUrl,
      createdAt: createdAt,
      versionName: versionName,
      region: region,
      notes: notes,
    );
  }
}

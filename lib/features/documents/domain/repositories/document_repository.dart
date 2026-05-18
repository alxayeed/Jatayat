import '../entities/document_entity.dart';

abstract class DocumentRepository {
  /// Fetches a list of all active government-gazetted documents.
  Future<List<DocumentEntity>> getActiveDocuments();
}

import '../models/document_model.dart';

abstract class DocumentRemoteDataSource {
  /// Calls the remote data provider to fetch active document models.
  Future<List<DocumentModel>> getActiveDocuments();
}

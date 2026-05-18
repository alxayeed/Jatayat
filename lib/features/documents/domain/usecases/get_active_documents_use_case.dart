import '../entities/document_entity.dart';
import '../repositories/document_repository.dart';

class GetActiveDocumentsUseCase {
  final DocumentRepository _repository;

  GetActiveDocumentsUseCase(this._repository);

  /// Executes the business logic to retrieve active documents.
  Future<List<DocumentEntity>> call() async {
    return await _repository.getActiveDocuments();
  }
}

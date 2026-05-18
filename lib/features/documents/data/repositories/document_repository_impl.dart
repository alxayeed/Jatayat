import '../../domain/entities/document_entity.dart';
import '../../domain/repositories/document_repository.dart';
import '../datasources/document_data_source.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  final DocumentRemoteDataSource _remoteDataSource;

  DocumentRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<DocumentEntity>> getActiveDocuments() async {
    final documentModels = await _remoteDataSource.getActiveDocuments();

    return documentModels.map((model) => model.toEntity()).toList();
  }
}

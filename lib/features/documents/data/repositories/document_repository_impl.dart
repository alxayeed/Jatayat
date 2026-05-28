import '../../../../core/database/database_sync_service.dart';
import '../../domain/entities/document_entity.dart';
import '../../domain/repositories/document_repository.dart';
import '../datasources/document_data_source.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  final DocumentRemoteDataSource _remoteDataSource;
  final DocumentRemoteDataSource _localDataSource;
  final DatabaseSyncService _syncService;

  DocumentRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._syncService,
  );

  Future<DocumentRemoteDataSource> _getDataSource() async {
    return _remoteDataSource;
  }

  @override
  Future<List<DocumentEntity>> getActiveDocuments() async {
    final dataSource = await _getDataSource();
    final documentModels = await dataSource.getActiveDocuments();

    return documentModels.map((model) => model.toEntity()).toList();
  }
}

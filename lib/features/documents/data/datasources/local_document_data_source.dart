import 'dart:developer' as developer;
import 'package:intl/intl.dart';
import '../../../../core/database/local_database.dart';
import '../models/document_model.dart';
import 'document_data_source.dart';

class LocalDocumentDataSourceImpl implements DocumentRemoteDataSource {
  final LocalDatabase _localDB;

  LocalDocumentDataSourceImpl({required LocalDatabase localDB}) : _localDB = localDB;

  String _formatVersionName(String? lastRevised) {
    if (lastRevised == null) return 'Official Release';
    try {
      final date = DateTime.parse(lastRevised);
      return DateFormat('MMMM yyyy').format(date);
    } catch (_) {
      return 'Official Release';
    }
  }

  @override
  Future<List<DocumentModel>> getActiveDocuments() async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getActiveDocuments] (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      final List<Map<String, dynamic>> results = await db.query(
        'documents',
        where: 'is_active = 1',
        orderBy: 'created_at DESC',
      );

      final List<DocumentModel> documents = results.map((row) {
        final Map<String, dynamic> map = Map<String, dynamic>.from(row);
        
        // Emulate the active_documents Postgres view mapping
        map['version_name'] = _formatVersionName(map['last_revised'] as String?);
        
        return DocumentModel.fromJson(map);
      }).toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getActiveDocuments] (SQLite: ${stopwatch.elapsedMilliseconds}ms) returned ${documents.length} documents',
        name: 'LocalDB',
      );
      return documents;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getActiveDocuments]',
        name: 'LocalDB',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}

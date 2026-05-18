import 'dart:developer' as developer;

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/document_model.dart';
import 'document_data_source.dart';

class SupabaseDocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  final SupabaseClient supabase;

  SupabaseDocumentRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<DocumentModel>> getActiveDocuments() async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getActiveDocuments] (Supabase)', name: 'Supabase');

    try {
      // Fetching the flat view directly
      final response = await supabase
          .from('active_documents')
          .select()
          .order('created_at', ascending: false);

      // Pass-through mapping directly utilizing Freezed's implicit serialization mechanics
      final results = (response as List)
          .map((json) => DocumentModel.fromJson(json as Map<String, dynamic>))
          .toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getActiveDocuments] (${stopwatch.elapsedMilliseconds}ms) returned ${results.length} documents',
        name: 'Supabase',
      );
      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getActiveDocuments]',
        name: 'Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}

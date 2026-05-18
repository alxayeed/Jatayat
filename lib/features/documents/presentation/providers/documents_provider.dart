import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/usecase_providers.dart';
import '../../domain/entities/document_entity.dart';
import '../../domain/usecases/get_active_documents_use_case.dart';

final documentsProvider =
    AsyncNotifierProvider<DocumentsNotifier, List<DocumentEntity>>(() {
      return DocumentsNotifier();
    });

class DocumentsNotifier extends AsyncNotifier<List<DocumentEntity>> {
  late final GetActiveDocumentsUseCase _getActiveDocumentsUseCase;
  List<DocumentEntity> _allDocumentsCache = [];

  @override
  FutureOr<List<DocumentEntity>> build() async {
    _getActiveDocumentsUseCase = ref.watch(getActiveDocumentsUseCaseProvider);
    return _fetchDocuments();
  }

  /// Internal method to handle the data fetch
  Future<List<DocumentEntity>> _fetchDocuments() async {
    final documents = await _getActiveDocumentsUseCase();
    _allDocumentsCache = documents;
    return documents;
  }

  /// Locally filters the document titles in memory instantly
  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = AsyncData(_allDocumentsCache);
      return;
    }

    final filtered = _allDocumentsCache.where((doc) {
      return doc.title.toLowerCase().contains(query.toLowerCase()) ||
          doc.versionName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    state = AsyncData(filtered);
  }

  /// Forces a reload to pull fresh data from the network/source
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchDocuments());
  }
}

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/usecase_providers.dart';
import '../../../../core/providers/settings_provider.dart';
import '../../domain/entities/document_entity.dart';
import '../../domain/usecases/get_active_documents_use_case.dart';

final documentsProvider =
    AsyncNotifierProvider.autoDispose<DocumentsNotifier, List<DocumentEntity>>(() {
      return DocumentsNotifier();
    });

class DocumentsNotifier extends AutoDisposeAsyncNotifier<List<DocumentEntity>> {
  late final GetActiveDocumentsUseCase _getActiveDocumentsUseCase;
  List<DocumentEntity> _allDocumentsCache = [];

  @override
  FutureOr<List<DocumentEntity>> build() async {
    _getActiveDocumentsUseCase = ref.watch(getActiveDocumentsUseCaseProvider);
    // Watch selectedRegion to reactively rebuild when user switches regions
    ref.watch(settingsProvider.select((s) => s.selectedRegion));
    return _fetchDocuments();
  }

  /// Internal method to handle the data fetch
  Future<List<DocumentEntity>> _fetchDocuments() async {
    final selectedRegion = ref.read(settingsProvider).selectedRegion;
    final documents = await _getActiveDocumentsUseCase();
    
    // Filter active documents in memory to match selected region
    final filtered = documents.where((doc) {
      return doc.region?.toUpperCase() == selectedRegion.value.toUpperCase();
    }).toList();

    _allDocumentsCache = filtered;
    return filtered;
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

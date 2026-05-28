import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/bookmarks/data/repositories/bookmarks_repository_impl.dart';
import '../../features/bookmarks/domain/repositories/bookmarks_repository.dart';
import '../../features/documents/data/repositories/document_repository_impl.dart';
import '../../features/documents/domain/repositories/document_repository.dart';
// Repository Implementations
import '../../features/fare_finder/data/repositories/fare_repository_impl.dart';
// Repositories
import '../../features/fare_finder/domain/repository/fare_repository.dart';
import '../../features/route_explorer/data/repositories/route_repository_impl.dart';
import '../../features/route_explorer/domain/repositories/route_repository.dart';
// Data Source Providers
import 'core_providers.dart';
import 'data_source_providers.dart';

// ==========================================
// FEATURE: DOCUMENTS
// ==========================================

final documentRepositoryProvider = Provider<DocumentRepository>((ref) {
  final remoteDataSource = ref.watch(documentRemoteDataSourceProvider);
  final localDataSource = ref.watch(localDocumentDataSourceProvider);
  final syncService = ref.watch(databaseSyncServiceProvider);
  return DocumentRepositoryImpl(remoteDataSource, localDataSource, syncService);
});

// ==========================================
// FEATURE: FARE FINDER
// ==========================================

final fareRepositoryProvider = Provider<FareRepository>((ref) {
  final remoteDataSource = ref.watch(fareRemoteDataSourceProvider);
  final localDataSource = ref.watch(localFareDataSourceProvider);
  final syncService = ref.watch(databaseSyncServiceProvider);
  return FareRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    syncService: syncService,
  );
});

// ==========================================
// FEATURE: ROUTE EXPLORER
// ==========================================

final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  final remoteDataSource = ref.watch(routeDataSourceProvider);
  final localDataSource = ref.watch(localRouteDataSourceProvider);
  final syncService = ref.watch(databaseSyncServiceProvider);

  return RouteRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    syncService: syncService,
  );
});

// ==========================================
// FEATURE: BOOKMARKS
// ==========================================

final bookmarksRepositoryProvider = Provider<BookmarksRepository>((ref) {
  final localDataSource = ref.watch(bookmarksLocalDataSourceProvider);
  return BookmarksRepositoryImpl(localDataSource);
});

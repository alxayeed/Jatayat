import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/documents/data/repositories/document_repository_impl.dart';
import '../../features/documents/domain/repositories/document_repository.dart';
// Repository Implementations
import '../../features/fare_finder/data/repositories/fare_repository_impl.dart';
// Repositories
import '../../features/fare_finder/domain/repository/fare_repository.dart';
import '../../features/route_explorer/data/repositories/route_repository_impl.dart';
import '../../features/route_explorer/domain/repositories/route_repository.dart';
// Data Source Providers
import 'data_source_providers.dart';

// ==========================================
// FEATURE: DOCUMENTS
// ==========================================

final documentRepositoryProvider = Provider<DocumentRepository>((ref) {
  final remoteDataSource = ref.watch(documentRemoteDataSourceProvider);
  return DocumentRepositoryImpl(remoteDataSource);
});

// ==========================================
// FEATURE: FARE FINDER
// ==========================================

final fareRepositoryProvider = Provider<FareRepository>((ref) {
  final remoteDataSource = ref.watch(fareRemoteDataSourceProvider);
  return FareRepositoryImpl(remoteDataSource: remoteDataSource);
});

// ==========================================
// FEATURE: ROUTE EXPLORER
// ==========================================

final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  // Watching the abstract RouteDataSource (currently SupabaseRouteDataSourceImpl)
  final supabaseDataSource = ref.watch(routeDataSourceProvider);

  return RouteRepositoryImpl(supabaseDataSource: supabaseDataSource);
});

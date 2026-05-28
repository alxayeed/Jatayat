import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/bookmarks/data/datasources/bookmarks_local_data_source.dart';
import '../../features/documents/data/datasources/document_data_source.dart';
import '../../features/documents/data/datasources/supabase_document_remote_data_source.dart';
import '../../features/documents/data/datasources/local_document_data_source.dart';
import '../../features/fare_finder/data/data_sources/fare_data_source.dart';
import '../../features/fare_finder/data/data_sources/fare_remote_data_source.dart';
import '../../features/fare_finder/data/data_sources/local_fare_data_source.dart';
import '../../features/route_explorer/data/datasources/route_data_source.dart';
import '../../features/route_explorer/data/datasources/supabase_route_data_source_impl.dart';
import '../../features/route_explorer/data/datasources/local_route_data_source.dart';
import 'core_providers.dart';

// ==========================================
// DATA SOURCE PROVIDERS
// ==========================================

// --- Remote / Supabase Data Sources ---
final documentRemoteDataSourceProvider = Provider<DocumentRemoteDataSource>((
  ref,
) {
  final supabase = ref.watch(supabaseClientProvider);
  return SupabaseDocumentRemoteDataSourceImpl(supabase);
});

final fareRemoteDataSourceProvider = Provider<FareRemoteDataSource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return FareRemoteDataSourceImpl(supabase: supabase);
});

final routeDataSourceProvider = Provider<RouteDataSource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return SupabaseRouteDataSourceImpl(supabase: supabase);
});

// --- Local SQLite Data Sources ---
final localRouteDataSourceProvider = Provider<RouteDataSource>((ref) {
  final localDB = ref.watch(localDatabaseProvider);
  return LocalRouteDataSourceImpl(localDB: localDB);
});

final localFareDataSourceProvider = Provider<FareRemoteDataSource>((ref) {
  final localDB = ref.watch(localDatabaseProvider);
  return LocalFareDataSourceImpl(localDB: localDB);
});

final localDocumentDataSourceProvider = Provider<DocumentRemoteDataSource>((ref) {
  final localDB = ref.watch(localDatabaseProvider);
  return LocalDocumentDataSourceImpl(localDB: localDB);
});

// ==========================================
// FEATURE: BOOKMARKS
// ==========================================

final bookmarksLocalDataSourceProvider = Provider<BookmarksLocalDataSource>((ref) {
  final db = ref.watch(localDatabaseProvider);
  return BookmarksLocalDataSourceImpl(db);
});

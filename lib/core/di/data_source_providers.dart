import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/bookmarks/data/datasources/bookmarks_local_data_source.dart';
import '../../features/documents/data/datasources/document_data_source.dart';
import '../../features/documents/data/datasources/supabase_document_remote_data_source.dart';
import '../../features/fare_finder/data/data_sources/fare_data_source.dart';
import '../../features/fare_finder/data/data_sources/fare_remote_data_source.dart';
import '../../features/route_explorer/data/datasources/route_data_source.dart';
import '../../features/route_explorer/data/datasources/supabase_route_data_source_impl.dart';
import 'core_providers.dart';

// ==========================================
// DATA SOURCE PROVIDERS
// ==========================================

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

// ==========================================
// FEATURE: BOOKMARKS
// ==========================================

final bookmarksLocalDataSourceProvider = Provider<BookmarksLocalDataSource>((ref) {
  final db = ref.watch(localDatabaseProvider);
  return BookmarksLocalDataSourceImpl(db);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/fare_finder/data/data_sources/fare_data_source.dart';
import '../../features/route_explorer/data/datasources/route_data_source.dart';
import '../../features/route_explorer/data/datasources/supabase_route_data_source_impl.dart';
import 'core_providers.dart';
import '../../features/fare_finder/data/data_sources/fare_remote_data_source.dart';

// ==========================================
// DATA SOURCE PROVIDERS
// ==========================================



final fareRemoteDataSourceProvider = Provider<FareRemoteDataSource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return FareRemoteDataSourceImpl(supabase: supabase);
});

final routeDataSourceProvider = Provider<RouteDataSource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return SupabaseRouteDataSourceImpl(supabase: supabase);
});
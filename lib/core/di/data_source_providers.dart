import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core_providers.dart';
import '../../features/fare_finder/data/data_sources/fare_remote_data_source.dart';

// ==========================================
// DATA SOURCE PROVIDERS
// ==========================================

final fareRemoteDataSourceProvider = Provider<FareRemoteDataSource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return FareRemoteDataSourceImpl(supabase: supabase);
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../database/local_database.dart';
import '../database/database_sync_service.dart';

// ==========================================
// CORE SYSTEM & INFRASTRUCTURE PROVIDERS
// ==========================================

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final localDatabaseProvider = Provider<LocalDatabase>((ref) {
  return LocalDatabase.instance;
});

final databaseSyncServiceProvider = Provider<DatabaseSyncService>((ref) {
  return DatabaseSyncService(
    supabase: ref.watch(supabaseClientProvider),
    localDB: ref.watch(localDatabaseProvider),
  );
});


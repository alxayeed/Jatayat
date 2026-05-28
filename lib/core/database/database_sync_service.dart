import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'local_database.dart';

class DatabaseSyncService {
  final SupabaseClient _supabase;
  final LocalDatabase _localDB;

  DatabaseSyncService({
    required SupabaseClient supabase,
    required LocalDatabase localDB,
  })  : _supabase = supabase,
        _localDB = localDB;

  Future<bool> isLocalDatabaseSynced() async {
    final isEnabled = dotenv.env['ENABLE_LOCAL_DB_SYNC'] == 'true';
    if (!isEnabled) return false;

    final status = await _localDB.getSetting('sync_status');
    final lastSyncedTime = await _localDB.getSetting('local_last_data_updated_at');
    return status == 'completed' && lastSyncedTime != null;
  }

  Future<bool> checkAndSync() async {
    final isEnabled = dotenv.env['ENABLE_LOCAL_DB_SYNC'] == 'true';
    if (!isEnabled) {
      developer.log('🚫 Local database sync is disabled via environment flag.', name: 'SyncService');
      return false;
    }

    try {
      developer.log('🔄 Checking database sync status...', name: 'SyncService');
      
      // 1. Fetch the remote active revision data_updated_at
      final activeRevision = await _supabase
          .from('revisions')
          .select('id, data_updated_at')
          .eq('is_active', true)
          .maybeSingle();

      if (activeRevision == null) {
        developer.log('⚠️ No active revision found on remote database.', name: 'SyncService');
        return false;
      }

      final String remoteRevisionId = activeRevision['id'] as String;
      final String remoteDataUpdatedAt = activeRevision['data_updated_at'] as String;

      // 2. Read local settings
      final String? localRevisionId = await _localDB.getSetting('last_synced_revision_id');
      final String? localDataUpdatedAt = await _localDB.getSetting('local_last_data_updated_at');
      final String? syncStatus = await _localDB.getSetting('sync_status');

      // 3. Determine if sync is required
      bool needsSync = syncStatus != 'completed' ||
          localRevisionId != remoteRevisionId ||
          localDataUpdatedAt != remoteDataUpdatedAt;

      if (needsSync) {
        developer.log('⚡ Local database is out of sync. Initiating sync...', name: 'SyncService');
        await performFullSync(remoteRevisionId, remoteDataUpdatedAt);
        return true;
      } else {
        developer.log('✅ Local database is up to date with revision: $remoteRevisionId', name: 'SyncService');
        return false;
      }
    } catch (e, stackTrace) {
      developer.log('❌ Error during checkAndSync', name: 'SyncService', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  Future<void> performFullSync(String revisionId, String dataUpdatedAt) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🚀 Starting full local-first DB synchronization...', name: 'SyncService');

    try {
      // 1. Fetch remote data in parallel using Future.wait
      developer.log('📡 Fetching all tables from Supabase in parallel...', name: 'SyncService');
      final results = await Future.wait([
        _supabase.from('stops').select(),
        _supabase.from('routes').select(),
        _supabase.from('route_stops').select(),
        _supabase.from('fares').select(),
        _supabase.from('documents').select(),
        _supabase.from('revisions').select(),
      ]);

      final stopsData = results[0] as List;
      final routesData = results[1] as List;
      final routeStopsData = results[2] as List;
      final faresData = results[3] as List;
      final documentsData = results[4] as List;
      final revisionsData = results[5] as List;

      developer.log('📥 Download complete. stops: ${stopsData.length}, routes: ${routesData.length}, route_stops: ${routeStopsData.length}, fares: ${faresData.length}', name: 'SyncService');

      // 2. Perform Batch insert inside SQLite Transaction
      final db = await _localDB.database;
      
      await db.transaction((txn) async {
        final batch = txn.batch();

        // Clear existing tables
        batch.delete('stops');
        batch.delete('routes');
        batch.delete('route_stops');
        batch.delete('fares');
        batch.delete('documents');
        batch.delete('revisions');

        // Insert stops
        for (final row in stopsData) {
          batch.insert('stops', {
            'id': row['id'],
            'name_bn': row['name_bn'],
            'name_en': row['name_en'],
            'lat': row['lat'] != null ? double.tryParse(row['lat'].toString()) : null,
            'lng': row['lng'] != null ? double.tryParse(row['lng'].toString()) : null,
            'search_terms': row['search_terms'],
            'region': row['region'],
            'route_codes': row['route_codes'] != null ? jsonEncode(row['route_codes']) : null,
            'aliases_bn': row['aliases_bn'] != null ? jsonEncode(row['aliases_bn']) : null,
            'is_active': row['is_active'] == true ? 1 : 0,
          });
        }

        // Insert routes
        for (final row in routesData) {
          batch.insert('routes', {
            'id': row['id'],
            'route_code': row['route_code'],
            'name_bn': row['name_bn'],
            'name_en': row['name_en'],
            'total_distance_km': row['total_distance_km'] != null ? double.tryParse(row['total_distance_km'].toString()) : null,
            'document_id': row['document_id'],
            'pdf_page_number': row['pdf_page_number'],
            'region': row['region'],
            'total_stops': row['total_stops'],
            'revision_id': row['revision_id'],
            'is_active': row['is_active'] == true ? 1 : 0,
          });
        }

        // Insert route_stops
        for (final row in routeStopsData) {
          batch.insert('route_stops', {
            'id': row['id'],
            'route_id': row['route_id'],
            'stop_id': row['stop_id'],
            'sequence_order': row['sequence_order'],
            'cumulative_distance_km': row['cumulative_distance_km'] != null ? double.tryParse(row['cumulative_distance_km'].toString()) : null,
            'revision_id': row['revision_id'],
            'is_active': row['is_active'] == true ? 1 : 0,
          });
        }

        // Insert fares
        for (final row in faresData) {
          batch.insert('fares', {
            'id': row['id'],
            'route_id': row['route_id'],
            'from_stop_id': row['from_stop_id'],
            'to_stop_id': row['to_stop_id'],
            'fare_amount': row['fare_amount'],
            'travel_distance_km': row['travel_distance_km'] != null ? double.tryParse(row['travel_distance_km'].toString()) : null,
            'revision_id': row['revision_id'],
            'is_active': row['is_active'] == true ? 1 : 0,
          });
        }

        // Insert documents
        for (final row in documentsData) {
          batch.insert('documents', {
            'id': row['id'],
            'title': row['title'],
            'pdf_url': row['pdf_url'],
            'btrc_url': row['btrc_url'],
            'issued_date': row['issued_date'],
            'last_revised': row['last_revised'],
            'total_pages': row['total_pages'],
            'region': row['region'],
            'notes': row['notes'],
            'created_at': row['created_at'],
            'updated_at': row['updated_at'],
            'revision_id': row['revision_id'],
            'is_active': row['is_active'] == true ? 1 : 0,
          });
        }

        // Insert revisions
        for (final row in revisionsData) {
          batch.insert('revisions', {
            'id': row['id'],
            'name': row['name'],
            'base_fare_per_km': row['base_fare_per_km'] != null ? double.tryParse(row['base_fare_per_km'].toString()) : null,
            'minimum_fare': row['minimum_fare'],
            'effective_date': row['effective_date'],
            'is_active': row['is_active'] == true ? 1 : 0,
            'created_at': row['created_at'],
            'updated_at': row['updated_at'],
            'data_updated_at': row['data_updated_at'],
          });
        }

        await batch.commit(noResult: true);
      });

      // 3. Update Sync preference markers
      await _localDB.setSetting('last_synced_revision_id', revisionId);
      await _localDB.setSetting('local_last_data_updated_at', dataUpdatedAt);
      await _localDB.setSetting('sync_status', 'completed');

      stopwatch.stop();
      developer.log('🏁 Synchronization successfully completed in ${stopwatch.elapsedMilliseconds}ms!', name: 'SyncService');
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Error during performFullSync', name: 'SyncService', error: e, stackTrace: stackTrace);
      await _localDB.setSetting('sync_status', 'failed');
      rethrow;
    }
  }
}

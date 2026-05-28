import 'dart:developer' as developer;
import '../../../../core/database/local_database.dart';
import '../models/fare_result_model/fare_result_model.dart';
import '../models/stop_model/stop_model.dart';
import 'fare_data_source.dart';

class LocalFareDataSourceImpl implements FareRemoteDataSource {
  final LocalDatabase _localDB;

  LocalFareDataSourceImpl({required LocalDatabase localDB}) : _localDB = localDB;

  @override
  Future<List<StopModel>> searchStops(String query, {String? region}) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [searchStops] query: "$query", region: "$region" (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      final List<Map<String, dynamic>> results;
      if (query.isEmpty) {
        if (region != null) {
          results = await db.query(
            'stops',
            columns: ['id', 'name_bn', 'name_en'],
            where: 'is_active = 1 AND region = ?',
            whereArgs: [region],
          );
        } else {
          results = await db.query(
            'stops',
            columns: ['id', 'name_bn', 'name_en'],
            where: 'is_active = 1',
          );
        }
      } else {
        if (region != null) {
          results = await db.rawQuery('''
            SELECT id, name_bn, name_en FROM stops
            WHERE is_active = 1 AND region = ?
              AND (name_en LIKE ? OR name_bn LIKE ?)
          ''', [region, '%$query%', '%$query%']);
        } else {
          results = await db.rawQuery('''
            SELECT id, name_bn, name_en FROM stops
            WHERE is_active = 1
              AND (name_en LIKE ? OR name_bn LIKE ?)
          ''', ['%$query%', '%$query%']);
        }
      }

      final List<StopModel> stops = results.map((json) => StopModel.fromJson(json)).toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [searchStops] (SQLite: ${stopwatch.elapsedMilliseconds}ms) found ${stops.length} stops',
        name: 'LocalDB',
      );
      return stops;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [searchStops]',
        name: 'LocalDB',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<StopModel>> getConnectedStops(String originId) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getConnectedStops] originId: "$originId" (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      final List<Map<String, dynamic>> results = await db.rawQuery('''
        SELECT DISTINCT
          rs2.stop_id AS destination_id,
          s2.name_bn AS destination_name_bn,
          s2.name_en AS destination_name_en
        FROM route_stops rs1
        JOIN route_stops rs2 ON rs1.route_id = rs2.route_id
        JOIN stops s2 ON rs2.stop_id = s2.id
        JOIN routes r ON rs1.route_id = r.id
        WHERE rs1.stop_id = ? AND rs1.stop_id <> rs2.stop_id
          AND r.is_active = 1 AND s2.is_active = 1 AND rs1.is_active = 1 AND rs2.is_active = 1
      ''', [originId]);

      final List<StopModel> stops = results.map((row) {
        return StopModel(
          id: row['destination_id'] as String,
          nameBn: row['destination_name_bn'] as String,
          nameEn: row['destination_name_en'] as String?,
        );
      }).toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getConnectedStops] (SQLite: ${stopwatch.elapsedMilliseconds}ms) returned ${stops.length} stops',
        name: 'LocalDB',
      );
      return stops;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getConnectedStops]',
        name: 'LocalDB',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<FareResultModel>> getFares(String originId, String destinationId) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getFares] from: $originId to: $destinationId (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      final List<Map<String, dynamic>> results = await db.rawQuery('''
        SELECT 
          f.id AS fare_id,
          f.from_stop_id,
          s1.name_bn AS origin_name_bn,
          s1.name_en AS origin_name_en,
          f.to_stop_id,
          s2.name_bn AS destination_name_bn,
          s2.name_en AS destination_name_en,
          CAST(f.fare_amount AS REAL) AS fare_amount,
          CAST(f.travel_distance_km AS REAL) AS travel_distance_km,
          r.id AS route_id,
          r.route_code,
          r.name_bn AS route_name_bn,
          r.name_en AS route_name_en,
          CAST(r.total_distance_km AS REAL) AS route_total_distance,
          r.pdf_page_number AS pdf_page_number,
          CAST(rev.base_fare_per_km AS REAL) AS base_rate,
          CAST(rev.minimum_fare AS REAL) AS min_fare,
          d.pdf_url,
          d.btrc_url
        FROM fares f
        JOIN routes r ON f.route_id = r.id
        JOIN revisions rev ON f.revision_id = rev.id
        JOIN documents d ON r.document_id = d.id
        JOIN stops s1 ON f.from_stop_id = s1.id
        JOIN stops s2 ON f.to_stop_id = s2.id
        WHERE (rev.is_active = 1 AND f.is_active = 1 AND r.is_active = 1 AND d.is_active = 1 AND s1.is_active = 1 AND s2.is_active = 1)
          AND (
            (f.from_stop_id = ? AND f.to_stop_id = ?)
            OR (f.from_stop_id = ? AND f.to_stop_id = ?)
          )
      ''', [originId, destinationId, destinationId, originId]);

      final List<FareResultModel> fares = results.map((row) {
        return FareResultModel.fromJson(row);
      }).toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getFares] (SQLite: ${stopwatch.elapsedMilliseconds}ms) found ${fares.length} results',
        name: 'LocalDB',
      );
      return fares;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getFares]',
        name: 'LocalDB',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}

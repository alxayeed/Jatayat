import 'dart:developer' as developer;
import '../../../../core/database/local_database.dart';
import '../models/bus_route_model/bus_route_model.dart';
import 'route_data_source.dart';

class LocalRouteDataSourceImpl implements RouteDataSource {
  final LocalDatabase _localDB;

  LocalRouteDataSourceImpl({required LocalDatabase localDB}) : _localDB = localDB;

  Map<String, dynamic> _normalizeRouteRow(Map<String, dynamic> row) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(row);
    // Convert SQLite 1/0 is_active fields to boolean for JSON mapping
    if (map.containsKey('is_active')) {
      map['is_active'] = map['is_active'] == 1;
    }
    return map;
  }

  @override
  Future<List<BusRouteModel>> getAllRoutes() async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getAllRoutes] (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      final List<Map<String, dynamic>> results = await db.rawQuery('''
        SELECT 
          r.id, 
          r.route_code, 
          r.name_bn, 
          r.name_en,
          r.total_distance_km, 
          r.document_id, 
          r.pdf_page_number, 
          r.region, 
          r.total_stops, 
          r.revision_id, 
          r.is_active,
          rev.base_fare_per_km, 
          rev.minimum_fare, 
          d.pdf_url, 
          d.btrc_url, 
          d.issued_date
        FROM routes r
        JOIN revisions rev ON r.revision_id = rev.id
        JOIN documents d ON r.document_id = d.id
        WHERE r.is_active = 1 AND rev.is_active = 1 AND d.is_active = 1
        ORDER BY r.route_code ASC
      ''');

      final List<BusRouteModel> routes = results.map((row) {
        final normalized = _normalizeRouteRow(row);
        return BusRouteModel.fromJson(normalized);
      }).toList();

      stopwatch.stop();
      developer.log('✅ Res: [getAllRoutes] (SQLite: ${stopwatch.elapsedMilliseconds}ms) returned ${routes.length} routes', name: 'LocalDB');
      return routes;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [getAllRoutes]', name: 'LocalDB', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<BusRouteModel>> searchRoutes(String query) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [searchRoutes] query: "$query" (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      final List<Map<String, dynamic>> results = await db.rawQuery('''
        SELECT 
          r.id, 
          r.route_code, 
          r.name_bn, 
          r.name_en,
          r.total_distance_km, 
          r.document_id, 
          r.pdf_page_number, 
          r.region, 
          r.total_stops, 
          r.revision_id, 
          r.is_active,
          rev.base_fare_per_km, 
          rev.minimum_fare, 
          d.pdf_url, 
          d.btrc_url, 
          d.issued_date
        FROM routes r
        JOIN revisions rev ON r.revision_id = rev.id
        JOIN documents d ON r.document_id = d.id
        WHERE (r.is_active = 1 AND rev.is_active = 1 AND d.is_active = 1)
          AND (r.route_code LIKE ? OR r.name_bn LIKE ? OR r.name_en LIKE ?)
        ORDER BY r.route_code ASC
      ''', ['%$query%', '%$query%', '%$query%']);

      final List<BusRouteModel> routes = results.map((row) {
        final normalized = _normalizeRouteRow(row);
        return BusRouteModel.fromJson(normalized);
      }).toList();

      stopwatch.stop();
      developer.log('✅ Res: [searchRoutes] (SQLite: ${stopwatch.elapsedMilliseconds}ms) found ${routes.length} matches', name: 'LocalDB');
      return routes;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [searchRoutes]', name: 'LocalDB', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<BusRouteModel> getRouteDetails(String routeId) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getRouteDetails] routeId: $routeId (Local SQLite)', name: 'LocalDB');

    try {
      final db = await _localDB.database;

      // 1. Query the main route record
      final List<Map<String, dynamic>> routeResults = await db.rawQuery('''
        SELECT 
          r.id, 
          r.route_code, 
          r.name_bn, 
          r.name_en,
          r.total_distance_km, 
          r.document_id, 
          r.pdf_page_number, 
          r.region, 
          r.total_stops, 
          r.revision_id, 
          r.is_active,
          rev.base_fare_per_km, 
          rev.minimum_fare, 
          d.pdf_url, 
          d.btrc_url, 
          d.issued_date
        FROM routes r
        JOIN revisions rev ON r.revision_id = rev.id
        JOIN documents d ON r.document_id = d.id
        WHERE r.id = ? AND r.is_active = 1 AND rev.is_active = 1 AND d.is_active = 1
        LIMIT 1
      ''', [routeId]);

      if (routeResults.isEmpty) {
        throw Exception('Route $routeId not found in local cache.');
      }

      final Map<String, dynamic> routeMap = _normalizeRouteRow(routeResults.first);

      // 2. Query stop connectivity for this route
      final List<Map<String, dynamic>> stopsResults = await db.rawQuery('''
        SELECT 
          rs.sequence_order,
          rs.cumulative_distance_km,
          s.id AS stop_id,
          s.name_bn,
          s.name_en,
          s.lat,
          s.lng
        FROM route_stops rs
        JOIN stops s ON rs.stop_id = s.id
        WHERE rs.route_id = ? AND rs.is_active = 1 AND s.is_active = 1
        ORDER BY rs.sequence_order ASC
      ''', [routeId]);

      final List<Map<String, dynamic>> stopsList = stopsResults.map((row) {
        return {
          'stop_id': row['stop_id'],
          'name_bn': row['name_bn'],
          'name_en': row['name_en'],
          'lat': row['lat'],
          'lng': row['lng'],
          'sequence_order': row['sequence_order'],
          'cumulative_distance_km': row['cumulative_distance_km'],
        };
      }).toList();

      routeMap['stops'] = stopsList;

      final BusRouteModel result = BusRouteModel.fromJson(routeMap);

      stopwatch.stop();
      developer.log('✅ Res: [getRouteDetails] (SQLite: ${stopwatch.elapsedMilliseconds}ms) returned ${stopsList.length} stops', name: 'LocalDB');
      return result;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [getRouteDetails]', name: 'LocalDB', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

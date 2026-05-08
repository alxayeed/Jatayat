import 'dart:developer' as developer;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/bus_route_model/bus_route_model.dart';
import 'route_data_source.dart';

class SupabaseRouteDataSourceImpl implements RouteDataSource {
  final SupabaseClient supabase;

  SupabaseRouteDataSourceImpl({required this.supabase});

  @override
  Future<List<BusRouteModel>> getAllRoutes() async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getAllRoutes] (Supabase)', name: 'Supabase');

    try {
      final response = await supabase
          .from('v1_routes')
          .select()
          .order('route_code', ascending: true); // Good practice to order the list

      final results = (response as List)
          .map((json) => BusRouteModel.fromJson(json))
          .toList();

      stopwatch.stop();
      developer.log('✅ Res: [getAllRoutes] (${stopwatch.elapsedMilliseconds}ms) returned ${results.length} routes', name: 'Supabase');
      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [getAllRoutes]', name: 'Supabase', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<BusRouteModel>> searchRoutes(String query) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [searchRoutes] query: "$query"', name: 'Supabase');

    try {
      final response = await supabase
          .from('v1_routes')
          .select()
          .or('route_code.ilike.%$query%,name_bn.ilike.%$query%')
          .order('route_code', ascending: true);

      final results = (response as List)
          .map((json) => BusRouteModel.fromJson(json))
          .toList();

      stopwatch.stop();
      developer.log('✅ Res: [searchRoutes] (${stopwatch.elapsedMilliseconds}ms) found ${results.length} matches', name: 'Supabase');
      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [searchRoutes]', name: 'Supabase', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<BusRouteModel> getRouteDetails(String routeId) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getRouteDetails] routeId: $routeId', name: 'Supabase');

    try {
      // 1. Fetch the route summary data
      final routeResponse = await supabase
          .from('v1_routes')
          .select()
          .eq('id', routeId)
          .single();

      // 2. Fetch the nested stops using Supabase's relational query
      final stopsResponse = await supabase
          .from('route_stops')
          .select('sequence_order, cumulative_distance_km, stops(id, name_bn, name_en, lat, lng)')
          .eq('route_id', routeId)
          .order('sequence_order', ascending: true);

      // 3. FLATTEN THE DATA FOR THE MODEL
      // Supabase returns nested JSON for joins. Local SQLite returns flat rows.
      // We flatten it here so our Model class remains DB-agnostic.
      final List<Map<String, dynamic>> flatStops = (stopsResponse as List).map((row) {
        final stopInfo = row['stops'] as Map<String, dynamic>; // Extract nested stop table data
        return {
          'stop_id': stopInfo['id'],
          'name_bn': stopInfo['name_bn'],
          'name_en': stopInfo['name_en'],
          'lat': stopInfo['lat'],
          'lng': stopInfo['lng'],
          'sequence_order': row['sequence_order'],
          'cumulative_distance_km': row['cumulative_distance_km'],
        };
      }).toList();

      // 4. Inject the flattened stops into the route JSON
      final Map<String, dynamic> fullRouteJson = Map<String, dynamic>.from(routeResponse);
      fullRouteJson['stops'] = flatStops;

      final result = BusRouteModel.fromJson(fullRouteJson);

      stopwatch.stop();
      developer.log('✅ Res: [getRouteDetails] (${stopwatch.elapsedMilliseconds}ms) fetched ${flatStops.length} stops', name: 'Supabase');
      return result;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [getRouteDetails]', name: 'Supabase', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
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
    developer.log('🔼 Req: [getAllRoutes] (Supabase) from View: v1_routes', name: 'Supabase');

    try {
      // Fetching from the pre-defined Database View
      final response = await supabase
          .from('v1_routes')
          .select();

      final results = (response as List)
          .map((json) => BusRouteModel.fromJson(json))
          .toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getAllRoutes] (Supabase) (${stopwatch.elapsedMilliseconds}ms) returned ${results.length} routes',
        name: 'Supabase',
      );

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getAllRoutes] (Supabase) (${stopwatch.elapsedMilliseconds}ms)',
        name: 'Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<BusRouteModel>> searchRoutes(String query) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [searchRoutes] (Supabase) query: "$query"', name: 'Supabase');

    try {
      final response = await supabase
          .from('v1_routes')
          .select()
          .or('route_code.ilike.%$query%,name_bn.ilike.%$query%');

      final results = (response as List)
          .map((json) => BusRouteModel.fromJson(json))
          .toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [searchRoutes] (Supabase) (${stopwatch.elapsedMilliseconds}ms) found ${results.length} matches',
        name: 'Supabase',
      );

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [searchRoutes] (Supabase) (${stopwatch.elapsedMilliseconds}ms)',
        name: 'Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
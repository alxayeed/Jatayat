import 'dart:developer' as developer;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/stop_model/stop_model.dart';
import '../models/fare_result_model/fare_result_model.dart';

abstract class FareRemoteDataSource {
  Future<List<StopModel>> searchStops(String query);
  Future<List<StopModel>> getConnectedStops(String originId);
  Future<List<FareResultModel>> getFares(String originId, String destinationId);
}

class FareRemoteDataSourceImpl implements FareRemoteDataSource {
  final SupabaseClient supabase;

  FareRemoteDataSourceImpl({required this.supabase});

  @override
  Future<List<StopModel>> searchStops(String query) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [searchStops] query: "$query"', name: 'Supabase');

    try {
      final response = await supabase
          .from('stops')
          .select()
          .or('name_en.ilike.%$query%,name_bn.ilike.%$query%')
          .limit(10);

      final results = (response as List).map((json) => StopModel.fromJson(json)).toList();

      stopwatch.stop();
      developer.log('✅ Res: [searchStops] (${stopwatch.elapsedMilliseconds}ms) found ${results.length} stops', name: 'Supabase');

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [searchStops] (${stopwatch.elapsedMilliseconds}ms)', name: 'Supabase', error: e, stackTrace: stackTrace);
      // Rethrow so the Repository layer can catch it and map it to a Failure entity
      rethrow;
    }
  }

  @override
  Future<List<StopModel>> getConnectedStops(String originId) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: RPC [get_connected_stops] originId: "$originId"', name: 'Supabase');

    try {
      final response = await supabase.rpc(
        'get_connected_stops',
        params: {'selected_stop_id': originId},
      );

      final results = (response as List).map((json) => StopModel.fromJson(json)).toList();

      stopwatch.stop();
      developer.log('✅ Res: RPC [get_connected_stops] (${stopwatch.elapsedMilliseconds}ms) returned ${results.length} connected stops', name: 'Supabase');

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: RPC [get_connected_stops] (${stopwatch.elapsedMilliseconds}ms)', name: 'Supabase', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<FareResultModel>> getFares(String originId, String destinationId) async {
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [getFares] origin: "$originId", destination: "$destinationId"', name: 'Supabase');

    try {
      final response = await supabase
          .from('fares')
          .select('''
            fare_amount,
            calculated_amount,
            routes (
              id,
              route_code,
              name_bn,
              total_distance_km,
              document_id,
              pdf_page_number
            )
          ''')
          .eq('from_stop_id', originId)
          .eq('to_stop_id', destinationId);

      final results = (response as List).map((json) => FareResultModel.fromJson(json)).toList();

      stopwatch.stop();
      developer.log('✅ Res: [getFares] (${stopwatch.elapsedMilliseconds}ms) found ${results.length} routes', name: 'Supabase');

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log('❌ Err: [getFares] (${stopwatch.elapsedMilliseconds}ms)', name: 'Supabase', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
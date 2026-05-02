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
    try {
      final response = await supabase
          .from('fares')
          .select('''
          fare_amount,
          calculated_amount,
          document_id,
          documents!inner (
            id,
            pdf_url,
            btrc_url,
            issued_date,
            base_fare_per_km,
            minimum_fare,
            notes,
            is_active
          ),
          routes!inner (
            id,
            route_code,
            name_bn,
            total_distance_km,
            route_documents (
              document_id,
              pdf_page_number
            )
          )
        ''')
      // 1. Ensure we only fetch the currently active document (the 2024 one right now)
          .eq('documents.is_active', true)
      // 2. Your original bidirectional logic
          .or('and(from_stop_id.eq.$originId,to_stop_id.eq.$destinationId),and(from_stop_id.eq.$destinationId,to_stop_id.eq.$originId)');

      return (response as List).map((json) => FareResultModel.fromJson(json)).toList();
    } catch (e) {
      developer.log('❌ Err: [getFares]', name: 'Supabase', error: e);
      rethrow;
    }
  }
}
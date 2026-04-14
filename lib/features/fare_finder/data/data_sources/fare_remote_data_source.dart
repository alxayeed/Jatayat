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
    final response = await supabase
        .from('stops')
        .select()
        .or('name_en.ilike.%$query%,name_bn.ilike.%$query%')
        .limit(10);

    return (response as List).map((json) => StopModel.fromJson(json)).toList();
  }

  @override
  Future<List<StopModel>> getConnectedStops(String originId) async {
    final response = await supabase.rpc(
      'get_connected_stops',
      params: {'selected_stop_id': originId},
    );

    return (response as List).map((json) => StopModel.fromJson(json)).toList();
  }

  @override
  Future<List<FareResultModel>> getFares(String originId, String destinationId) async {
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
        .eq('origin_stop_id', originId)
        .eq('destination_stop_id', destinationId);

    return (response as List).map((json) => FareResultModel.fromJson(json)).toList();
  }
}
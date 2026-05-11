import 'dart:developer' as developer;

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/fare_result_model/fare_result_model.dart';
import '../models/stop_model/stop_model.dart';
import 'fare_data_source.dart';

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

      final results = (response as List)
          .map((json) => StopModel.fromJson(json))
          .toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [searchStops] (${stopwatch.elapsedMilliseconds}ms) found ${results.length} stops',
        name: 'Supabase',
      );

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [searchStops] (${stopwatch.elapsedMilliseconds}ms)',
        name: 'Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<StopModel>> getConnectedStops(String originId) async {
    final stopwatch = Stopwatch()..start();
    developer.log(
      '🔼 Req: [getConnectedStops] originId: "$originId"',
      name: 'Supabase',
    );

    try {
      final response = await supabase
          .from('v1_stop_connectivity')
          .select('destination_id, destination_name_bn, destination_name_en')
          .eq('origin_id', originId);

      final results = (response as List)
          .map(
            (json) => StopModel(
              id: json['destination_id'],
              nameBn: json['destination_name_bn'],
              nameEn: json['destination_name_en'],
            ),
          )
          .toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getConnectedStops] (${stopwatch.elapsedMilliseconds}ms) returned ${results.length} stops',
        name: 'Supabase',
      );

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getConnectedStops] (${stopwatch.elapsedMilliseconds}ms)',
        name: 'Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<FareResultModel>> getFares(
    String originId,
    String destinationId,
  ) async {
    final stopwatch = Stopwatch()..start();
    developer.log(
      '🔼 Req: [getFares] from: $originId to: $destinationId',
      name: 'Supabase',
    );

    try {
      final response = await supabase
          .from('v1_fare_results')
          .select()
          .or(
            'and(from_stop_id.eq.$originId,to_stop_id.eq.$destinationId),and(from_stop_id.eq.$destinationId,to_stop_id.eq.$originId)',
          );

      final results = (response as List)
          .map((json) => FareResultModel.fromJson(json))
          .toList();

      stopwatch.stop();
      developer.log(
        '✅ Res: [getFares] (${stopwatch.elapsedMilliseconds}ms) found ${results.length} results',
        name: 'Supabase',
      );

      return results;
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [getFares] (${stopwatch.elapsedMilliseconds}ms)',
        name: 'Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}

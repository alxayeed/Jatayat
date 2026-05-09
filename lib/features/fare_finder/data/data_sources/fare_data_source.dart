import '../models/fare_result_model/fare_result_model.dart';
import '../models/stop_model/stop_model.dart';

abstract class FareRemoteDataSource {
  Future<List<StopModel>> searchStops(String query);
  Future<List<StopModel>> getConnectedStops(String originId);
  Future<List<FareResultModel>> getFares(String originId, String destinationId);
}
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/fair_result_entity/fare_result_entity.dart';
import '../entities/stop_entity/stop_entity.dart';

abstract class FareRepository {
  /// 1. Fuzzy search for origin stops
  Future<Either<Failure, List<StopEntity>>> searchStops(String query, {String? region});

  /// 2. Fetch valid destination stops
  Future<Either<Failure, List<StopEntity>>> getConnectedStops(String originStopId);

  /// 3. Calculate exact fares
  Future<Either<Failure, List<FareResultEntity>>> getFares({
    required String originId,
    required String destinationId,
  });
}
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/stop_entity/stop_entity.dart';
import '../repository/fare_repository.dart';

class GetConnectedStopsUseCase {
  final FareRepository repository;

  GetConnectedStopsUseCase(this.repository);

  Future<Either<Failure, List<StopEntity>>> call(String originStopId) async {
    return await repository.getConnectedStops(originStopId);
  }
}
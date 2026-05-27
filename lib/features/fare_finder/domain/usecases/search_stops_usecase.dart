import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/stop_entity/stop_entity.dart';
import '../repository/fare_repository.dart';

class SearchStopsUseCase {
  final FareRepository repository;

  SearchStopsUseCase(this.repository);

  Future<Either<Failure, List<StopEntity>>> call(String query, {String? region}) async {
    return await repository.searchStops(query, region: region);
  }
}
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/stop_entity/stop_entity.dart';
import '../repository/fare_repository.dart';

class SearchStopsUseCase {
  final FareRepository repository;

  SearchStopsUseCase(this.repository);

  Future<Either<Failure, List<StopEntity>>> call(String query) async {
    //TODO: add input validation here if needed (e.g., minimum 2 characters)
    if (query.trim().isEmpty) {
      return const Right([]);
    }
    return await repository.searchStops(query);
  }
}
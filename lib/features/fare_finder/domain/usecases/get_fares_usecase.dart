import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/fair_result_entity/fare_result_entity.dart';
import '../repository/fare_repository.dart';

class GetFaresUseCase {
  final FareRepository repository;

  GetFaresUseCase(this.repository);

  Future<Either<Failure, List<FareResultEntity>>> call({
    required String originId,
    required String destinationId,
  }) async {
    return await repository.getFares(
      originId: originId,
      destinationId: destinationId,
    );
  }
}
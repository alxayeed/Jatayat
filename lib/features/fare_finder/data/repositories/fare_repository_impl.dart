import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';
import '../../domain/repository/fare_repository.dart';
import '../data_sources/fare_data_source.dart';

class FareRepositoryImpl implements FareRepository {
  final FareRemoteDataSource remoteDataSource;

  FareRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<StopEntity>>> searchStops(String query) async {
    try {
      final models = await remoteDataSource.searchStops(query);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on PostgrestException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StopEntity>>> getConnectedStops(String originStopId) async {
    try {
      final models = await remoteDataSource.getConnectedStops(originStopId);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on PostgrestException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FareResultEntity>>> getFares({
    required String originId,
    required String destinationId,
  }) async {
    try {
      final models = await remoteDataSource.getFares(originId, destinationId);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on PostgrestException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
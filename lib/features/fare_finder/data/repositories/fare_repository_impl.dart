import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/database/database_sync_service.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';
import '../../domain/repository/fare_repository.dart';
import '../data_sources/fare_data_source.dart';

class FareRepositoryImpl implements FareRepository {
  final FareRemoteDataSource remoteDataSource;
  final FareRemoteDataSource localDataSource;
  final DatabaseSyncService syncService;

  FareRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.syncService,
  });

  Future<FareRemoteDataSource> _getDataSource() async {
    if (await syncService.isLocalDatabaseSynced()) {
      return localDataSource;
    }
    return remoteDataSource;
  }

  @override
  Future<Either<Failure, List<StopEntity>>> searchStops(String query, {String? region}) async {
    try {
      final dataSource = await _getDataSource();
      final models = await dataSource.searchStops(query, region: region);
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
      final dataSource = await _getDataSource();
      final models = await dataSource.getConnectedStops(originStopId);
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
      final dataSource = await _getDataSource();
      final models = await dataSource.getFares(originId, destinationId);
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } on PostgrestException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
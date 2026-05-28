import 'package:dartz/dartz.dart';
import '../../../../core/database/database_sync_service.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/bus_route/bus_route.dart';
import '../../domain/repositories/route_repository.dart';
import '../datasources/route_data_source.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteDataSource remoteDataSource;
  final RouteDataSource localDataSource;
  final DatabaseSyncService syncService;

  RouteRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.syncService,
  });

  Future<RouteDataSource> _getDataSource() async {
    return remoteDataSource;
  }

  @override
  Future<Either<Failure, List<BusRoute>>> getAllRoutes() async {
    try {
      final dataSource = await _getDataSource();
      final models = await dataSource.getAllRoutes();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return const Left(ServerFailure('Could not fetch routes'));
    }
  }

  @override
  Future<Either<Failure, List<BusRoute>>> searchRoutes(String query) async {
    try {
      final dataSource = await _getDataSource();
      final models = await dataSource.searchRoutes(query);
      return Right(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Search failed'));
    }
  }

  @override
  Future<Either<Failure, BusRoute>> getRouteDetails(String routeId) async {
    try {
      final dataSource = await _getDataSource();
      final model = await dataSource.getRouteDetails(routeId);
      return Right(model.toEntity());
    } catch (e) {
      return const Left(ServerFailure('Error fetching route details and stops'));
    }
  }
}
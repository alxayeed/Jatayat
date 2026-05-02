import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/bus_route/bus_route.dart';
import '../../domain/repositories/route_repository.dart';
import '../datasources/route_data_source.dart';

class RouteRepositoryImpl implements RouteRepository {
  final RouteDataSource supabaseDataSource;
  // final RouteDataSource localDataSource; // Placeholder for future local storage

  RouteRepositoryImpl({
    required this.supabaseDataSource,
  });

  @override
  Future<Either<Failure, List<BusRoute>>> getAllRoutes() async {
    try {
      // Logic: In the future, check localDataSource first.
      // If empty, fetch from Supabase and save to local.

      final models = await supabaseDataSource.getAllRoutes();

      final entities = models.map((model) => model.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      // You can refine this to return specific failures (ServerFailure, CacheFailure, etc.)
      return Left(ServerFailure('Could not fetch routes from server'));
    }
  }

  @override
  Future<Either<Failure, List<BusRoute>>> searchRoutes(String query) async {
    try {
      final models = await supabaseDataSource.searchRoutes(query);

      return Right(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Search failed'));
    }
  }

  @override
  Future<Either<Failure, BusRoute>> getRouteByCode(String routeCode) async {
    try {
      // We can reuse the search logic or create a specific fetch
      final models = await supabaseDataSource.searchRoutes(routeCode);

      if (models.isNotEmpty) {
        return Right(models.first.toEntity());
      } else {
        return const Left(ServerFailure('Route not found'));
      }
    } catch (e) {
      return const Left(ServerFailure('Error fetching route details'));
    }
  }
}
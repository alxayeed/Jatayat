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
      // Logic: Check localDataSource first. If empty, fetch from Supabase.
      final models = await supabaseDataSource.getAllRoutes();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return const Left(ServerFailure('Could not fetch routes from server'));
    }
  }

  @override
  Future<Either<Failure, List<BusRoute>>> searchRoutes(String query) async {
    try {
      // Logic: Search localDataSource natively
      final models = await supabaseDataSource.searchRoutes(query);
      return Right(models.map((model) => model.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure('Search failed'));
    }
  }

  // NEW: Deep fetch utilizing the specific route ID
  @override
  Future<Either<Failure, BusRoute>> getRouteDetails(String routeId) async {
    try {
      // Logic: Fetch the joined/deep data from local DB or Supabase
      final model = await supabaseDataSource.getRouteDetails(routeId);

      return Right(model.toEntity());
    } catch (e) {
      // Optional: Add developer.log(e.toString()) here to debug specific errors
      return const Left(ServerFailure('Error fetching route details and stops'));
    }
  }
}
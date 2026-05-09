import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/bus_route/bus_route.dart';

abstract class RouteRepository {
  Future<Either<Failure, List<BusRoute>>> getAllRoutes();

  Future<Either<Failure, List<BusRoute>>> searchRoutes(String query);

  // CHANGED: Use ID for exact matching and deep fetching
  Future<Either<Failure, BusRoute>> getRouteDetails(String routeId);
}
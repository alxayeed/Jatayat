import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/bus_route/bus_route.dart';

/// Abstract contract for Route operations.
/// The Domain layer only knows about this interface.
abstract class RouteRepository {

  /// Retrieves all active routes from the 2026 gazette.
  /// Returns a list of [BusRoute] entities.
  Future<Either<Failure, List<BusRoute>>> getAllRoutes();

  /// Searches for specific routes based on a string query (code or name).
  Future<Either<Failure, List<BusRoute>>> searchRoutes(String query);

  /// Optional: Retrieves a single route by its code (e.g., 'A-101').
  Future<Either<Failure, BusRoute>> getRouteByCode(String routeCode);
}
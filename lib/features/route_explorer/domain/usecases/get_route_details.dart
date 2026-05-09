import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart'; // Adjust path based on your project
import '../entities/bus_route/bus_route.dart';
import '../repositories/route_repository.dart';

/// A simple parameter class to keep the Use Case signature uniform
class GetRouteDetailsParams {
  final String routeId;

  GetRouteDetailsParams({required this.routeId});
}

class GetRouteDetails {
  final RouteRepository repository;

  GetRouteDetails(this.repository);

  /// The 'call' method allows us to use the instantiated class like a function:
  /// final result = await getRouteDetails(GetRouteDetailsParams(routeId: '...'));
  Future<Either<Failure, BusRoute>> call(GetRouteDetailsParams params) async {

    if (params.routeId.isEmpty) {
      return Left(ServerFailure('Invalid Route ID provided.'));
    }

    return await repository.getRouteDetails(params.routeId);
  }
}
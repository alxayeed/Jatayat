import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/bus_route/bus_route.dart';
import '../repositories/route_repository.dart';

class GetAllRoutesUseCase {
  final RouteRepository repository;

  GetAllRoutesUseCase(this.repository);

  Future<Either<Failure, List<BusRoute>>> call() async {
    return await repository.getAllRoutes();
  }
}
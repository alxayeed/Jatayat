import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/bus_route/bus_route.dart';
import '../repositories/route_repository.dart';

class SearchRoutesUseCase {
  final RouteRepository repository;

  SearchRoutesUseCase(this.repository);

  Future<Either<Failure, List<BusRoute>>> call({
    required String query,
  }) async {
    return await repository.searchRoutes(query);
  }
}
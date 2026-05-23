import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../repositories/bookmarks_repository.dart';

class GetCachedRouteUseCase {
  final BookmarksRepository _repository;

  GetCachedRouteUseCase(this._repository);

  Future<BusRoute?> call(String routeId) async {
    return await _repository.getCachedRoute(routeId);
  }
}

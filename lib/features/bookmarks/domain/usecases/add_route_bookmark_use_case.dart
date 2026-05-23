import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../repositories/bookmarks_repository.dart';

class AddRouteBookmarkUseCase {
  final BookmarksRepository _repository;

  AddRouteBookmarkUseCase(this._repository);

  Future<void> call(BusRoute route) async {
    await _repository.addRouteBookmark(route);
  }
}

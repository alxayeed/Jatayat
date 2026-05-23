import '../../../fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../repositories/bookmarks_repository.dart';

class AddFareBookmarkUseCase {
  final BookmarksRepository _repository;

  AddFareBookmarkUseCase(this._repository);

  Future<void> call(FareResultEntity fare, [BusRoute? route]) async {
    await _repository.addFareBookmark(fare, route);
  }
}

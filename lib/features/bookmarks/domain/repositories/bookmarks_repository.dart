import '../../../fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../entities/bookmark_item.dart';

abstract class BookmarksRepository {
  Future<List<BookmarkItem>> getBookmarks();
  Future<void> addRouteBookmark(BusRoute route);
  Future<void> addFareBookmark(FareResultEntity fare, BusRoute? route);
  Future<void> removeBookmark(String id);
  Future<bool> isBookmarked(String id);
  Future<BusRoute?> getCachedRoute(String routeId);
}

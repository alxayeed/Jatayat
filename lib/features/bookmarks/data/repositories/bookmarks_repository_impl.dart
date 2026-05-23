import 'dart:convert';
import '../../../fare_finder/data/models/fare_result_model/fare_result_model.dart';
import '../../../fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../../domain/entities/bookmark_item.dart';
import '../../domain/repositories/bookmarks_repository.dart';
import '../datasources/bookmarks_local_data_source.dart';

class BookmarksRepositoryImpl implements BookmarksRepository {
  final BookmarksLocalDataSource _localDataSource;

  BookmarksRepositoryImpl(this._localDataSource);

  @override
  Future<List<BookmarkItem>> getBookmarks() async {
    final rawList = await _localDataSource.getAllBookmarks();
    final List<BookmarkItem> items = [];

    for (final row in rawList) {
      final String id = row['id'] as String;
      final String type = row['type'] as String;
      final String dataJson = row['data'] as String;
      final int createdAt = row['created_at'] as int;

      // Skip route_cache type in general bookmarks list (used only for offline cache lookup)
      if (type == 'route_cache') {
        continue;
      }

      try {
        final Map<String, dynamic> decodedData = jsonDecode(dataJson);
        if (type == 'route') {
          final route = BusRoute.fromJson(decodedData);
          items.add(BookmarkItem(id: id, type: type, entity: route, createdAt: createdAt));
        } else if (type == 'fare') {
          final fare = FareResultModel.fromJson(decodedData).toEntity();
          items.add(BookmarkItem(id: id, type: type, entity: fare, createdAt: createdAt));
        }
      } catch (e) {
        continue;
      }
    }
    return items;
  }

  @override
  Future<void> addRouteBookmark(BusRoute route) async {
    await _localDataSource.insertBookmark(
      id: route.id,
      type: 'route',
      data: route.toJson(),
    );
  }

  @override
  Future<void> addFareBookmark(FareResultEntity fare, BusRoute? route) async {
    // 1. Save the fare result bookmark
    final Map<String, dynamic> jsonData = {
      'fare_id': fare.fareId,
      'from_stop_id': fare.fromStopId,
      'to_stop_id': fare.toStopId,
      'origin_name_bn': fare.originNameBn,
      'origin_name_en': fare.originNameEn,
      'destination_name_bn': fare.destinationNameBn,
      'destination_name_en': fare.destinationNameEn,
      'fare_amount': fare.fareAmount,
      'travel_distance_km': fare.travelDistanceKm,
      'route_id': fare.routeId,
      'route_code': fare.routeCode,
      'route_name_bn': fare.routeNameBn,
      'route_total_distance': fare.routeTotalDistance,
      'pdf_page_number': fare.pdfPage,
      'pdf_url': fare.pdfUrl,
      'btrc_url': fare.btrcUrl,
      'base_rate': fare.baseRate,
      'min_fare': fare.minFare,
    };

    await _localDataSource.insertBookmark(
      id: fare.fareId,
      type: 'fare',
      data: jsonData,
    );

    // 2. If route details are provided, save it as an offline route cache
    if (route != null) {
      await _localDataSource.insertBookmark(
        id: route.id,
        type: 'route_cache',
        data: route.toJson(),
      );
    }
  }

  @override
  Future<void> removeBookmark(String id) async {
    await _localDataSource.deleteBookmark(id);
  }

  @override
  Future<bool> isBookmarked(String id) async {
    return await _localDataSource.isBookmarked(id);
  }

  @override
  Future<BusRoute?> getCachedRoute(String routeId) async {
    final record = await _localDataSource.getBookmark(routeId);
    if (record == null) return null;

    final String type = record['type'] as String;
    final String dataJson = record['data'] as String;

    if (type == 'route' || type == 'route_cache') {
      try {
        final Map<String, dynamic> decodedData = jsonDecode(dataJson);
        return BusRoute.fromJson(decodedData);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/usecase_providers.dart';
import '../../../fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../../domain/entities/bookmark_item.dart';
import '../../domain/usecases/add_fare_bookmark_use_case.dart';
import '../../domain/usecases/add_route_bookmark_use_case.dart';
import '../../domain/usecases/get_bookmarks_use_case.dart';
import '../../domain/usecases/remove_bookmark_use_case.dart';

class BookmarksNotifier extends AsyncNotifier<List<BookmarkItem>> {
  late final GetBookmarksUseCase _getBookmarksUseCase;
  late final AddRouteBookmarkUseCase _addRouteBookmarkUseCase;
  late final AddFareBookmarkUseCase _addFareBookmarkUseCase;
  late final RemoveBookmarkUseCase _removeBookmarkUseCase;

  @override
  FutureOr<List<BookmarkItem>> build() async {
    _getBookmarksUseCase = ref.watch(getBookmarksUseCaseProvider);
    _addRouteBookmarkUseCase = ref.watch(addRouteBookmarkUseCaseProvider);
    _addFareBookmarkUseCase = ref.watch(addFareBookmarkUseCaseProvider);
    _removeBookmarkUseCase = ref.watch(removeBookmarkUseCaseProvider);

    return _getBookmarksUseCase();
  }

  Future<void> addRouteBookmark(BusRoute route) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _addRouteBookmarkUseCase(route);
      return _getBookmarksUseCase();
    });
  }

  Future<void> addFareBookmark(FareResultEntity fare, [BusRoute? route]) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _addFareBookmarkUseCase(fare, route);
      return _getBookmarksUseCase();
    });
  }

  Future<void> removeBookmark(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _removeBookmarkUseCase(id);
      return _getBookmarksUseCase();
    });
  }
}

final bookmarksProvider = AsyncNotifierProvider<BookmarksNotifier, List<BookmarkItem>>(
  BookmarksNotifier.new,
);

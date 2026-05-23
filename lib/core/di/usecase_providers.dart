import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/bookmarks/domain/usecases/add_fare_bookmark_use_case.dart';
import '../../features/bookmarks/domain/usecases/add_route_bookmark_use_case.dart';
import '../../features/bookmarks/domain/usecases/get_bookmarks_use_case.dart';
import '../../features/bookmarks/domain/usecases/get_cached_route_use_case.dart';
import '../../features/bookmarks/domain/usecases/is_bookmarked_use_case.dart';
import '../../features/bookmarks/domain/usecases/remove_bookmark_use_case.dart';
import '../../features/documents/domain/usecases/get_active_documents_use_case.dart';
import '../../features/fare_finder/domain/usecases/get_connected_stops_usecase.dart';
import '../../features/fare_finder/domain/usecases/get_fares_usecase.dart';
import '../../features/fare_finder/domain/usecases/search_stops_usecase.dart';
import '../../features/route_explorer/domain/usecases/get_all_routes.dart';
import '../../features/route_explorer/domain/usecases/get_route_details.dart';
import '../../features/route_explorer/domain/usecases/search_routes_use_case.dart';
import 'repository_providers.dart';

// ==========================================
// FEATURE: DOCUMENTS
// ==========================================

final getActiveDocumentsUseCaseProvider = Provider<GetActiveDocumentsUseCase>((
  ref,
) {
  final repository = ref.watch(documentRepositoryProvider);
  return GetActiveDocumentsUseCase(repository);
});

// ==========================================
// FEATURE: FARE FINDER
// ==========================================

final searchStopsUseCaseProvider = Provider<SearchStopsUseCase>((ref) {
  final repository = ref.watch(fareRepositoryProvider);
  return SearchStopsUseCase(repository);
});

final getConnectedStopsUseCaseProvider = Provider<GetConnectedStopsUseCase>((
  ref,
) {
  final repository = ref.watch(fareRepositoryProvider);
  return GetConnectedStopsUseCase(repository);
});

final getFaresUseCaseProvider = Provider<GetFaresUseCase>((ref) {
  final repository = ref.watch(fareRepositoryProvider);
  return GetFaresUseCase(repository);
});

// ==========================================
// FEATURE: ROUTE EXPLORER
// ==========================================

final getAllRoutesUseCaseProvider = Provider<GetAllRoutesUseCase>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return GetAllRoutesUseCase(repository);
});

final searchRoutesUseCaseProvider = Provider<SearchRoutesUseCase>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return SearchRoutesUseCase(repository);
});

final getRouteDetailsUseCaseProvider = Provider<GetRouteDetails>((ref) {
  final repository = ref.watch(routeRepositoryProvider);
  return GetRouteDetails(repository);
});

// ==========================================
// FEATURE: BOOKMARKS
// ==========================================

final getBookmarksUseCaseProvider = Provider<GetBookmarksUseCase>((ref) {
  final repository = ref.watch(bookmarksRepositoryProvider);
  return GetBookmarksUseCase(repository);
});

final addRouteBookmarkUseCaseProvider = Provider<AddRouteBookmarkUseCase>((ref) {
  final repository = ref.watch(bookmarksRepositoryProvider);
  return AddRouteBookmarkUseCase(repository);
});

final addFareBookmarkUseCaseProvider = Provider<AddFareBookmarkUseCase>((ref) {
  final repository = ref.watch(bookmarksRepositoryProvider);
  return AddFareBookmarkUseCase(repository);
});

final removeBookmarkUseCaseProvider = Provider<RemoveBookmarkUseCase>((ref) {
  final repository = ref.watch(bookmarksRepositoryProvider);
  return RemoveBookmarkUseCase(repository);
});

final isBookmarkedUseCaseProvider = Provider<IsBookmarkedUseCase>((ref) {
  final repository = ref.watch(bookmarksRepositoryProvider);
  return IsBookmarkedUseCase(repository);
});

final getCachedRouteUseCaseProvider = Provider<GetCachedRouteUseCase>((ref) {
  final repository = ref.watch(bookmarksRepositoryProvider);
  return GetCachedRouteUseCase(repository);
});

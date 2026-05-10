import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jatra/features/bookmarks/presentation/screens/bookmarks_screen.dart';

import '../../features/fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../features/fare_finder/presentation/screens/fare_details_screen.dart';
import '../../features/fare_finder/presentation/screens/fare_finder_screen.dart';
import '../../features/route_explorer/presentation/screens/route_list_screen.dart';
import '../../features/route_explorer/presentation/screens/route_details_screen.dart';

import '../ui/screens/main_screen.dart';
import '../ui/screens/settings_screen.dart';
import '../ui/widgets/app_pdf_viewer.dart';

class AppRoutes {
  static const String fareSearch = '/fare-search';
  static const String routeExplorer = '/route-explorer';
  static const String bookmarks = '/bookmarks';
  static const String settings = '/settings';
  static const String fareDetails = '/fare-details';
  static const String routeDetails = '/route-details';
  static const String pdfViewer = '/pdf-viewer';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.fareSearch,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.fareSearch,
            builder: (context, state) => const FareFinderScreen(),
          ),
          GoRoute(
            path: AppRoutes.routeExplorer,
            builder: (context, state) => const RouteListScreen(),
          ),
          GoRoute(
            path: AppRoutes.bookmarks,
            builder: (context, state) => const BookmarksScreen(),
          ),
        ],
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.fareDetails,
        builder: (context, state) {
          final fare = state.extra as FareResultEntity;
          return FareDetailsScreen(fare: fare);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '${AppRoutes.routeDetails}/:id',
        builder: (context, state) {
          final routeId = state.pathParameters['id']!;
          final routeCode =
              state.uri.queryParameters['code'] ?? 'Route Details';
          return RouteDetailsScreen(routeId: routeId, routeCode: routeCode);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.pdfViewer,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return AppPdfViewer(
            pdfUrl: data['url'],
            initialPage: data['page'],
            title: data['title'] ?? 'Document',
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});

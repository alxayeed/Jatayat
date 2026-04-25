import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../features/fare_finder/presentation/screens/fare_details_screen.dart';
import '../../features/fare_finder/presentation/screens/fare_finder_screen.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';
import '../widgets/app_pdf_viewer.dart';

class AppRoutes {
  static const String fareSearch = '/fare-search';
  static const String routeExplorer = '/route-explorer';
  static const String history = '/history';
  static const String fareDetails = '/fare-details';
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
            builder: (context, state) => const Scaffold(body: Center(child: Text('Routes Coming Soon'))),
          ),
          GoRoute(
            path: AppRoutes.history,
            builder: (context, state) => const Scaffold(body: Center(child: Text('History Coming Soon'))),
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
    ],
  );
});

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF191D17).withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: AppColors.outlineVariant.withValues(alpha: 0.15),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppNavItem(
              label: 'Home',
              icon: Icons.home_rounded,
              isActive: location == AppRoutes.fareSearch,
              onTap: () => context.go(AppRoutes.fareSearch),
            ),
            AppNavItem(
              label: 'Routes',
              icon: Icons.directions_bus_rounded,
              isActive: location == AppRoutes.routeExplorer,
              onTap: () => context.go(AppRoutes.routeExplorer),
            ),
            AppNavItem(
              label: 'History',
              icon: Icons.history_rounded,
              isActive: location == AppRoutes.history,
              onTap: () => context.go(AppRoutes.history),
            ),
          ],
        ),
      ),
    );
  }
}

class AppNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const AppNavItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : AppColors.onSurfaceVariant.withValues(alpha: 0.7),
              size: 24,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label.toUpperCase(),
                style: AppTextStyles.label.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                  letterSpacing: 0.8,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
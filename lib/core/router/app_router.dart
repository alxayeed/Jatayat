import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Theme & Styles
import '../../features/fare_finder/presentation/screens/fare_finder_screen.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

// Feature Screens

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/fare-search',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/fare-search',
            builder: (context, state) => const FareFinderScreen(),
          ),
          GoRoute(
            path: '/route-explorer',
            builder: (context, state) => const Scaffold(body: Center(child: Text('Routes Coming Soon'))),
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => const Scaffold(body: Center(child: Text('History Coming Soon'))),
          ),
        ],
      ),
    ],
  );
});

// ==========================================
// PIXEL-PERFECT APP SHELL
// ==========================================

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
              isActive: location == '/fare-search',
              onTap: () => context.go('/fare-search'),
            ),
            AppNavItem(
              label: 'Routes',
              icon: Icons.directions_bus_rounded,
              isActive: location == '/route-explorer',
              onTap: () => context.go('/route-explorer'),
            ),
            AppNavItem(
              label: 'History',
              icon: Icons.history_rounded,
              isActive: location == '/history',
              onTap: () => context.go('/history'),
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
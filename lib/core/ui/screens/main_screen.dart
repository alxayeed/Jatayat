import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_router.dart';
import '../../styles/app_colors.dart';
import '../widgets/app_nav_item.dart';

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
            // AppNavItem(
            //   label: 'Settings',
            //   icon: Icons.settings,
            //   isActive: location == AppRoutes.settings,
            //   onTap: () => context.go(AppRoutes.settings),
            // ),
            AppNavItem(
              label: 'Bookmarks',
              icon: Icons.bookmark_border,
              isActive: location == AppRoutes.bookmarks,
              onTap: () => context.go(AppRoutes.bookmarks),
            ),
          ],
        ),
      ),
    );
  }
}
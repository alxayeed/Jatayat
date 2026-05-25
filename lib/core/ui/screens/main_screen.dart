import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../router/app_router.dart';
import '../widgets/app_feedback_button.dart';
import '../widgets/app_nav_item.dart';

class MainScreen extends ConsumerWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final String location = GoRouterState.of(context).uri.path;
    final theme = Theme.of(context);

    return Scaffold(
      body: child,
      floatingActionButton: const AppFeedbackButton(),
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.outlineVariant,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppNavItem(
              label: l10n.homeMenu,
              icon: Icons.home_rounded,
              isActive: location == AppRoutes.fareSearch,
              onTap: () => context.go(AppRoutes.fareSearch),
            ),
            AppNavItem(
              label: l10n.routesMenu,
              icon: Icons.directions_bus_rounded,
              isActive: location == AppRoutes.routeExplorer,
              onTap: () => context.go(AppRoutes.routeExplorer),
            ),
            AppNavItem(
              label: l10n.docsMenu,
              icon: Icons.description_rounded,
              isActive: location == AppRoutes.documents,
              onTap: () => context.go(AppRoutes.documents),
            ),
            AppNavItem(
              label: l10n.bookmarksMenu,
              icon: Icons.bookmark_border_rounded,
              isActive: location == AppRoutes.bookmarks,
              onTap: () => context.go(AppRoutes.bookmarks),
            ),
          ],
        ),
      ),
    );
  }
}

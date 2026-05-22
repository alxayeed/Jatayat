import 'package:feedback/feedback.dart'; // ADDED
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_router.dart';
import '../../services/github_feedback_service.dart';
import '../widgets/app_nav_item.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    final theme = Theme.of(context);

    return Scaffold(
      body: child,
      // Injecting the stylized category feedback system globally
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          BetterFeedback.of(context).show((UserFeedback feedback) async {
            // 1. Safely extract the selection category string mapped inside your CustomFeedbackSheet
            final String feedbackType = feedback.extra?['type'] ?? 'bug';

            // 2. Pass the message data along with the categorization tag straight to your service
            await GitHubFeedbackService.uploadFeedback(
              context,
              feedback,
              feedbackType,
            );
          });
        },
        backgroundColor: theme.colorScheme.onPrimary,
        foregroundColor: theme.colorScheme.secondary,
        tooltip: 'Report an issue or suggestion',
        child: const Icon(Icons.bug_report_outlined),
      ),
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
              label: 'Docs',
              icon: Icons.description_rounded,
              isActive: location == AppRoutes.documents,
              onTap: () => context.go(AppRoutes.documents),
            ),
          ],
        ),
      ),
    );
  }
}

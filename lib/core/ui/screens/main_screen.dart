import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/feedback_provider.dart';
import '../../router/app_router.dart';
import '../widgets/app_nav_item.dart';

class MainScreen extends ConsumerWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String location = GoRouterState.of(context).uri.path;
    final theme = Theme.of(context);

    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          BetterFeedback.of(context).show((UserFeedback feedback) async {
            final String feedbackType = feedback.extra?['type'] ?? 'bug';

            final bool success = await ref
                .read(feedbackProvider.notifier)
                .uploadFeedback(feedback: feedback, feedbackType: feedbackType);

            if (!context.mounted) return;

            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    feedbackType == 'bug'
                        ? 'Bug report sent successfully!'
                        : 'Suggestion logged!',
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to submit feedback. Please try again.'),
                ),
              );
            }
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

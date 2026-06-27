import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/route_explorer_provider.dart';
import '../widgets/route_card.dart';
import '../widgets/route_card_shimmer.dart';

class RouteListScreen extends ConsumerWidget {
  const RouteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final routeState = ref.watch(routeExplorerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.routeExplorer,
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
        ),
        actions: [
          if (dotenv.env['SHOW_SETTINGS_BUTTON'] == 'true')
            InkWell(
              onTap: () => context.push(AppRoutes.settings),
              child: Icon(
                Icons.settings,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                size: 24,
              ),
            ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              onChanged: (value) =>
                  ref.read(routeExplorerProvider.notifier).search(value),
              decoration: InputDecoration(
                hintText: l10n.searchRoute,
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.primary,
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLowest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: routeState.when(
              data: (routes) {
                if (routes.isEmpty) {
                  return _buildEmptyState(l10n, theme);
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(routeExplorerProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: routes.length,
                    itemBuilder: (context, index) {
                      return RouteCard(route: routes[index]);
                    },
                  ),
                );
              },
              loading: () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) => const RouteCardShimmer(),
              ),
              error: (error, stack) =>
                  _buildErrorState(error, ref, l10n, theme),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_bus_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(l10n.noRoutesFound, style: theme.textTheme.titleMedium),
          Text(
            l10n.trySearching,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    Object error,
    WidgetRef ref,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: theme.colorScheme.error, size: 48),
            const SizedBox(height: 16),
            Text(l10n.failedToLoadRoutes, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              AppErrorHandler.getFriendlyMessage(error, l10n),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  ref.read(routeExplorerProvider.notifier).refresh(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

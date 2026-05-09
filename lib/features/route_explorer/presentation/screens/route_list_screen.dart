import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
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

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(l10n.routeExplorer, style: AppTextStyles.label.copyWith(fontSize: 20)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              onChanged: (value) => ref.read(routeExplorerProvider.notifier).search(value),
              decoration: InputDecoration(
                hintText: l10n.searchRoute,
                hintStyle: AppTextStyles.caption,
                prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                filled: true,
                fillColor: AppColors.surfaceContainerLowest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
                ),
              ),
            ),
          ),
          Expanded(
            child: routeState.when(
              data: (routes) {
                if (routes.isEmpty) {
                  return _buildEmptyState(l10n);
                }
                return RefreshIndicator(
                  onRefresh: () => ref.read(routeExplorerProvider.notifier).refresh(),
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
              error: (error, stack) => _buildErrorState(error.toString(), ref, l10n),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_bus_outlined,
              size: 64, color: AppColors.onSurfaceVariant.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(l10n.noRoutesFound, style: AppTextStyles.label),
          Text(l10n.trySearching, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message, WidgetRef ref, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(l10n.failedToLoadRoutes, style: AppTextStyles.label),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center, style: AppTextStyles.caption),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => ref.read(routeExplorerProvider.notifier).refresh(),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
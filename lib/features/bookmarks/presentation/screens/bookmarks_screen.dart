import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/ad_provider.dart';
import '../../../../core/ui/widgets/app_native_ad_card.dart';
import '../../../../core/providers/settings_provider.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../fare_finder/domain/entities/fair_result_entity/fare_result_entity.dart';
import '../../../fare_finder/presentation/widgets/fare_card.dart';
import '../../../route_explorer/domain/entities/bus_route/bus_route.dart';
import '../../../route_explorer/presentation/widgets/route_card.dart';
import '../../domain/entities/bookmark_item.dart';
import '../providers/bookmarks_provider.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Check language from SettingsProvider
    final currentLocale = ref.watch(settingsProvider).locale;
    final isBn = currentLocale.languageCode == 'bn';

    final bookmarksAsync = ref.watch(bookmarksProvider);

    final String screenTitle = isBn ? 'বুকমার্কস' : 'Bookmarks';
    final String routesTabTitle = isBn ? 'রুটসমূহ' : 'Saved Routes';
    final String faresTabTitle = isBn ? 'ভাড়া' : 'Saved Fares';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CustomAppBar(title: screenTitle),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelColor: theme.colorScheme.onPrimary,
                      unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      tabs: [
                        Tab(text: faresTabTitle),
                        Tab(text: routesTabTitle),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: bookmarksAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
              child: Text(
                isBn ? 'লোড করতে ব্যর্থ হয়েছে: $err' : 'Failed to load bookmarks: $err',
                style: TextStyle(color: theme.colorScheme.error),
              ),
            ),
            data: (items) {
              final routeBookmarks = items.where((e) => e.type == 'route').toList();
              final fareBookmarks = items.where((e) => e.type == 'fare').toList();

              return TabBarView(
                children: [
                  _buildFaresList(context, ref, fareBookmarks, isBn, theme),
                  _buildRoutesList(context, ref, routeBookmarks, isBn, theme),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRoutesList(
    BuildContext context,
    WidgetRef ref,
    List<BookmarkItem> items,
    bool isBn,
    ThemeData theme,
  ) {
    if (items.isEmpty) {
      return _buildEmptyState(
        theme: theme,
        icon: Icons.directions_bus_rounded,
        title: isBn ? 'কোনো রুট বুকমার্ক করা নেই' : 'No Bookmarked Routes',
        subtitle: isBn
            ? 'আপনার প্রিয় বাস রুটগুলি সংরক্ষণ করতে রুটের বিস্তারিত পেজে বুকমার্ক বাটনে ট্যাপ করুন'
            : 'Tap the bookmark icon in route details to save routes here.',
      );
    }

    final showAds = ref.watch(adServiceProvider).areAdsEnabled;
    final bool hasAdSlot = showAds && items.isNotEmpty;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length + (hasAdSlot ? 1 : 0),
      itemBuilder: (context, index) {
        if (hasAdSlot) {
          final int adIndex = items.length > 5 ? 4 : items.length;
          if (index == adIndex) {
            return const AppNativeAdCard();
          }
          final itemIndex = index > adIndex ? index - 1 : index;
          final item = items[itemIndex];
          final route = item.entity as BusRoute;

          return Dismissible(
            key: Key('route-bookmark-${item.id}'),
            direction: DismissDirection.endToStart,
            background: _buildDismissBackground(theme),
            onDismissed: (_) => _handleDismiss(context, ref, item.id, isBn, true),
            child: RouteCard(route: route),
          );
        }

        final item = items[index];
        final route = item.entity as BusRoute;

        return Dismissible(
          key: Key('route-bookmark-${item.id}'),
          direction: DismissDirection.endToStart,
          background: _buildDismissBackground(theme),
          onDismissed: (_) => _handleDismiss(context, ref, item.id, isBn, true),
          child: RouteCard(route: route),
        );
      },
    );
  }

  Widget _buildFaresList(
    BuildContext context,
    WidgetRef ref,
    List<BookmarkItem> items,
    bool isBn,
    ThemeData theme,
  ) {
    if (items.isEmpty) {
      return _buildEmptyState(
        theme: theme,
        icon: Icons.wallet_rounded,
        title: isBn ? 'কোনো ভাড়া বুকমার্ক করা নেই' : 'No Bookmarked Fares',
        subtitle: isBn
            ? 'আপনার ঘনঘন ব্যবহূত বাস যাত্রার ভাড়া এবং বিবরণ সংরক্ষণ করতে বুকমার্ক করুন'
            : 'Save frequently used journeys to access their fare details quickly offline.',
      );
    }

    final showAds = ref.watch(adServiceProvider).areAdsEnabled;
    final bool hasAdSlot = showAds && items.isNotEmpty;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length + (hasAdSlot ? 1 : 0),
      itemBuilder: (context, index) {
        if (hasAdSlot) {
          final int adIndex = items.length > 5 ? 4 : items.length;
          if (index == adIndex) {
            return const AppNativeAdCard();
          }
          final itemIndex = index > adIndex ? index - 1 : index;
          final item = items[itemIndex];
          final fare = item.entity as FareResultEntity;

          return Dismissible(
            key: Key('fare-bookmark-${item.id}'),
            direction: DismissDirection.endToStart,
            background: _buildDismissBackground(theme),
            onDismissed: (_) => _handleDismiss(context, ref, item.id, isBn, false),
            child: FareCard(fare: fare),
          );
        }

        final item = items[index];
        final fare = item.entity as FareResultEntity;

        return Dismissible(
          key: Key('fare-bookmark-${item.id}'),
          direction: DismissDirection.endToStart,
          background: _buildDismissBackground(theme),
          onDismissed: (_) => _handleDismiss(context, ref, item.id, isBn, false),
          child: FareCard(fare: fare),
        );
      },
    );
  }

  Widget _buildDismissBackground(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: Icon(
        Icons.delete_sweep_rounded,
        color: theme.colorScheme.onErrorContainer,
        size: 28,
      ),
    );
  }

  void _handleDismiss(
    BuildContext context,
    WidgetRef ref,
    String id,
    bool isBn,
    bool isRoute,
  ) {
    ref.read(bookmarksProvider.notifier).removeBookmark(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isRoute
              ? (isBn ? 'রুট বুকমার্ক থেকে মুছে ফেলা হয়েছে' : 'Route removed from bookmarks')
              : (isBn ? 'ভাড়া বুকমার্ক থেকে মুছে ফেলা হয়েছে' : 'Fare removed from bookmarks'),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildEmptyState({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

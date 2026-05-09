import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/ui/widgets/reference_action_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bus_route/bus_route.dart';
import '../providers/route_explorer_provider.dart';
import '../widgets/route_card.dart';
import '../widgets/route_details_shimmer.dart';
import '../widgets/route_stop_item.dart';

class RouteDetailsScreen extends ConsumerWidget {
  final String routeId;
  final String routeCode;

  const RouteDetailsScreen({
    super.key,
    required this.routeId,
    required this.routeCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final asyncDetailedRoute = ref.watch(routeDetailsProvider(routeId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('${l10n.routePrefix} $routeCode'),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: asyncDetailedRoute.when(
        loading: () => const RouteDetailsShimmer(),
        error: (error, stackTrace) => _buildErrorView(ref, error, l10n),
        data: (route) => _buildRouteContent(context, route, l10n),
      ),
    );
  }

  Widget _buildRouteContent(BuildContext context, BusRoute route, AppLocalizations l10n) {
    final isBn = l10n.localeName == 'bn';

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                RouteCard(route: route, isClickable: false),
                Row(
                  children: [
                    Expanded(
                      child: ReferenceActionButton(
                        label: l10n.viewProof,
                        icon: Icons.picture_as_pdf_rounded,
                        color: AppColors.primary,
                        onTap: () {
                          if (route.pdfUrl != null) {
                            context.push(AppRoutes.pdfViewer, extra: {
                              'url': route.pdfUrl,
                              'page': route.pdfPageNumber ?? 1,
                              'title': '${route.routeCode} - ${l10n.fareList}',
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.noPdfAvailable)),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ReferenceActionButton(
                        label: l10n.brtaLink,
                        icon: Icons.open_in_new_rounded,
                        color: AppColors.onSurfaceVariant,
                        onTap: () {
                          if (route.btrcUrl != null && route.btrcUrl!.isNotEmpty) {
                            context.push(AppRoutes.pdfViewer, extra: {
                              'url': route.btrcUrl,
                              'page': route.pdfPageNumber ?? 1,
                              'title': '${route.routeCode} - ${l10n.brtaDocument}',
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.noBrtaLink)),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final stop = route.stops[index];
                final isFirst = index == 0;
                final isLast = index == route.stops.length - 1;

                return RouteStopItem(
                  stopName: isBn ? stop.nameBn : (stop.nameEn ?? stop.nameBn),
                  isFirst: isFirst,
                  isLast: isLast,
                  isSelected: true,
                  isSpecial: isFirst || isLast,
                );
              },
              childCount: route.stops.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }

  Widget _buildErrorView(WidgetRef ref, Object error, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              '${l10n.failedToLoadRouteDetails}\n${error.toString()}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.invalidate(routeDetailsProvider(routeId)),
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
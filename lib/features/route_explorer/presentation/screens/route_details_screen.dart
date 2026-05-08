import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/bus_route/bus_route.dart';
import '../providers/route_explorer_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/widgets/reference_action_button.dart';
import '../widgets/fare_details_shimmer.dart';
import '../widgets/route_card.dart';


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
    final asyncDetailedRoute = ref.watch(routeDetailsProvider(routeId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Route $routeCode'),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: asyncDetailedRoute.when(
        loading: () => const FareDetailsShimmer(),
        error: (error, stackTrace) => _buildErrorView(ref, error),
        data: (route) => _buildRouteContent(context, route),
      ),
    );
  }

  Widget _buildRouteContent(BuildContext context, BusRoute route) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 1. Reusing the exact same RouteCard, disabled tapping
                RouteCard(route: route, isClickable: false),

                // 2. The PDF Reference Buttons
                Row(
                  children: [
                    Expanded(
                      child: ReferenceActionButton(
                        label: 'প্রমাণ দেখুন',
                        icon: Icons.picture_as_pdf_rounded,
                        color: AppColors.primary,
                        onTap: () {
                          if (route.pdfUrl != null) {
                            context.push(AppRoutes.pdfViewer, extra: {
                              'url': route.pdfUrl,
                              'page': route.pdfPageNumber ?? 1,
                              'title': '${route.routeCode} - ভাড়ার তালিকা',
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('No PDF available for this route.')),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ReferenceActionButton(
                        label: 'বিআরটিএ লিঙ্ক',
                        icon: Icons.open_in_new_rounded,
                        color: AppColors.onSurfaceVariant,
                        onTap: () {
                          if (route.btrcUrl != null && route.btrcUrl!.isNotEmpty) {
                            context.push(AppRoutes.pdfViewer, extra: {
                              'url': route.btrcUrl,
                              'page': route.pdfPageNumber ?? 1,
                              'title': '${route.routeCode} - BRTA Document',
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('No BRTA link available for this route.')),
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

        // 3. The Timeline of Stops
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final stop = route.stops[index];
                final isFirst = index == 0;
                final isLast = index == route.stops.length - 1;

                return _TimelineStopTile(
                  stop: stop,
                  isFirst: isFirst,
                  isLast: isLast,
                );
              },
              childCount: route.stops.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text('Failed to load route details.\n${error.toString()}', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.invalidate(routeDetailsProvider(routeId)),
              child: const Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}


class _TimelineStopTile extends StatelessWidget {
  final RouteStop stop;
  final bool isFirst;
  final bool isLast;

  const _TimelineStopTile({
    required this.stop,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lineColor = theme.colorScheme.primary.withValues(alpha: 0.5);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Visuals
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Top line (Hide if first stop)
                Expanded(
                  child: Container(
                    width: 3,
                    color: isFirst ? Colors.transparent : lineColor,
                  ),
                ),
                // The Node/Dot
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isFirst || isLast
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surface,
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 3,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                // Bottom line (Hide if last stop)
                Expanded(
                  child: Container(
                    width: 3,
                    color: isLast ? Colors.transparent : lineColor,
                  ),
                ),
              ],
            ),
          ),

          // Stop Information
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stop.nameBn,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: isFirst || isLast ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (stop.cumulativeDistanceKm > 0)
                    Text(
                      '${stop.cumulativeDistanceKm} km from start',
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
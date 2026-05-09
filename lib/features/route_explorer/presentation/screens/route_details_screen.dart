import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/widgets/reference_action_button.dart';
import '../../domain/entities/bus_route/bus_route.dart';
import '../providers/route_explorer_provider.dart';
import '../widgets/route_card.dart';
import '../widgets/route_details_shimmer.dart';
import '../widgets/route_stop_item.dart'; // Reusing the shared widget

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
        loading: () => const RouteDetailsShimmer(),
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

        // 3. The Timeline of Stops using the shared RouteStopItem
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final stop = route.stops[index];
                final isFirst = index == 0;
                final isLast = index == route.stops.length - 1;

                return RouteStopItem(
                  stopName: stop.nameBn,
                  isFirst: isFirst,
                  isLast: isLast,
                  isSelected: true, // Entire route is active in explorer view
                  isSpecial: isFirst || isLast, // Mark start/end nodes prominently
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
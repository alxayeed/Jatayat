import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/app_shimmer.dart';

class RouteCardShimmer extends StatelessWidget {
  const RouteCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SkeletonBox(width: 60, height: 26, borderRadius: 8),
              const SkeletonBox(width: 80, height: 16, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 16),
          const SkeletonBox(width: 200, height: 24, borderRadius: 6),
          const SizedBox(height: 8),
          const SkeletonBox(width: 100, height: 14, borderRadius: 4),
          Divider(height: 24, color: theme.dividerTheme.color),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatColumn(CrossAxisAlignment.start),
              _buildStatColumn(CrossAxisAlignment.center),
              _buildStatColumn(CrossAxisAlignment.end, isHero: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(CrossAxisAlignment align, {bool isHero = false}) {
    return Column(
      crossAxisAlignment: align,
      children: [
        SkeletonBox(
          width: isHero ? 60 : 40,
          height: isHero ? 24 : 16,
          borderRadius: 4,
        ),
        const SizedBox(height: 6),
        const SkeletonBox(width: 50, height: 10, borderRadius: 2),
      ],
    );
  }
}

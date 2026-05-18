import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/app_shimmer.dart';

class DocumentCardShimmer extends StatelessWidget {
  const DocumentCardShimmer({super.key});

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
              // Shimmer for the Version Name badge
              const SkeletonBox(width: 90, height: 24, borderRadius: 8),
              // Shimmer for the top right Action Icon
              const SkeletonBox(width: 20, height: 20, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 18),
          // Shimmer for the Document Title headline text
          const SkeletonBox(width: 240, height: 22, borderRadius: 6),
          const SizedBox(height: 8),
          // Shimmer for cases with multi-line wrap titles
          const SkeletonBox(width: 140, height: 16, borderRadius: 6),
          Divider(height: 24, color: theme.dividerTheme.color),
          Row(
            children: const [
              // Shimmer for the Calendar prefix icon
              SkeletonBox(width: 14, height: 14, borderRadius: 4),
              SizedBox(width: 8),
              // Shimmer for the formatted publication date string
              SkeletonBox(width: 100, height: 14, borderRadius: 4),
            ],
          ),
        ],
      ),
    );
  }
}

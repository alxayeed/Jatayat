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
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SkeletonBox(width: 70, height: 24, borderRadius: 8),
              const SizedBox(width: 8),
              const SkeletonBox(width: 50, height: 20, borderRadius: 8),
              const Spacer(),
              const SkeletonBox(width: 18, height: 18, borderRadius: 4),
            ],
          ),
          const SizedBox(height: 14),
          const SkeletonBox(width: 260, height: 20, borderRadius: 6),
          const SizedBox(height: 8),
          const SkeletonBox(width: 180, height: 14, borderRadius: 6),
          const SizedBox(height: 8),
          Divider(height: 16, color: theme.dividerTheme.color),
          Row(
            children: const [
              SkeletonBox(width: 14, height: 14, borderRadius: 4),
              SizedBox(width: 6),
              SkeletonBox(width: 110, height: 14, borderRadius: 4),
            ],
          ),
        ],
      ),
    );
  }
}

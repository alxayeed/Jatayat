import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/app_shimmer.dart'; // Update path as needed

class RouteDetailsShimmer extends StatelessWidget {
  const RouteDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(), // Prevent scrolling while loading
        slivers: [
          const CustomAppBar(title: 'Loading...', showProfile: false),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Official Top Header Shimmer
                  const SkeletonBox(width: 250, height: 18),
                  const SizedBox(height: 8),
                  const SkeletonBox(width: 180, height: 18),
                  const SizedBox(height: 16),
                  const SkeletonBox(width: 200, height: 28, borderRadius: 8),

                  const SizedBox(height: 20),

                  // 2. Main Timeline Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.outlineVariant.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Timeline fake
                        Row(
                          children: [
                            const SkeletonBox(width: 20, height: 20, borderRadius: 10),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SkeletonBox(width: 60, height: 12),
                                  SizedBox(height: 4),
                                  SkeletonBox(width: 100, height: 18),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  SkeletonBox(width: 60, height: 12),
                                  SizedBox(height: 4),
                                  SkeletonBox(width: 100, height: 18),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            const SkeletonBox(width: 20, height: 20, borderRadius: 10),
                          ],
                        ),
                        const Divider(height: 40, thickness: 0.5),

                        // Main Fare Value
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SkeletonBox(width: 100, height: 18),
                            SkeletonBox(width: 80, height: 40, borderRadius: 8),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Bottom 3 mini stats
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMiniStatShimmer(),
                            _buildMiniStatShimmer(),
                            _buildMiniStatShimmer(),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 3. Official Notes Block Shimmer
                  const SkeletonBox(width: double.infinity, height: 80, borderRadius: 16),

                  const SizedBox(height: 24),

                  // 4. Action Buttons Shimmer
                  Row(
                    children: [
                      const Expanded(child: SkeletonBox(height: 64, width: double.infinity, borderRadius: 16)),
                      const SizedBox(width: 12),
                      const Expanded(child: SkeletonBox(height: 64, width: double.infinity, borderRadius: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStatShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SkeletonBox(width: 50, height: 12),
        SizedBox(height: 4),
        SkeletonBox(width: 70, height: 16),
      ],
    );
  }
}
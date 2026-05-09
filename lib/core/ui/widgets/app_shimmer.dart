import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/styles/app_colors.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.outlineVariant.withValues(alpha: 0.1),
      highlightColor: AppColors.surfaceContainerLowest,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white, // Needs to be opaque for Shimmer to paint over it
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
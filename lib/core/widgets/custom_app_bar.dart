import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      backgroundColor: AppColors.background.withValues(alpha: 0.8),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jatra', style: AppTextStyles.logo),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.secondaryContainer,
                  child: const Icon(Icons.person, size: 20, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
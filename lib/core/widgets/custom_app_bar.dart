import 'dart:ui';
import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool showProfile;

  const CustomAppBar({
    super.key,
    this.title,
    this.showProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      backgroundColor: AppColors.background.withValues(alpha: 0.8),
      automaticallyImplyLeading: title != null,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title ?? 'Jatri',
                    style: AppTextStyles.logo,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                if (showProfile)
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
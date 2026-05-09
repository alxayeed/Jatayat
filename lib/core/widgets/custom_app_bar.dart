import 'dart:ui';
import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showProfile;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    // Check go_router's navigation stack.
    // If canPop is true, go_router will automatically inject a back button.
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      backgroundColor: Colors.transparent,

      // Let go_router and Flutter handle the back button magically
      automaticallyImplyLeading: true,

      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              // Contextual Typography: Read the router state to determine size
              style: AppTextStyles.logo.copyWith(
                fontSize: canPop ? 20 : 36,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showProfile)
            const Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.secondaryContainer,
                child: Icon(Icons.person, size: 20, color: AppColors.primary),
              ),
            ),
        ],
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: AppColors.background.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}
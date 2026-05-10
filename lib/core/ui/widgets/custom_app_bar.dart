import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jatra/core/router/app_router.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  // final bool showProfile;

  const CustomAppBar({
    super.key,
    required this.title,
    // this.showProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      // leading:
      actions: [
        if (!canPop)
          InkWell(
            onTap: () => context.push(AppRoutes.settings),
            child: Icon(
              Icons.settings,
              color: AppColors.onSurfaceVariant.withValues(alpha: 0.7),
              size: 24,
            ),
          ),
      ],
      actionsPadding: EdgeInsets.only(right: 16),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset("assets/logo/app_logo.png", width: 48, height: 48),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.logo.copyWith(fontSize: canPop ? 20 : 36),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: AppColors.background.withValues(alpha: 0.8)),
        ),
      ),
    );
  }
}

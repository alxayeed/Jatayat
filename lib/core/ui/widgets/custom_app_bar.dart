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
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.logo.copyWith(
                fontSize: canPop ? 20 : 36,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // if (!canPop)
          //   Padding(
          //     padding: const EdgeInsets.only(right: 4.0),
          //     child: InkWell(
          //       onTap: (){
          //         context.pushNamed(AppRoutes.settings);
          //       },
          //       child: const CircleAvatar(
          //         radius: 18,
          //         backgroundColor: AppColors.secondaryContainer,
          //         child: Icon(Icons.settings, size: 20, color: AppColors.primary),
          //       ),
          //     ),
          //   ),
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
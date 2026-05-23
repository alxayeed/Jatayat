import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jatayat/core/router/app_router.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color contentColor = isDark
        ? Colors.white
        : theme.colorScheme.primary;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      iconTheme: theme.iconTheme.copyWith(color: contentColor),
      actions: [
        if (!canPop && kDebugMode)
          InkWell(
            onTap: () => context.push(AppRoutes.settings),
            child: Icon(
              Icons.settings,
              color: isDark
                  ? Colors.white
                  : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              size: 24,
            ),
          ),
      ],
      actionsPadding: const EdgeInsets.only(right: 16),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: theme.appBarTheme.titleTextStyle?.copyWith(
                fontSize: canPop ? 20 : 36,
                color: contentColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}

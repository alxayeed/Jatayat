import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jatayat/core/router/app_router.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final theme = Theme.of(context);
    final _ = theme.brightness == Brightness.dark;

    final Color contentColor =
        theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      iconTheme: theme.iconTheme.copyWith(color: contentColor),
      actions: [
        ...?actions,
        if (!canPop)
          InkWell(
            onTap: () => context.push(AppRoutes.settings),
            child: Icon(Icons.settings, color: contentColor, size: 24),
          ),
      ],
      actionsPadding: const EdgeInsets.only(right: 16),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/transparent_app_logo.png',
            width: canPop ? 36 : 48,
            height: canPop ? 36 : 48,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: theme.appBarTheme.titleTextStyle?.copyWith(
                fontSize: canPop ? 20 : 32,
                color: contentColor,
              ),
              maxLines: 1,
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

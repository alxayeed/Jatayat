import 'package:flutter/material.dart';

import '../../../../core/styles/app_colors.dart';

class SwapButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SwapButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.swap_vert,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
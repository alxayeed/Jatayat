import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: Text(label!.toUpperCase(), style: AppTextStyles.label),
          ),

        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF191D17).withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            readOnly: readOnly,
            style: AppTextStyles.bodyMain.copyWith(
              fontFamily: 'HindSiliguri',
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.bodyMain.copyWith(
                color: AppColors.outline,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(prefixIcon, color: AppColors.outline, size: 22),
              suffixIcon: suffixIcon, // Passed to InputDecoration
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

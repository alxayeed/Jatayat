import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: Text(
              label!.toUpperCase(),
              style: theme.textTheme.labelLarge,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.06),
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
            style: theme.textTheme.bodyLarge?.copyWith(
              fontFamily: 'HindSiliguri',
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.outline,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: theme.colorScheme.outline,
                size: 22,
              ),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
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

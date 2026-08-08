import 'package:flutter/material.dart';

class AppSwitchOption<T> {
  final T value;
  final String? label;
  final IconData? icon;

  const AppSwitchOption({
    required this.value,
    this.label,
    this.icon,
  });
}

class AppSwitchButton<T> extends StatelessWidget {
  final T selectedValue;
  final List<AppSwitchOption<T>> options;
  final ValueChanged<T> onSelected;

  const AppSwitchButton({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: options.map((opt) {
          final isSelected = selectedValue == opt.value;
          return GestureDetector(
            onTap: () => onSelected(opt.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (opt.icon != null) ...[
                    Icon(
                      opt.icon,
                      size: 16,
                      color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
                    ),
                    if (opt.label != null) const SizedBox(width: 6),
                  ],
                  if (opt.label != null)
                    Text(
                      opt.label!,
                      style: tt.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

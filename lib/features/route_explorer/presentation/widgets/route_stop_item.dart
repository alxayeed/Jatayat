import 'package:flutter/material.dart';

class RouteStopItem extends StatelessWidget {
  final String stopName;
  final bool isFirst;
  final bool isLast;
  final bool isSelected;
  final bool isSpecial;

  const RouteStopItem({
    super.key,
    required this.stopName,
    this.isFirst = false,
    this.isLast = false,
    this.isSelected = false,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 2,
                    color: isFirst
                        ? Colors.transparent
                        : (isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant),
                  ),
                ),
                Container(
                  width: isSpecial ? 14 : 10,
                  height: isSpecial ? 14 : 10,
                  decoration: BoxDecoration(
                    color: isSpecial
                        ? theme.colorScheme.primary
                        : (isSelected
                              ? theme.colorScheme.primary
                              : Colors.transparent),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                      width: 2,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: isLast
                        ? Colors.transparent
                        : (isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                stopName,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: isSpecial ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.outline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

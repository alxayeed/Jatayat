import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';

class RouteStopItem extends StatelessWidget {
  final String stopName;
  final bool isFirst;
  final bool isLast;
  final bool isSelected; // Part of the travel path
  final bool isSpecial;  // Is specifically the Start or End stop

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
    return IntrinsicHeight(
      child: Row(
        children: [
          // Timeline indicator column
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Line above the dot
                Expanded(
                  child: Container(
                    width: 2,
                    color: isFirst
                        ? Colors.transparent
                        : (isSelected ? AppColors.primary : AppColors.outlineVariant),
                  ),
                ),
                // The Dot
                Container(
                  width: isSpecial ? 14 : 10,
                  height: isSpecial ? 14 : 10,
                  decoration: BoxDecoration(
                    color: isSpecial
                        ? AppColors.primary
                        : (isSelected ? AppColors.primary : Colors.transparent),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.outline,
                      width: 2,
                    ),
                  ),
                ),
                // Line below the dot
                Expanded(
                  child: Container(
                    width: 2,
                    color: isLast
                        ? Colors.transparent
                        : (isSelected ? AppColors.primary : AppColors.outlineVariant),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Stop Name
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                stopName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSpecial ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.onSurface : AppColors.outline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

class AppSuggestionList extends StatelessWidget {
  final List<StopEntity> suggestions;
  final Function(StopEntity) onSelected;

  const AppSuggestionList({
    super.key,
    required this.suggestions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: suggestions.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: AppColors.outlineVariant.withValues(alpha: 0.1),
          ),
          itemBuilder: (context, index) {
            final stop = suggestions[index];
            return ListTile(
              leading: const Icon(Icons.history, size: 18, color: AppColors.outline),
              title: Text(stop.nameBn, style: AppTextStyles.banglaName.copyWith(fontSize: 16)),
              trailing: const Icon(Icons.north_west_rounded, size: 14, color: AppColors.outline),
              onTap: () => onSelected(stop),
            );
          },
        ),
      ),
    );
  }
}
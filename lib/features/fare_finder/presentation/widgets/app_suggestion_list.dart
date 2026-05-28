import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

class AppSuggestionList extends ConsumerWidget {
  final List<StopEntity> suggestions;
  final Function(StopEntity) onSelected;

  const AppSuggestionList({
    super.key,
    required this.suggestions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentLocale = ref.watch(settingsProvider).locale;
    final isBn = currentLocale.languageCode == 'bn';

    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
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
        child: Material(
          color: Colors.transparent,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: suggestions.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.1),
            ),
            itemBuilder: (context, index) {
              final stop = suggestions[index];
              final displayName = isBn
                  ? (stop.nameBn ?? stop.nameEn)
                  : (stop.nameEn ?? stop.nameBn);

              return ListTile(
                leading: Icon(
                  Icons.history,
                  size: 18,
                  color: theme.colorScheme.outline,
                ),
                title: Text(
                  displayName ?? "",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontFamily: isBn ? 'HindSiliguri' : null,
                    fontSize: 16,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                trailing: Icon(
                  Icons.north_west_rounded,
                  size: 14,
                  color: theme.colorScheme.outline,
                ),
                onTap: () => onSelected(stop),
              );
            },
          ),
        ),
      ),
    );
  }
}

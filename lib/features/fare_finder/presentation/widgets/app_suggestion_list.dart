import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

class AppSuggestionList extends ConsumerWidget {
  final List<StopEntity> suggestions;
  final Function(StopEntity) onSelected;
  final bool isLoading;
  final String? errorMessage;
  final String? emptyMessage;

  const AppSuggestionList({
    super.key,
    required this.suggestions,
    required this.onSelected,
    this.isLoading = false,
    this.errorMessage,
    this.emptyMessage,
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
          child: _buildContent(context, theme, isBn),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, bool isBn) {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              isBn ? 'স্টপেজ লোড হচ্ছে...' : 'Loading stops...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    if (errorMessage != null && errorMessage!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.error_outline, size: 18, color: theme.colorScheme.error),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                errorMessage!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (suggestions.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            emptyMessage ??
                (isBn ? 'কোনো স্টপেজ পাওয়া যায়নি' : 'No stops found'),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: suggestions.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: theme.colorScheme.outlineVariant.withValues(alpha: 0.1),
      ),
      itemBuilder: (context, index) {
        final stop = suggestions[index];
        final displayName = isBn ? (stop.nameBn) : (stop.nameEn ?? stop.nameBn);

        return ListTile(
          leading: Icon(
            Icons.history,
            size: 18,
            color: theme.colorScheme.outline,
          ),
          title: Text(
            displayName,
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
    );
  }
}

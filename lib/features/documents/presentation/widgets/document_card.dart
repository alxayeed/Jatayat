import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../../../core/router/app_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/document_entity.dart';

class DocumentCard extends ConsumerWidget {
  final DocumentEntity document;

  const DocumentCard({super.key, required this.document});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // Watch settings to manage dynamic typography formatting
    final settings = ref.watch(settingsProvider);
    final isBengali = settings.locale.languageCode == 'bn';

    // Parse the display date formatting
    final formattedDate = DateFormat.yMMMMd(
      settings.locale.languageCode,
    ).format(document.createdAt);

    return InkWell(
      onTap: () {
        // Navigates directly into your custom AppPdfViewer route
        context.push(
          AppRoutes.pdfViewer,
          extra: {
            'url': document.pdfUrl,
            'page': 1, // Start on the first page
            'title': document.title,
          },
        );
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildVersionBadge(document.versionName, theme),
                if (document.region != null && document.region!.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  _buildRegionBadge(document.region!.toUpperCase(), theme),
                ],
                const Spacer(),
                Icon(
                  Icons.picture_as_pdf_rounded,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              document.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: isBengali ? 'HindSiliguri' : null,
                fontWeight: FontWeight.bold,
                fontSize: isBengali ? 18 : 16,
              ),
            ),
            if (document.notes != null && document.notes!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                document.notes!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: isBengali ? 'HindSiliguri' : null,
                  color: theme.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.8,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Divider(height: 16, color: theme.dividerTheme.color),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  formattedDate,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: isBengali ? 'HindSiliguri' : null,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionBadge(String version, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        version,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildRegionBadge(String region, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        region,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontSize: 10,
        ),
      ),
    );
  }
}

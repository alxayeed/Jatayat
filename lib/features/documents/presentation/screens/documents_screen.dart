import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/documents_provider.dart';
import '../widgets/document_card.dart';
import '../widgets/document_card_shimmer.dart';

class DocumentsScreen extends ConsumerWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentsAsync = ref.watch(documentsProvider);
    final settings = ref.watch(settingsProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final isBengali = settings.locale.languageCode == 'bn';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.gazzette,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: isBengali ? 'HindSiliguri' : null,
          ),
        ),
      ),
      body: Column(
        children: [
          // Elegant Search Input Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (query) =>
                  ref.read(documentsProvider.notifier).search(query),
              style: TextStyle(fontFamily: isBengali ? 'HindSiliguri' : null),
              decoration: InputDecoration(
                hintText: isBengali
                    ? 'অফিসিয়াল চার্ট খুঁজুন...'
                    : 'Search official charts...',
                hintStyle: TextStyle(
                  fontFamily: isBengali ? 'HindSiliguri' : null,
                ),
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLowest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(
                      alpha: 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Body handling Async Notifier States
          Expanded(
            child: documentsAsync.when(
              loading: () => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4,
                itemBuilder: (context, index) => const DocumentCardShimmer(),
              ),
              error: (error, stackTrace) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        size: 48,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        error.toString(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                          fontFamily: isBengali ? 'HindSiliguri' : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () =>
                            ref.read(documentsProvider.notifier).refresh(),
                        icon: const Icon(Icons.refresh_rounded),
                        label: Text(
                          isBengali ? 'পুনরায় চেষ্টা করুন' : 'Retry',
                          style: TextStyle(
                            fontFamily: isBengali ? 'HindSiliguri' : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              data: (documents) {
                if (documents.isEmpty) {
                  return Center(
                    child: Text(
                      isBengali
                          ? 'কোনো ফাইল খুঁজে পাওয়া যায়নি।'
                          : 'No matching documents found.',
                      style: TextStyle(
                        fontFamily: isBengali ? 'HindSiliguri' : null,
                      ),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(documentsProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return DocumentCard(document: documents[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

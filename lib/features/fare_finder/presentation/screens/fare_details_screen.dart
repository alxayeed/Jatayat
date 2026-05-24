import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/ui/widgets/app_feedback_button.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../core/ui/widgets/route_timeline.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bookmarks/presentation/providers/bookmarks_provider.dart';
import '../../../route_explorer/presentation/providers/route_explorer_provider.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';
import '../providers/fare_search_provider.dart';

class FareDetailsScreen extends ConsumerWidget {
  final FareResultEntity fare;

  const FareDetailsScreen({super.key, required this.fare});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final routeDetailsAsync = ref.watch(routeDetailsProvider(fare.routeId));
    final searchState = ref.read(fareSearchProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Check language from SettingsProvider
    final currentLocale = ref.watch(settingsProvider).locale;
    final isBn = currentLocale.languageCode == 'bn';

    // Watch bookmarks state
    final bookmarksAsync = ref.watch(bookmarksProvider);
    final isSaved = bookmarksAsync.maybeWhen(
      data: (items) => items.any((item) => item.id == fare.fareId),
      orElse: () => false,
    );

    final bool isFlipped = searchState.selectedOrigin?.id == fare.toStopId;

    // Localized Name Selection with Fallbacks
    final String baseOriginName = isBn
        ? (fare.originNameBn ?? fare.originNameEn ?? '')
        : (fare.originNameEn ?? fare.originNameBn ?? '');

    final String baseDestName = isBn
        ? (fare.destinationNameBn ?? fare.destinationNameEn ?? '')
        : (fare.destinationNameEn ?? fare.destinationNameBn ?? '');

    final String displayOriginName = isFlipped ? baseDestName : baseOriginName;
    final String displayDestName = isFlipped ? baseOriginName : baseDestName;
    final String displayOriginId = isFlipped ? fare.toStopId : fare.fromStopId;
    final String displayDestId = isFlipped ? fare.fromStopId : fare.toStopId;

    final calculatedFare = (fare.travelDistanceKm * fare.baseRate)
        .toStringAsFixed(2);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: l10n.fareDetailsTitle,
            actions: [
              IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
                  color: isSaved
                      ? theme.colorScheme.primary
                      : (theme.brightness == Brightness.dark ? Colors.white : theme.colorScheme.primary),
                ),
                onPressed: () {
                  final bookmarksNotifier = ref.read(bookmarksProvider.notifier);
                  if (isSaved) {
                    bookmarksNotifier.removeBookmark(fare.fareId);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isBn ? 'ভাড়ার বিবরণ বুকমার্ক থেকে মুছে ফেলা হয়েছে' : 'Fare details removed from bookmarks'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    final route = routeDetailsAsync.value;
                    bookmarksNotifier.addFareBookmark(fare, route);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isBn ? 'ভাড়ার বিবরণ বুকমার্ক করা হয়েছে' : 'Fare details added to bookmarks'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOfficialTopHeader(l10n, theme, isDark),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant,
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildJourneyTimeline(
                          displayOriginName,
                          displayDestName,
                          l10n,
                          theme,
                        ),
                        const Divider(height: 40, thickness: 0.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMiniStat(
                              l10n.travelDistance,
                              '${fare.travelDistanceKm} ${l10n.km}',
                              theme,
                            ),
                            _buildMiniStat(
                              l10n.routeCode,
                              fare.routeCode,
                              theme,
                            ),
                            _buildMiniStat(
                              l10n.reference,
                              '${l10n.page} ${fare.pdfPage ?? '-'}',
                              theme,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildCompactRow(
                          l10n.officialFare,
                          '${l10n.currencySign}${fare.fareAmount.toInt()}',
                          theme,
                          isPrimary: true,
                          isDark: isDark,
                        ),
                        _buildCompactRow(
                          l10n.calculatedFare,
                          '${l10n.currencySign}$calculatedFare',
                          theme,
                          isPrimary: false,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(l10n.routeStoppages, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 12),
                  routeDetailsAsync.when(
                    data: (route) => RouteTimeline(
                      stops: route.stops,
                      startStopId: displayOriginId,
                      endStopId: displayDestId,
                    ),
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (_, _) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(l10n.failedToLoadStops),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildOfficialNotes(l10n, theme),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          l10n.viewProof,
                          Icons.picture_as_pdf_rounded,
                          isDark ? Colors.white : theme.colorScheme.primary,
                          theme,
                          () => context.push(
                            AppRoutes.pdfViewer,
                            extra: {
                              'url': fare.pdfUrl,
                              'page': fare.pdfPage,
                              'title': '${fare.routeCode} - ${l10n.fareList}',
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildActionButton(
                          l10n.brtaLink,
                          Icons.cloud_download_rounded,
                          // Swapped icon to fit a document view action better
                          isDark
                              ? Colors.white70
                              : theme.colorScheme.onSurfaceVariant,
                          theme,
                          () {
                            if (fare.btrcUrl != null &&
                                fare.btrcUrl!.isNotEmpty) {
                              // Route the Oracle Cloud/BRTA copy directly inside your smooth native viewer!
                              context.push(
                                AppRoutes.pdfViewer,
                                extra: {
                                  'url': fare.btrcUrl,
                                  'page': 1,
                                  // Default to first page for the main legal document
                                  'title': isBn
                                      ? 'গেজেট অনুলিপি'
                                      : 'Official Ministry Gazette',
                                },
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isBn
                                        ? 'কোন লিংক পাওয়া যায়নি'
                                        : 'No link available',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const AppFeedbackButton(),
    );
  }

  Widget _buildOfficialTopHeader(
    AppLocalizations l10n,
    ThemeData theme,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.fareRatePrefix} ${fare.baseRate} ${l10n.taka}',
          style: theme.textTheme.labelLarge?.copyWith(
            color: isDark ? Colors.white : theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${l10n.routeDistancePrefix} ${fare.routeTotalDistance} ${l10n.kilometerSuffix}',
          style: theme.textTheme.labelLarge?.copyWith(
            color: isDark ? Colors.white : null,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.localeName == 'bn' ? fare.routeNameBn : (fare.routeNameEn ?? fare.routeNameBn),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontFamily: l10n.localeName == 'bn' ? 'HindSiliguri' : null,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : null,
          ),
        ),
      ],
    );
  }

  Widget _buildJourneyTimeline(
    String originName,
    String destinationName,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Icon(
            Icons.radio_button_checked,
            size: 20,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.journeyStart,
                style: theme.textTheme.labelSmall?.copyWith(fontSize: 10),
              ),
              Text(
                originName,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
                softWrap: true,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                l10n.destination,
                style: theme.textTheme.labelSmall?.copyWith(fontSize: 10),
              ),
              Text(
                destinationName,
                textAlign: TextAlign.end,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 15),
                softWrap: true,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Icon(
            Icons.location_on,
            size: 20,
            color: theme.colorScheme.error,
          ),
        ),
      ],
    );
  }

  Widget _buildCompactRow(
    String label,
    String value,
    ThemeData theme, {
    bool isPrimary = false,
    required bool isDark,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        Text(
          value,
          style: isPrimary
              ? theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : theme.colorScheme.primary,
                )
              : theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : null,
                ),
        ),
      ],
    );
  }

  Widget _buildMiniStat(String label, String value, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.labelSmall?.copyWith(fontSize: 11)),
        const SizedBox(height: 2),
        Text(value, style: theme.textTheme.labelLarge?.copyWith(fontSize: 13)),
      ],
    );
  }

  Widget _buildOfficialNotes(AppLocalizations l10n, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${l10n.noteMinFarePrefix} ${fare.minFare.toInt()}${l10n.noteMinFareSuffix}',
            style: theme.textTheme.bodySmall?.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.noteGas,
            style: theme.textTheme.bodySmall?.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    ThemeData theme,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

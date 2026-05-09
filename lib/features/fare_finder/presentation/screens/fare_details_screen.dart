import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../route_explorer/presentation/providers/route_explorer_provider.dart';
import '../../../route_explorer/presentation/widgets/route_stop_item.dart';
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

    final bool isFlipped = searchState.selectedOrigin?.id == fare.toStopId;

    final String displayOriginName = isFlipped ? fare.destinationName : fare.originName;
    final String displayDestName = isFlipped ? fare.originName : fare.destinationName;
    final String displayOriginId = isFlipped ? fare.toStopId : fare.fromStopId;
    final String displayDestId = isFlipped ? fare.fromStopId : fare.toStopId;

    final calculatedFare = (fare.travelDistanceKm * fare.baseRate).toStringAsFixed(2);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(title: l10n.fareDetailsTitle),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOfficialTopHeader(l10n),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.outlineVariant.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildJourneyTimeline(displayOriginName, displayDestName, l10n),
                        const Divider(height: 40, thickness: 0.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMiniStat(
                              l10n.travelDistance,
                              '${fare.travelDistanceKm} ${l10n.km}',
                            ),
                            _buildMiniStat(l10n.routeCode, fare.routeCode),
                            _buildMiniStat(
                              l10n.reference,
                              '${l10n.page} ${fare.pdfPage ?? '-'}',
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildCompactRow(
                          l10n.officialFare,
                          '${l10n.currencySign}${fare.fareAmount.toInt()}',
                          isPrimary: true,
                        ),
                        _buildCompactRow(
                          l10n.calculatedFare,
                          '${l10n.currencySign}$calculatedFare',
                          isPrimary: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(l10n.routeStoppages, style: AppTextStyles.label),
                  const SizedBox(height: 12),
                  routeDetailsAsync.when(
                    data: (route) {
                      final startIndex = route.stops.indexWhere(
                            (s) => s.stopId == displayOriginId,
                      );
                      final endIndex = route.stops.indexWhere(
                            (s) => s.stopId == displayDestId,
                      );

                      final bool isReversed = startIndex > endIndex && startIndex != -1 && endIndex != -1;
                      final displayStops = isReversed ? route.stops.reversed.toList() : route.stops;

                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayStops.length,
                          itemBuilder: (context, index) {
                            final stop = displayStops[index];
                            bool isSelected = false;

                            if (startIndex != -1 && endIndex != -1) {
                              final displayStartIndex = displayStops.indexWhere((s) => s.stopId == displayOriginId);
                              final displayEndIndex = displayStops.indexWhere((s) => s.stopId == displayDestId);
                              isSelected = index >= displayStartIndex && index <= displayEndIndex;
                            }

                            return RouteStopItem(
                              stopName: l10n.localeName == 'bn' ? stop.nameBn : (stop.nameEn ?? stop.nameBn),
                              isFirst: index == 0,
                              isLast: index == displayStops.length - 1,
                              isSelected: isSelected,
                              isSpecial: stop.stopId == displayOriginId || stop.stopId == displayDestId,
                            );
                          },
                        ),
                      );
                    },
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (_, __) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(l10n.failedToLoadStops),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildOfficialNotes(l10n),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          l10n.viewProof,
                          Icons.picture_as_pdf_rounded,
                          AppColors.primary,
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
                          Icons.open_in_new_rounded,
                          AppColors.onSurfaceVariant,
                              () async {
                            if (fare.btrcUrl != null) {
                              final uri = Uri.parse(fare.btrcUrl!);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
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
    );
  }

  Widget _buildOfficialTopHeader(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.fareRatePrefix} ${fare.baseRate} ${l10n.taka}',
          style: AppTextStyles.label.copyWith(
            fontSize: 14,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${l10n.routeDistancePrefix} ${fare.routeTotalDistance} ${l10n.kilometerSuffix}',
          style: AppTextStyles.label.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 12),
        Text(
          fare.routeNameBn,
          style: AppTextStyles.banglaName.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildJourneyTimeline(String originName, String destinationName, AppLocalizations l10n) {
    return Row(
      children: [
        const Icon(Icons.radio_button_checked, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.journeyStart,
                style: AppTextStyles.caption.copyWith(fontSize: 10),
              ),
              Text(
                originName,
                style: AppTextStyles.label.copyWith(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.arrow_forward, size: 16, color: AppColors.outline),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                l10n.destination,
                style: AppTextStyles.caption.copyWith(fontSize: 10),
              ),
              Text(
                destinationName,
                style: AppTextStyles.label.copyWith(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.location_on, size: 20, color: AppColors.error),
      ],
    );
  }

  Widget _buildCompactRow(String label, String value, {bool isPrimary = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.caption.copyWith(fontSize: 14)),
        Text(
          value,
          style: isPrimary
              ? AppTextStyles.priceHero.copyWith(fontSize: 36)
              : AppTextStyles.label.copyWith(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildMiniStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.caption.copyWith(fontSize: 11)),
        const SizedBox(height: 2),
        Text(value, style: AppTextStyles.label.copyWith(fontSize: 13)),
      ],
    );
  }

  Widget _buildOfficialNotes(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${l10n.noteMinFarePrefix} ${fare.minFare.toInt()}${l10n.noteMinFareSuffix}',
            style: const TextStyle(fontSize: 12, height: 1.5, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.noteGas,
            style: const TextStyle(fontSize: 12, height: 1.5, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color, VoidCallback onTap) {
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
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
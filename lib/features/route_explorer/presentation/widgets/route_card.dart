import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bus_route/bus_route.dart';

class RouteCard extends StatelessWidget {
  final BusRoute route;
  final bool isClickable;

  const RouteCard({
    super.key,
    required this.route,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return InkWell(
      onTap: isClickable
          ? () {
        context.push('${AppRoutes.routeDetails}/${route.id}?code=${route.routeCode}');
      }
          : null,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildRouteBadge(route.routeCode),
                const Spacer(),
                const Icon(Icons.picture_as_pdf, size: 14, color: AppColors.onSurfaceVariant),
                const SizedBox(width: 4),
                Text(
                  '${l10n.gazzette}: ${l10n.page} ${route.pdfPageNumber ?? '-'}',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(route.nameBn, style: AppTextStyles.banglaName),
            const SizedBox(height: 4),
            Text(
              route.region.toUpperCase(),
              style: AppTextStyles.caption.copyWith(
                letterSpacing: 1.2,
                color: AppColors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                  '${route.totalDistanceKm} ${l10n.km.toUpperCase()}',
                  l10n.totalDistance.toUpperCase(),
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                _buildInfoColumn(
                  '${route.totalStops}',
                  l10n.totalStops.toUpperCase(),
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                _buildInfoColumn(
                  '${l10n.currencySign}${route.minimumFare ?? 10}',
                  l10n.minFare.toUpperCase(),
                  crossAxisAlignment: CrossAxisAlignment.end,
                  isPrice: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
      String value,
      String label, {
        required CrossAxisAlignment crossAxisAlignment,
        bool isPrice = false,
      }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          value,
          style: isPrice
              ? AppTextStyles.priceHero.copyWith(fontSize: 18)
              : AppTextStyles.label,
        ),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(fontSize: 8),
        ),
      ],
    );
  }

  Widget _buildRouteBadge(String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accentYellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: AppTextStyles.label.copyWith(
          color: AppColors.onTertiaryFixed,
          fontSize: 14,
        ),
      ),
    );
  }
}
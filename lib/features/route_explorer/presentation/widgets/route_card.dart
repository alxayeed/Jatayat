import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/bus_route/bus_route.dart';

class RouteCard extends StatelessWidget {
  final BusRoute route;
  final bool isClickable;

  const RouteCard({super.key, required this.route, this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return InkWell(
      onTap: isClickable
          ? () {
              context.push(
                '${AppRoutes.routeDetails}/${route.id}?code=${route.routeCode}',
              );
            }
          : null,
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
                _buildRouteBadge(route.routeCode, theme),
                const Spacer(),
                Icon(
                  Icons.picture_as_pdf,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '${l10n.gazzette}: ${l10n.page} ${route.pdfPageNumber ?? '-'}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              l10n.localeName == 'bn' ? route.nameBn : (route.nameEn ?? route.nameBn),
              style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: l10n.localeName == 'bn' ? 'HindSiliguri' : null,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              route.region.toUpperCase(),
              style: theme.textTheme.bodySmall?.copyWith(
                letterSpacing: 1.2,
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.7,
                ),
              ),
            ),
            Divider(height: 24, color: theme.dividerTheme.color),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(
                  '${route.totalDistanceKm} ${l10n.km.toUpperCase()}',
                  l10n.totalDistance.toUpperCase(),
                  theme,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                _buildInfoColumn(
                  '${route.totalStops}',
                  l10n.totalStops.toUpperCase(),
                  theme,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                _buildInfoColumn(
                  '${l10n.currencySign}${route.minimumFare ?? 10}',
                  l10n.minFare.toUpperCase(),
                  theme,
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
    String label,
    ThemeData theme, {
    required CrossAxisAlignment crossAxisAlignment,
    bool isPrice = false,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          value,
          style: isPrice
              ? theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                )
              : theme.textTheme.labelLarge,
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 8,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildRouteBadge(String code, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontSize: 14,
        ),
      ),
    );
  }
}

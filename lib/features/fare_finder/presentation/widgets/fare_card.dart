
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';


class FareCard extends StatelessWidget {
  final FareResultEntity fare;
  const FareCard({super.key, required this.fare});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.fareDetails, extra: fare);
      },
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
                _buildRouteBadge(fare.route.routeCode),
                const Spacer(),
                const Icon(Icons.picture_as_pdf, size: 14, color: AppColors.onSurfaceVariant),
                const SizedBox(width: 4),
                Text('Ref: Pg ${fare.route.pdfPage}', style: AppTextStyles.caption),
              ],
            ),
            const SizedBox(height: 12),
            Text(fare.route.nameBn, style: AppTextStyles.banglaName),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${fare.route.totalDistance} KM', style: AppTextStyles.label),
                    Text('TOTAL DISTANCE', style: AppTextStyles.caption.copyWith(fontSize: 8)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('৳${fare.officialFare.toInt()}', style: AppTextStyles.priceHero),
                    Text('Calculated: ৳${fare.calculatedFare.toStringAsFixed(1)}',
                        style: AppTextStyles.caption.copyWith(color: AppColors.primary)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
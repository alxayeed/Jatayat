import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';

class FareCard extends StatelessWidget {
  final FareResultEntity fare;

  const FareCard({
    super.key,
    required this.fare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF191D17).withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Route and Name Info
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRouteBadge(fare.route.routeCode),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fare.route.nameBn,
                            style: AppTextStyles.banglaName,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            'NON-AC SERVICE',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Price Info
              _buildPriceSection(fare.officialFare, fare.calculatedFare),
            ],
          ),
          const SizedBox(height: 16),
          // Status/Metadata Bar
          _buildStatusBar(),
        ],
      ),
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

  Widget _buildPriceSection(double official, double calculated) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '৳${official.toInt()}',
          style: AppTextStyles.priceHero,
        ),
        Text(
          'CALC: ${calculated.toStringAsFixed(2)}',
          style: AppTextStyles.caption.copyWith(fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildStatusBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'ARRIVING IN 4 MIN',
                style: AppTextStyles.label.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.group, size: 16, color: AppColors.onSurfaceVariant),
              SizedBox(width: 4),
              Text(
                '60% Full',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
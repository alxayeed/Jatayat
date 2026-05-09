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
    // Logic for calculated fare: distance * baseRate (min 10)
    final calculatedFare = (fare.travelDistanceKm * fare.baseRate).toStringAsFixed(2);
    final displayCalculated =  calculatedFare;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: InkWell(
        onTap: () => context.push(AppRoutes.fareDetails, extra: fare),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header: Route No & Gazette Page
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      // color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'রুট: ${fare.routeCode}',
                      style: TextStyle(
                        color: AppColors.primaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    'গ্যাজেট: পৃঃ ${fare.pdfPage ?? '-'}',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 2. Route Name (Crucial for multiple results)
              Text(
                fare.routeNameBn,
                style: AppTextStyles.label.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const Divider(height: 24),

              // 3. Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('ভ্রমণ দূরত্ব', '${fare.travelDistanceKm} কি.মি.'),

                  // Calculated Fare (Transparent Logic)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('৳$displayCalculated',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.outline)
                      ),
                      const Text('হিসাবকৃত', style: TextStyle(fontSize: 10, color: AppColors.outline)),
                    ],
                  ),

                  // Official Fare (The Hero Data)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '৳${fare.fareAmount.toInt()}',
                        style: AppTextStyles.priceHero.copyWith(fontSize: 26, color: AppColors.primary),
                      ),
                      const Text('নির্ধারিত ভাড়া', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.outline)),
      ],
    );
  }
}
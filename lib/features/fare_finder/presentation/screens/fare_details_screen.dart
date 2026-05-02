import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entities/fair_result_entity/fare_result_entity.dart';

class FareDetailsScreen extends StatelessWidget {
  final FareResultEntity fare;

  const FareDetailsScreen({super.key, required this.fare});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(
            title: 'ভাড়ার বিস্তারিত',
            showProfile: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildOfficialTopHeader(),
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
                        _buildJourneyTimeline(),
                        const Divider(height: 40, thickness: 0.5),
                        _buildCompactRow(
                          'নির্ধারিত ভাড়া',
                          '৳${fare.officialFare.toInt()}',
                          isPrimary: true,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildMiniStat('ভ্রমণ দূরত্ব', '${fare.distance.toStringAsFixed(1)} কি.মি.'),
                            _buildMiniStat('রুট কোড', fare.route.routeCode),
                            _buildMiniStat('রেফারেন্স', 'পৃষ্ঠা ${fare.route.pdfPage}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildOfficialNotes(),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          'প্রমাণ দেখুন',
                          Icons.picture_as_pdf_rounded,
                          AppColors.primary,
                              () => context.push(AppRoutes.pdfViewer, extra: {
                            'url': fare.route.pdfUrl,
                            'page': fare.route.pdfPage,
                            'title': '${fare.route.routeCode} - ভাড়ার তালিকা',
                          }),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildActionButton(
                          'বিআরটিএ লিঙ্ক',
                          Icons.open_in_new_rounded,
                          AppColors.onSurfaceVariant,
                              () {},
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

  Widget _buildOfficialTopHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ভাড়ার হার : প্রতি যাত্রী প্রতি কিলোমিটার ${fare.route.baseRate} টাকা',
          style: AppTextStyles.label.copyWith(
            fontSize: 14,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'রুটের মোট দূরত্ব ${fare.route.totalDistance} কিলোমিটার।',
          style: AppTextStyles.label.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 12),
        Text(
          fare.route.nameBn,
          style: AppTextStyles.banglaName.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildJourneyTimeline() {
    return Row(
      children: [
        const Icon(Icons.radio_button_checked, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('যাত্রা শুরু', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              Text(
                fare.originName,
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
              Text('গন্তব্য', style: AppTextStyles.caption.copyWith(fontSize: 10)),
              Text(
                fare.destinationName,
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

  Widget _buildOfficialNotes() {
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
            'বিঃ দ্রঃ (০১) সর্বনিম্ন ভাড়া ${fare.route.minFare}.০০ টাকা হিসাব করে অত্র চার্ট প্রস্তুত করা হয়েছে। তাই উপরোক্ত ভাড়ার সাথে আর কোন অর্থ যোগ করে ভাড়া দাবী করা যাবে না।',
            style: const TextStyle(fontSize: 12, height: 1.5, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Text(
            '(০২) এ ভাড়ার হার গ্যাস চালিত যানবাহনের ক্ষেত্রে প্রযোজ্য হবে না।',
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
            Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
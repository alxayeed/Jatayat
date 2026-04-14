import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/fare_search_provider.dart';
import '../states/fare_search_state.dart';
import '../widgets/fare_card.dart';
import '../widgets/swap_button.dart';


class FareFinderScreen extends ConsumerStatefulWidget {
  const FareFinderScreen({super.key});

  @override
  ConsumerState<FareFinderScreen> createState() => _FareFinderPageState();
}

class _FareFinderPageState extends ConsumerState<FareFinderScreen> {
  final originController = TextEditingController();
  final destinationController = TextEditingController();

  @override
  void dispose() {
    originController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fareSearchProvider);
    final notifier = ref.read(fareSearchProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CustomAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Where to?', style: AppTextStyles.headline),
                      const Text(
                        'Find fares across Dhaka City',
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildSearchCard(state, notifier),
                      const SizedBox(height: 32),
                      if (state.fareResults.isNotEmpty) _buildResultHeader(state),
                    ],
                  ),
                ),
              ),
              _buildFareResults(state),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
    );
  }


  Widget _buildSearchCard(FareSearchState state, FareSearchNotifier notifier) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  AppTextField(
                    label: 'From',
                    hintText: 'Search starting point...',
                    prefixIcon: Icons.my_location,
                    controller: originController,
                    onChanged: notifier.searchOrigin,
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    label: 'To',
                    hintText: 'Search destination...',
                    prefixIcon: Icons.location_on,
                    controller: destinationController,
                    readOnly: state.selectedOrigin == null,
                  ),
                ],
              ),
              // The Pixel-Perfect Overlap Swap Button
              Positioned(
                top: 85, // Adjust this based on your field height
                right: 20,
                child: SwapButton(onPressed: () {}),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {}, // Trigger GetFares logic
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, size: 20),
                SizedBox(width: 8),
                Text('Calculate Fare'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultHeader(FareSearchState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Available Routes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('${state.fareResults.length} Results', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFareResults(FareSearchState state) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) => FareCard(fare: state.fareResults[index]),
          childCount: state.fareResults.length,
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.tertiaryFixed,
        child: const Icon(Icons.bolt, color: AppColors.onTertiaryFixed),
      ),
    );
  }

}




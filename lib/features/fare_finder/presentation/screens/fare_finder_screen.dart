import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/custom_app_bar.dart';

import '../../domain/entities/stop_entity/stop_entity.dart';
import '../providers/fare_search_provider.dart';
import '../states/fare_search_state.dart';
import '../widgets/fare_card.dart';
import '../widgets/swap_button.dart';
import '../widgets/app_suggestion_list.dart';

class FareFinderScreen extends ConsumerStatefulWidget {
  const FareFinderScreen({super.key});

  @override
  ConsumerState<FareFinderScreen> createState() => _FareFinderPageState();
}

class _FareFinderPageState extends ConsumerState<FareFinderScreen> {
  final originController = TextEditingController();
  final destinationController = TextEditingController();

  bool _isCollapsed = false;
  // Track if user manually requested to see the search boxes again
  bool _manuallyExpanded = false;

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

    ref.listen<FareSearchState>(fareSearchProvider, (previous, next) {
      if (previous?.selectedDestination != null && next.selectedDestination == null) {
        destinationController.clear();
      }
    });

    if (state.fareResults.isNotEmpty && !_isCollapsed && !state.isLoading && !_manuallyExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _isCollapsed = true);
      });
    }


    if (state.isLoading || state.fareResults.isEmpty) {
      if (_manuallyExpanded) {
        _manuallyExpanded = false;
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const CustomAppBar(title: AppStrings.appName, showProfile: false,),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Where to?', style: AppTextStyles.priceHero),
                      const Text(
                        'Find fares across Dhaka City',
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(sizeFactor: animation, child: child),
                          );
                        },
                        child: _isCollapsed
                            ? _buildCollapsedSummary(state)
                            : _buildSearchCard(state, notifier),
                      ),

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
      // floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildCollapsedSummary(FareSearchState state) {
    return Container(
      key: const ValueKey('summary_view'),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.directions_bus_filled_outlined, color: AppColors.primary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '${state.selectedOrigin?.nameBn ?? ""} হতে ${state.selectedDestination?.nameBn ?? ""}',
              style: AppTextStyles.label.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _isCollapsed = false;
                _manuallyExpanded = true; // Block auto-collapse
              });
            },
            icon: const Icon(Icons.edit_note_rounded, size: 20),
            label: const Text('পরিবর্তন'),
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              foregroundColor: AppColors.primary,
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard(FareSearchState state, FareSearchNotifier notifier) {
    final isSearching = state.originSuggestions.isNotEmpty || state.destinationSuggestions.isNotEmpty;

    return Container(
      key: const ValueKey('search_card_view'),
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
                  if (state.originSuggestions.isNotEmpty)
                    AppSuggestionList(
                      suggestions: state.originSuggestions,
                      onSelected: (stop) {
                        originController.text = stop.nameBn;
                        notifier.selectOrigin(stop);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  const SizedBox(height: 12),
                  AppTextField(
                    label: 'To',
                    hintText: 'Search destination...',
                    prefixIcon: Icons.location_on,
                    controller: destinationController,
                    readOnly: state.selectedOrigin == null,

                    // 1. Trigger search when they type
                    onChanged: notifier.searchDestination,

                    // 2. Trigger the list to reappear when they just tap the box
                    onTap: () {
                      if (state.selectedOrigin != null) {
                        // Pass the current text to bring back the list based on what's already typed
                        notifier.searchDestination(destinationController.text);
                      }
                    },

                    // Optional but highly recommended UX: A clear button
                    suffixIcon: destinationController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: () {
                        destinationController.clear();
                        notifier.searchDestination(''); // Reset the list
                        notifier.selectDestination(StopEntity(id: '', nameBn: '')); // Clear selected state if needed
                      },
                    )
                        : null,
                  ),
                  if (state.destinationSuggestions.isNotEmpty)
                    AppSuggestionList(
                      suggestions: state.destinationSuggestions,
                      onSelected: (stop) {
                        destinationController.text = stop.nameBn;
                        notifier.selectDestination(stop);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                ],
              ),
              if (!isSearching)
                Positioned(
                  top: 85,
                  right: 20,
                  child: SwapButton(
                    onPressed: () {
                      notifier.swapStations();
                      final temp = originController.text;
                      originController.text = destinationController.text;
                      destinationController.text = temp;
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: AppColors.error, fontWeight: FontWeight.w600, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ElevatedButton(
            onPressed: () {
              // When user clicks calculate, we allow auto-collapse again
              setState(() => _manuallyExpanded = false);
              notifier.calculateFare();
            },
            child: state.isLoading
                ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
                : const Row(
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
        Text('${state.fareResults.length} Results',
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
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

}
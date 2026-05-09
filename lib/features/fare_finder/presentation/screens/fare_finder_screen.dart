import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';


import '../../../../core/ui/widgets/app_text_field.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
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
  bool _manuallyExpanded = false;

  @override
  void dispose() {
    originController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
              const CustomAppBar(title: AppStrings.appName),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.homeTitle, style: AppTextStyles.priceHero),
                      Text(
                        l10n.homeSubtitle,
                        style: const TextStyle(
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
                            ? _buildCollapsedSummary(state, l10n)
                            : _buildSearchCard(state, notifier, l10n),
                      ),

                      const SizedBox(height: 32),
                      if (state.fareResults.isNotEmpty) _buildResultHeader(state, l10n),
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
    );
  }

  Widget _buildCollapsedSummary(FareSearchState state, AppLocalizations l10n) {
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
              '${state.selectedOrigin?.nameBn ?? ""} ${l10n.fromStop} ${state.selectedDestination?.nameBn ?? ""}',
              style: AppTextStyles.label.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _isCollapsed = false;
                _manuallyExpanded = true;
              });
            },
            icon: const Icon(Icons.edit_note_rounded, size: 20),
            label: Text(l10n.fareSearchChange),
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

  Widget _buildSearchCard(FareSearchState state, FareSearchNotifier notifier, AppLocalizations l10n) {
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
                    label: l10n.fromStop,
                    hintText: l10n.fromStop,
                    prefixIcon: Icons.my_location,
                    controller: originController,
                    onChanged: notifier.searchOrigin,
                  ),
                  if (state.originSuggestions.isNotEmpty)
                    AppSuggestionList(
                      suggestions: state.originSuggestions,
                      onSelected: (stop) {
                        originController.text = stop.nameEn ?? "Unknown for ${stop.nameBn}";
                        notifier.selectOrigin(stop, noRoutesError: l10n.stopsSearchErrorMessage);
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  const SizedBox(height: 12),
                  AppTextField(
                    label: l10n.toStop,
                    hintText: l10n.toStop,
                    prefixIcon: Icons.location_on,
                    controller: destinationController,
                    readOnly: state.selectedOrigin == null,
                    onChanged: notifier.searchDestination,
                    onTap: () {
                      if (state.selectedOrigin != null) {
                        notifier.searchDestination(destinationController.text);
                      }
                    },
                    suffixIcon: destinationController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: () {
                        destinationController.clear();
                        notifier.searchDestination('');
                        notifier.selectDestination(StopEntity(id: '', nameBn: ''));
                      },
                    )
                        : null,
                  ),
                  if (state.destinationSuggestions.isNotEmpty)
                    AppSuggestionList(
                      suggestions: state.destinationSuggestions,
                      onSelected: (stop) {
                        destinationController.text = stop.nameEn ?? "Unknown for ${stop.nameBn}";
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
              setState(() => _manuallyExpanded = false);
              notifier.calculateFare(
                noSelectionError: l10n.calculatedFareErrorMessage,
                noResultsError: l10n.fareSearchErrorMessage,
              );
            },
            child: state.isLoading
                ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search, size: 20),
                const SizedBox(width: 8),
                Text(l10n.findBus),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultHeader(FareSearchState state, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l10n.allRoutes, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
        '${state.fareResults.length} ${l10n.results}',
          style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
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
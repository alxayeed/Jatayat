import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/ad_provider.dart';
import '../../../../core/ui/widgets/app_native_ad_card.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/ui/widgets/app_text_field.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';
import '../providers/fare_search_provider.dart';
import '../states/fare_search_state.dart';
import '../widgets/app_suggestion_list.dart';
import '../widgets/fare_card.dart';

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
    final theme = Theme.of(context);
    final isBn = l10n.localeName == 'bn';

    ref.listen<FareSearchState>(fareSearchProvider, (previous, next) {
      if (previous?.selectedDestination != null &&
          next.selectedDestination == null) {
        destinationController.clear();
      }
    });

    if (state.fareResults.isNotEmpty &&
        !_isCollapsed &&
        !state.isLoading &&
        !_manuallyExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _isCollapsed = true);
      });
    }

    if (state.isLoading || state.fareResults.isEmpty) {
      if (_manuallyExpanded) {
        _manuallyExpanded = false;
      }
    }

    // Idle state check: No active loading, no results, and no open autocomplete suggestion drop-downs
    final bool isIdleState =
        !state.isLoading &&
        state.fareResults.isEmpty &&
        state.originSuggestions.isEmpty &&
        state.destinationSuggestions.isEmpty;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(title: AppStrings.appName),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeTitle,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    l10n.homeSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              child: child,
                            ),
                          );
                        },
                    child: _isCollapsed
                        ? _buildCollapsedSummary(state, l10n, theme, isBn)
                        : _buildSearchCard(state, notifier, l10n, theme, isBn),
                  ),
                  const SizedBox(height: 32),
                  if (state.fareResults.isNotEmpty)
                    _buildResultHeader(state, l10n, theme),
                ],
              ),
            ),
          ),
          _buildFareResults(state),

          // Show the disclaimer card dynamically at the bottom if the view is idle
          if (isIdleState)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 24.0,
                  top: 12.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_buildGovernmentDisclaimer(l10n, theme)],
                ),
              ),
            )
          else
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildGovernmentDisclaimer(AppLocalizations l10n, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.gavel_outlined,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.localeName == 'bn' ? 'আইনি নোটিশ' : 'Legal Disclaimer',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.governmentDisclaimer,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 11,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedSummary(
    FareSearchState state,
    AppLocalizations l10n,
    ThemeData theme,
    bool isBn,
  ) {
    final originName = isBn
        ? state.selectedOrigin?.nameBn
        : (state.selectedOrigin?.nameEn ?? state.selectedOrigin?.nameBn);
    final destinationName = isBn
        ? state.selectedDestination?.nameBn
        : (state.selectedDestination?.nameEn ??
              state.selectedDestination?.nameBn);

    return Container(
      key: const ValueKey('summary_view'),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_bus_filled_outlined,
            color: theme.colorScheme.primary,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$originName ➤ $destinationName',
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              setState(() {
                _isCollapsed = false;
                _manuallyExpanded = true;
              });
            },
            icon: const Icon(Icons.edit_note_rounded),
            color: theme.colorScheme.primary,
            visualDensity: VisualDensity.compact,
            tooltip: l10n.fareSearchChange,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard(
    FareSearchState state,
    FareSearchNotifier notifier,
    AppLocalizations l10n,
    ThemeData theme,
    bool isBn,
  ) {
    return Container(
      key: const ValueKey('search_card_view'),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Column(
            children: [
              AppTextField(
                hintText: l10n.fromStop,
                prefixIcon: Icons.my_location,
                controller: originController,
                onChanged: notifier.searchOrigin,
              ),
              if (state.originSuggestions.isNotEmpty)
                AppSuggestionList(
                  suggestions: state.originSuggestions,
                  onSelected: (stop) {
                    originController.text = isBn
                        ? stop.nameBn
                        : (stop.nameEn ?? stop.nameBn);
                    notifier.selectOrigin(
                      stop,
                      noRoutesError: l10n.stopsSearchErrorMessage,
                    );
                    FocusScope.of(context).unfocus();
                  },
                ),
              const SizedBox(height: 12),
              AppTextField(
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
                          notifier.selectDestination(
                            StopEntity(id: '', nameBn: ''),
                          );
                        },
                      )
                    : null,
              ),
              if (state.destinationSuggestions.isNotEmpty)
                AppSuggestionList(
                  suggestions: state.destinationSuggestions,
                  onSelected: (stop) {
                    destinationController.text = isBn
                        ? stop.nameBn
                        : (stop.nameEn ?? stop.nameBn);
                    notifier.selectDestination(stop);
                    FocusScope.of(context).unfocus();
                  },
                ),
            ],
          ),
          const SizedBox(height: 24),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                state.errorMessage!,
                style: TextStyle(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
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
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.onPrimary,
                    ),
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

  Widget _buildResultHeader(
    FareSearchState state,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.allRoutes,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${state.fareResults.length} ${l10n.results}',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFareResults(FareSearchState state) {
    final adService = ref.watch(adServiceProvider);
    final results = state.fareResults;
    final bool showAds = adService.areAdsEnabled;
    final bool hasAdSlot = showAds && results.isNotEmpty;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (hasAdSlot) {
              final int adIndex = results.length > 4 ? 3 : results.length;
              if (index == adIndex) {
                return const AppNativeAdCard();
              }
              final dataIndex = index > adIndex ? index - 1 : index;
              return FareCard(fare: results[dataIndex]);
            }
            return FareCard(fare: results[index]);
          },
          childCount: results.length + (hasAdSlot ? 1 : 0),
        ),
      ),
    );
  }
}

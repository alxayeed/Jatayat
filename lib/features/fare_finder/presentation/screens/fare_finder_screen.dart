import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/transit_region.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/providers/settings_provider.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';
import '../providers/fare_search_provider.dart';
import '../states/fare_search_state.dart';
import '../widgets/app_searchable_dropdown.dart';
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
  void deactivate() {
    final notifier = ref.read(fareSearchProvider.notifier);
    Future.microtask(() {
      notifier.clearSuggestions();
    });
    super.deactivate();
  }

  @override
  void dispose() {
    originController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final banglaL10n = lookupAppLocalizations(const Locale('bn'));
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

    ref.listen(settingsProvider.select((s) => s.locale), (previous, next) {
      if (previous != next && next != null) {
        final isBn = next.languageCode == 'bn';
        final currentState = ref.read(fareSearchProvider);
        if (currentState.selectedOrigin != null) {
          originController.text = isBn
              ? currentState.selectedOrigin!.nameBn
              : (currentState.selectedOrigin!.nameEn ??
                    currentState.selectedOrigin!.nameBn);
        }
        if (currentState.selectedDestination != null) {
          destinationController.text = isBn
              ? currentState.selectedDestination!.nameBn
              : (currentState.selectedDestination!.nameEn ??
                    currentState.selectedDestination!.nameBn);
        }
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        notifier.closeOriginDropdown();
        notifier.closeDestinationDropdown();
      },
      child: Scaffold(
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
                          ? _buildCollapsedSummary(
                              state,
                              notifier,
                              l10n,
                              theme,
                              isBn,
                            )
                          : _buildSearchCard(
                              state,
                              notifier,
                              l10n,
                              theme,
                              isBn,
                            ),
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
                    children: [_buildGovernmentDisclaimer(banglaL10n, theme)],
                  ),
                ),
              )
            else
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
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
                l10n.disclaimerHeader,
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
    FareSearchNotifier notifier,
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
                _manuallyExpanded = false;
              });
              originController.clear();
              destinationController.clear();
              notifier.resetSearch();
            },
            icon: const Icon(Icons.delete_outline_rounded),
            color: theme.colorScheme.error,
            visualDensity: VisualDensity.compact,
            tooltip: isBn ? 'সার্চ মুছুন' : 'Clear Search',
          ),
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
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChoiceChip(
                  label: Text(l10n.regionDhaka),
                  selected: state.selectedRegion == TransitRegion.dhakaMetro,
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: state.selectedRegion == TransitRegion.dhakaMetro
                        ? FontWeight.bold
                        : FontWeight.w600,
                    color: state.selectedRegion == TransitRegion.dhakaMetro
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                  selectedColor: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 0,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                    horizontal: -2,
                    vertical: -4,
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: state.selectedRegion == TransitRegion.dhakaMetro
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      notifier.selectRegion(TransitRegion.dhakaMetro);
                      originController.clear();
                      destinationController.clear();
                    }
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text(l10n.regionChittagong),
                  selected: state.selectedRegion == TransitRegion.ctgMetro,
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: state.selectedRegion == TransitRegion.ctgMetro
                        ? FontWeight.bold
                        : FontWeight.w600,
                    color: state.selectedRegion == TransitRegion.ctgMetro
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
                  selectedColor: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 0,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                    horizontal: -2,
                    vertical: -4,
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: state.selectedRegion == TransitRegion.ctgMetro
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      notifier.selectRegion(TransitRegion.ctgMetro);
                      originController.clear();
                      destinationController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              AppSearchableDropdown(
                hintText: l10n.fromStop,
                prefixIcon: Icons.my_location,
                controller: originController,
                isOpen: state.isOriginDropdownOpen,
                isLoading: state.isLoading,
                suggestions: state.originSuggestions,
                onChanged: notifier.searchOrigin,
                onTap: notifier.openOriginDropdown,
                onSelected: (stop) {
                  originController.text = isBn
                      ? stop.nameBn
                      : (stop.nameEn ?? stop.nameBn);
                  notifier.selectOrigin(
                    stop,
                    noRoutesError: l10n.stopsSearchErrorMessage,
                  );
                },
                onClear: () {
                  originController.clear();
                  destinationController.clear();
                  notifier.resetSearch();
                },
              ),
              const SizedBox(height: 12),
              AppSearchableDropdown(
                hintText: l10n.toStop,
                prefixIcon: Icons.location_on,
                controller: destinationController,
                readOnly: state.selectedOrigin == null,
                isOpen: state.isDestinationDropdownOpen,
                isLoading: state.isDestinationsLoading,
                errorMessage: state.errorMessage,
                suggestions: state.destinationSuggestions,
                onChanged: notifier.searchDestination,
                onTap: () {
                  if (state.selectedOrigin != null) {
                    notifier.openDestinationDropdown();
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isBn
                              ? 'অনুগ্রহ করে প্রথমে যাত্রা শুরুর স্থান নির্বাচন করুন'
                              : 'Please select the starting point first',
                          style: TextStyle(
                            fontFamily: isBn ? 'HindSiliguri' : null,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        backgroundColor: theme.colorScheme.errorContainer,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }
                },
                onSelected: (stop) {
                  destinationController.text = isBn
                      ? stop.nameBn
                      : (stop.nameEn ?? stop.nameBn);
                  notifier.selectDestination(stop);
                },
                onClear: () {
                  destinationController.clear();
                  notifier.searchDestination('');
                  notifier.selectDestination(StopEntity(id: '', nameBn: ''));
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() => _manuallyExpanded = false);
              notifier.calculateFare(
                noSelectionError: l10n.calculatedFareErrorMessage,
                noResultsError: l10n.fareSearchErrorMessage,
                loadingStopsError: l10n.loadingStopsError,
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

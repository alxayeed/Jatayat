import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../features/route_explorer/presentation/widgets/route_stop_item.dart';

class RouteTimeline extends StatelessWidget {
  final List<dynamic> stops; // Works with both RouteStop and StopEntity
  final String? startStopId;
  final String? endStopId;

  const RouteTimeline({
    super.key,
    required this.stops,
    this.startStopId,
    this.endStopId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isBn = l10n.localeName == 'bn';

    // Logic to determine range
    final int startIndex = startStopId != null
        ? stops.indexWhere((s) => s.stopId == startStopId)
        : 0;
    final int endIndex = endStopId != null
        ? stops.indexWhere((s) => s.stopId == endStopId)
        : stops.length - 1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: stops.length,
        itemBuilder: (context, index) {
          final stop = stops[index];

          // Determine if this specific index is within the travel path
          bool isSelected = false;
          if (startIndex != -1 && endIndex != -1) {
            // Handles both forward and reverse directions
            if (startIndex <= endIndex) {
              isSelected = index >= startIndex && index <= endIndex;
            } else {
              isSelected = index >= endIndex && index <= startIndex;
            }
          }

          final bool isStartOrEnd =
              stop.stopId == startStopId || stop.stopId == endStopId;
          final bool isEdge = index == 0 || index == stops.length - 1;

          return RouteStopItem(
            stopName: isBn ? stop.nameBn : (stop.nameEn ?? stop.nameBn),
            isFirst: index == 0,
            isLast: index == stops.length - 1,
            isSelected: isSelected,
            // Highlight if it's the user's start/end OR the terminal stops of the route
            isSpecial: startStopId != null ? isStartOrEnd : isEdge,
          );
        },
      ),
    );
  }
}

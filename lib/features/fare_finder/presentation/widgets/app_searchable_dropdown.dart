import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../../../core/ui/widgets/app_text_field.dart';
import '../../domain/entities/stop_entity/stop_entity.dart';

class AppSearchableDropdown extends ConsumerStatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool readOnly;
  final bool isOpen;
  final bool isLoading;
  final List<StopEntity> suggestions;
  final Function(String) onChanged;
  final VoidCallback onTap;
  final Function(StopEntity) onSelected;
  final VoidCallback onClear;
  final String? errorMessage;
  final String? emptyMessage;

  const AppSearchableDropdown({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.readOnly = false,
    required this.isOpen,
    required this.isLoading,
    required this.suggestions,
    required this.onChanged,
    required this.onTap,
    required this.onSelected,
    required this.onClear,
    this.errorMessage,
    this.emptyMessage,
  });

  @override
  ConsumerState<AppSearchableDropdown> createState() =>
      _AppSearchableDropdownState();
}

class _AppSearchableDropdownState
    extends ConsumerState<AppSearchableDropdown> {
  final OverlayPortalController _portalController = OverlayPortalController();
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    if (widget.isOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _portalController.show();
      });
    }
  }

  @override
  void didUpdateWidget(covariant AppSearchableDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (widget.isOpen) {
          _portalController.show();
        } else {
          _portalController.hide();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: OverlayPortal(
        controller: _portalController,
        overlayChildBuilder: (context) {
          final currentLocale = ref.watch(settingsProvider).locale;
          final isBn = currentLocale.languageCode == 'bn';
          final renderBox = this.context.findRenderObject() as RenderBox?;
          final size = renderBox?.size ?? Size.zero;

          return Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 4),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 220),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _buildDropdownBody(context, theme, isBn),
                  ),
                ),
              ),
            ),
          );
        },
        child: AppTextField(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          controller: widget.controller,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          suffixIcon: (widget.isLoading && !widget.isOpen)
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                )
              : (widget.controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: widget.onClear,
                    )
                  : null),
        ),
      ),
    );
  }

  Widget _buildDropdownBody(BuildContext context, ThemeData theme, bool isBn) {
    if (widget.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              isBn ? 'স্টপেজ লোড হচ্ছে...' : 'Loading stops...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    if (widget.errorMessage != null && widget.errorMessage!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.error_outline, size: 18, color: theme.colorScheme.error),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.errorMessage!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (widget.suggestions.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            widget.emptyMessage ??
                (isBn ? 'কোনো স্টপেজ পাওয়া যায়নি' : 'No stops found'),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: widget.suggestions.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: theme.colorScheme.outlineVariant.withValues(alpha: 0.1),
      ),
      itemBuilder: (context, index) {
        final stop = widget.suggestions[index];
        final displayName = isBn
            ? (stop.nameBn ?? stop.nameEn)
            : (stop.nameEn ?? stop.nameBn);

        return ListTile(
          leading: Icon(
            Icons.history,
            size: 18,
            color: theme.colorScheme.outline,
          ),
          title: Text(
            displayName ?? "",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontFamily: isBn ? 'HindSiliguri' : null,
              fontSize: 16,
              color: theme.colorScheme.onSurface,
            ),
          ),
          trailing: Icon(
            Icons.north_west_rounded,
            size: 14,
            color: theme.colorScheme.outline,
          ),
          onTap: () => widget.onSelected(stop),
        );
      },
    );
  }
}

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ADDED

class CustomFeedbackSheet extends ConsumerStatefulWidget {
  final OnSubmit submit;

  const CustomFeedbackSheet({super.key, required this.submit});

  @override
  ConsumerState<CustomFeedbackSheet> createState() =>
      _CustomFeedbackSheetState();
}

class _CustomFeedbackSheetState extends ConsumerState<CustomFeedbackSheet> {
  // Updated to ConsumerState
  final TextEditingController _textController = TextEditingController();
  String _selectedCategory = 'bug';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 14, // Slightly reduced top padding
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send Feedback',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    final text = _textController.text.trim();
                    if (text.isEmpty) return;
                    widget.submit(text, extras: {'type': _selectedCategory});
                  },
                  icon: const Icon(Icons.send_rounded, size: 16),
                  label: const Text(
                    'Submit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Custom Compact Zero-Padding Segment Bar
            Row(
              children: [
                _buildCompactTab(
                  label: 'Bug Report',
                  icon: Icons.bug_report_outlined,
                  isSelected: _selectedCategory == 'bug',
                  theme: theme,
                  onTap: () => setState(() => _selectedCategory = 'bug'),
                ),
                const SizedBox(width: 8),
                _buildCompactTab(
                  label: 'Suggestion',
                  icon: Icons.lightbulb_outline_rounded,
                  isSelected: _selectedCategory == 'suggestion',
                  theme: theme,
                  onTap: () => setState(() => _selectedCategory = 'suggestion'),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Text Input Field
            TextField(
              controller: _textController,
              maxLines: 3,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: _selectedCategory == 'bug'
                    ? 'What went wrong? Tell us how to reproduce it...'
                    : 'What feature or improvement would you like to see?',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.5,
                  ),
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLow,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper builder for zero-padding, soft-colored category selectors
  Widget _buildCompactTab({
    required String label,
    required IconData icon,
    required bool isSelected,
    required ThemeData theme,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        // Ultra-tight zero-waste spacing
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary.withValues(
                  alpha: 0.12,
                ) // Soft theme blueprint selection instead of harsh red
              : theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

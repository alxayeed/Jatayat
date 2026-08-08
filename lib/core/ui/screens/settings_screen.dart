import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/settings_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../di/core_providers.dart';
import '../widgets/custom_app_bar.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(title: l10n.settings),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSettingsGroup(context, [
                    _buildOptionTile(
                      context,
                      icon: Icons.palette_outlined,
                      title: l10n.theme,
                      child: const _ThemeToggle(),
                    ),
                    _buildDivider(context),
                    _buildOptionTile(
                      context,
                      icon: Icons.language_outlined,
                      title: l10n.language,
                      child: const _LanguageToggle(),
                    ),
                  ], label: l10n.appearance),
                  const SizedBox(height: 24),
                  _buildSettingsGroup(context, [
                    _buildTappableTile(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      title: l10n.privacyPolicy,
                      onTap: () {},
                    ),
                    _buildDivider(context),
                    _buildTappableTile(
                      context,
                      icon: Icons.system_update_outlined,
                      title: l10n.checkForUpdates,
                      onTap: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(l10n.upToDate)));
                      },
                    ),
                    if (dotenv.env['ENABLE_LOCAL_DB_SYNC'] == 'true') ...[
                      _buildDivider(context),
                      _buildTappableTile(
                        context,
                        icon: Icons.sync_rounded,
                        title: 'Sync with DB',
                        onTap: () async {
                          // Show interactive loading modal indicator
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          try {
                            final syncService = ref.read(databaseSyncServiceProvider);
                            final synced = await syncService.checkAndSync();
                            if (context.mounted) {
                              Navigator.pop(context); // Dismiss loading dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    synced
                                        ? 'Local database synced successfully!'
                                        : 'Database is already up to date.',
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              Navigator.pop(context); // Dismiss loading dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Database sync failed: $e'),
                                  backgroundColor: cs.error,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ], label: l10n.general),
                  const SizedBox(height: 24),
                  _buildSettingsGroup(context, [
                    _buildInfoTile(
                      context,
                      icon: Icons.info_outline_rounded,
                      title: l10n.version,
                      value: '1.0.0',
                    ),
                    _buildDivider(context),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          _buildIconContainer(
                            context,
                            Icons.directions_bus_outlined,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              l10n.appDescription,
                              style: tt.bodySmall?.copyWith(
                                height: 1.5,
                                color: cs.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ], label: l10n.about),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup(
    BuildContext context,
    List<Widget> children, {
    required String label,
  }) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            label.toUpperCase(),
            style: tt.labelSmall?.copyWith(
              letterSpacing: 1.2,
              color: cs.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: cs.primary.withValues(alpha: 0.1)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildIconContainer(context, icon),
          const SizedBox(width: 16),
          Text(title, style: tt.titleSmall?.copyWith(color: cs.onSurface)),
          const Spacer(),
          child,
        ],
      ),
    );
  }

  Widget _buildTappableTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            _buildIconContainer(context, icon),
            const SizedBox(width: 16),
            Text(title, style: tt.titleSmall?.copyWith(color: cs.onSurface)),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: cs.onSurfaceVariant,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          _buildIconContainer(context, icon),
          const SizedBox(width: 16),
          Text(title, style: tt.titleSmall?.copyWith(color: cs.onSurface)),
          const Spacer(),
          Text(
            value,
            style: tt.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context, IconData icon) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark
            ? cs.surfaceContainerHigh
            : cs.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 20,
        color: isDark ? cs.onSurfaceVariant : cs.primary,
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Divider(
      height: 1,
      indent: 56,
      endIndent: 16,
      color: cs.outlineVariant.withValues(alpha: 0.4),
    );
  }
}

class _ThemeToggle extends ConsumerWidget {
  const _ThemeToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final themeMode = ref.watch(settingsProvider).themeMode;
    final notifier = ref.read(settingsProvider.notifier);

    final options = [
      (value: ThemeMode.light, icon: Icons.light_mode_outlined),
      (value: ThemeMode.dark, icon: Icons.dark_mode_outlined),
      (value: ThemeMode.system, icon: Icons.brightness_auto_outlined),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: options.map((opt) {
          final isSelected = themeMode == opt.value;
          return GestureDetector(
            onTap: () => notifier.setTheme(opt.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                opt.icon,
                size: 16,
                color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _LanguageToggle extends ConsumerWidget {
  const _LanguageToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final locale = ref.watch(settingsProvider).locale;
    final notifier = ref.read(settingsProvider.notifier);

    final options = [
      (value: const Locale('en'), label: l10n.langEnglish),
      (value: const Locale('bn'), label: l10n.langBangla),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: options.map((opt) {
          final isSelected = locale == opt.value;
          return GestureDetector(
            onTap: () => notifier.setLocale(opt.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                opt.label,
                style: tt.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

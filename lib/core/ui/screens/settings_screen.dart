import 'package:flutter/material.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(title: l10n.settings),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionLabel(l10n.appearance),
                  _buildSettingsGroup([
                    _buildOptionTile(
                      context,
                      icon: Icons.palette_outlined,
                      title: l10n.theme,
                      child: _ThemeToggle(),
                    ),
                    _buildDivider(),
                    _buildOptionTile(
                      context,
                      icon: Icons.language_outlined,
                      title: l10n.language,
                      child: _LanguageToggle(),
                    ),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionLabel(l10n.general),
                  _buildSettingsGroup([
                    _buildTappableTile(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      title: l10n.privacyPolicy,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildTappableTile(
                      context,
                      icon: Icons.system_update_outlined,
                      title: l10n.checkForUpdates,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l10n.upToDate),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        );
                      },
                    ),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionLabel(l10n.about),
                  _buildSettingsGroup([
                    _buildInfoTile(
                      context,
                      icon: Icons.info_outline_rounded,
                      title: l10n.version,
                      value: '1.0.0',
                    ),
                    _buildDivider(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.directions_bus_outlined,
                                size: 20, color: AppColors.primary),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              l10n.appDescription,
                              style: AppTextStyles.caption.copyWith(height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 10),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.caption.copyWith(
          fontSize: 11,
          letterSpacing: 1.2,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildOptionTile(BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Text(title, style: AppTextStyles.label.copyWith(fontSize: 15)),
          const Spacer(),
          child,
        ],
      ),
    );
  }

  Widget _buildTappableTile(BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Text(title, style: AppTextStyles.label.copyWith(fontSize: 15)),
            const Spacer(),
            const Icon(Icons.chevron_right_rounded, color: AppColors.onSurfaceVariant, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Text(title, style: AppTextStyles.label.copyWith(fontSize: 15)),
          const Spacer(),
          Text(value, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      indent: 56,
      endIndent: 16,
      color: AppColors.primary.withValues(alpha: 0.08),
    );
  }
}

// --- Theme Toggle ---
class _ThemeToggle extends StatefulWidget {
  @override
  State<_ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<_ThemeToggle> {
  String _selected = 'light';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final options = [
      (value: 'light', label: l10n.themeLight, icon: Icons.light_mode_outlined),
      (value: 'dark', label: l10n.themeDark, icon: Icons.dark_mode_outlined),
      (value: 'system', label: l10n.themeSystem, icon: Icons.brightness_auto_outlined),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: options.map((opt) {
          final isSelected = _selected == opt.value;
          return GestureDetector(
            onTap: () => setState(() => _selected = opt.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                opt.icon,
                size: 16,
                color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// --- Language Toggle ---
class _LanguageToggle extends StatefulWidget {
  @override
  State<_LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<_LanguageToggle> {
  String _selected = 'en';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final options = [
      (value: 'en', label: l10n.langEnglish),
      (value: 'bn', label: l10n.langBangla),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: options.map((opt) {
          final isSelected = _selected == opt.value;
          return GestureDetector(
            onTap: () => setState(() => _selected = opt.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                opt.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.onSurfaceVariant,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
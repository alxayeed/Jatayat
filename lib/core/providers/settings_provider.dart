// core/providers/settings_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/local_database.dart';

class SettingsState {
  final ThemeMode themeMode;
  final Locale locale;

  const SettingsState({
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('en'),
  });

  SettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  final LocalDatabase _db;

  SettingsNotifier(this._db, SettingsState initialState) : super(initialState);

  void setTheme(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _db.setSetting('theme_mode', themeModeToString(mode));
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
    _db.setSetting('locale', locale.languageCode);
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  static ThemeMode themeModeFromString(String? value) {
    switch (value) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      case 'light':
      default:
        return ThemeMode.light;
    }
  }

  static String themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
      case ThemeMode.light:
        return 'light';
    }
  }
}

/// Pre-loaded initial settings, populated in main() before runApp().
SettingsState _initialSettings = const SettingsState();

void setInitialSettings(SettingsState settings) {
  _initialSettings = settings;
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(LocalDatabase.instance, _initialSettings),
);

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/local_database.dart';
import '../services/upgrade_service.dart';

final upgradeServiceProvider = Provider<UpgradeService>((ref) {
  return UpgradeService();
});

final appUpgradeProvider = AsyncNotifierProvider<AppUpgradeNotifier, bool>(() {
  return AppUpgradeNotifier();
});

class AppUpgradeNotifier extends AsyncNotifier<bool> {
  static const String _dismissKey = 'last_update_dismissed_at';
  static const Duration _snoozeDuration = Duration(days: 2);

  @override
  Future<bool> build() async {
    final upgradeService = ref.read(upgradeServiceProvider);
    final bool needsUpdate = await upgradeService.shouldShowUpdate();

    if (!needsUpdate) return false;

    final String? dismissedAtStr = await LocalDatabase.instance.getSetting(
      _dismissKey,
    );
    if (dismissedAtStr != null) {
      final DateTime? dismissedAt = DateTime.tryParse(dismissedAtStr);
      if (dismissedAt != null) {
        final DateTime now = DateTime.now();

        // If 2 days haven't passed yet, hide the prompt by returning false
        if (now.difference(dismissedAt) < _snoozeDuration) {
          return false;
        }
      }
    }

    return true;
  }

  Future<void> snoozeUpdate() async {
    final String nowStr = DateTime.now().toIso8601String();
    await LocalDatabase.instance.setSetting(_dismissKey, nowStr);

    // Instantly switch state to false to tell MainScreen to hide the sheet
    state = const AsyncData(false);
  }

  Future<void> checkForUpdates() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final upgradeService = ref.read(upgradeServiceProvider);
      return upgradeService.shouldShowUpdate();
    });
  }
}

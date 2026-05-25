import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/upgrade_service.dart';

final upgradeServiceProvider = Provider<UpgradeService>((ref) {
  return UpgradeService();
});

final appUpgradeProvider = AsyncNotifierProvider<AppUpgradeNotifier, bool>(() {
  return AppUpgradeNotifier();
});

class AppUpgradeNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final upgradeService = ref.read(upgradeServiceProvider);
    return upgradeService.shouldShowUpdate();
  }

  Future<void> checkForUpdates() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final upgradeService = ref.read(upgradeServiceProvider);
      return upgradeService.shouldShowUpdate();
    });
  }
}

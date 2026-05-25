import 'dart:convert';
import 'dart:developer' as developer;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpgradeService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<bool> shouldShowUpdate() async {
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 0),
        ),
      );

      await _remoteConfig.fetchAndActivate();

      final jsonString = _remoteConfig.getString('app_version_config');
      if (jsonString.isEmpty) return false;

      final Map<String, dynamic> config = jsonDecode(jsonString);

      final bool isEnabled = config['is_enabled'] ?? false;
      if (!isEnabled) return false;

      final packageInfo = await PackageInfo.fromPlatform();
      final String localVersion = packageInfo.version;
      final int localBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;

      final String remoteLatestVersion = config['latest_version'] ?? '1.0.0';
      final int remoteMinBuildNumber = config['min_build_number'] ?? 0;

      final bool isVersionNewer = _isVersionNewer(
        localVersion,
        remoteLatestVersion,
      );
      final bool isBuildNumberNewer = remoteMinBuildNumber > localBuildNumber;

      return isVersionNewer || isBuildNumberNewer;
    } catch (e) {
      developer.log(
        'Error evaluating version upgrade constraints: $e',
        name: 'UpgradeService',
      );
      return false;
    }
  }

  bool _isVersionNewer(String current, String target) {
    if (current == target) return false;

    final currentParts = current
        .split('.')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();
    final targetParts = target
        .split('.')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    while (currentParts.length < 3) currentParts.add(0);
    while (targetParts.length < 3) targetParts.add(0);

    for (int i = 0; i < 3; i++) {
      if (targetParts[i] > currentParts[i]) return true;
      if (targetParts[i] < currentParts[i]) return false;
    }
    return false;
  }
}

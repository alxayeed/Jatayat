import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateBottomSheet extends StatelessWidget {
  const UpdateBottomSheet({super.key});

  /// Fires the external system intent to open the Jatayat Play Store listing page
  Future<void> _launchPlayStore() async {
    const String packageName = 'com.raindropstudio.jatayat';

    // Standard native market scheme protocol for Android devices
    final Uri marketUri = Uri.parse('market://details?id=$packageName');
    // Fallback web URL if the market scheme fails or for browser redirection
    final Uri webUri = Uri.parse(
      'https://play.google.com/store/apps/details?id=$packageName',
    );

    try {
      if (await canLaunchUrl(marketUri)) {
        await launchUrl(marketUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      developer.log(
        'Could not launch target update store link: $e',
        name: 'UpdateBottomSheet',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetches the primary color currently configured in your global MaterialApp theme
    final Color appPrimaryColor = Theme.of(context).primaryColor;

    return PopScope(
      canPop: false, // Prevents user from dismissing via the system back button
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Update Available',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'A new version of Jatayat is ready. Upgrade now to get the latest changes.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _launchPlayStore,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appPrimaryColor,
                        // Dynamically maps to your theme's primary color
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

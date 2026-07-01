import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/core/router/app_router.dart';

/// Top-level background message handler for FCM.
/// Must be annotated with `@pragma('vm:entry-point')` to run in a separate isolate.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Background message received: ${message.messageId}');
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Data: ${message.data}');
}

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  bool _isInitialized = false;

  /// Initializes push notifications.
  void initialize() {
    if (_isInitialized) return;

    // 1. Register foreground & interaction listeners immediately (Synchronously)
    // This ensures listeners are active even if permission requests or token fetching takes time.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground message received: ${message.messageId}');
      debugPrint('Title: ${message.notification?.title}');
      debugPrint('Body: ${message.notification?.body}');
      debugPrint('Data: ${message.data}');

      // Display custom in-app banner for foreground notifications
      final context = rootNavigatorKey.currentContext;
      if (context != null && context.mounted && message.notification != null) {
        _showInAppNotificationBanner(context, message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Notification clicked (App in background): ${message.messageId}');
      _handleNotificationClick(message);
    });

    // 2. Set background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 3. Handle initial message (from terminated state) asynchronously
    _fcm.getInitialMessage().then((initialMessage) {
      if (initialMessage != null) {
        debugPrint('Notification clicked (App opened from terminated state): ${initialMessage.messageId}');
        _handleNotificationClick(initialMessage);
      }
    }).catchError((e) {
      debugPrint('❌ Error getting initial message: $e');
    });

    // 4. Request permissions and retrieve token in the background without blocking the UI/main execution thread
    _requestPermissions();
    _retrieveFCMToken();

    _isInitialized = true;
    debugPrint('🔔 Push Notification Service fully initialized (listeners registered)');
  }

  /// Request permissions for iOS and Android 13+
  Future<void> _requestPermissions() async {
    try {
      final settings = await _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('🟢 User granted push notification permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        debugPrint('🟡 User granted provisional push notification permission');
      } else {
        debugPrint('🔴 User declined or has not accepted push notification permission');
      }
    } catch (e) {
      debugPrint('❌ Error requesting permissions: $e');
    }
  }

  /// Retrieve FCM registration token
  Future<void> _retrieveFCMToken() async {
    try {
      final token = await _fcm.getToken();
      if (token != null) {
        debugPrint('🔑 FCM Registration Token:');
        debugPrint(token);
      } else {
        debugPrint('⚠️ FCM Token is null');
      }
    } catch (e) {
      debugPrint('❌ Error retrieving FCM Token: $e');
    }
  }

  /// Displays a premium in-app notification banner sliding down from the top.
  void _showInAppNotificationBanner(BuildContext context, RemoteMessage message) {
    final notification = message.notification!;
    Timer? autoDismissTimer;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'InAppNotification',
      barrierColor: Colors.transparent, // Transparent background, no dimming
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (ctx, anim1, anim2) {
        
        // Auto dismiss after 4 seconds
        autoDismissTimer = Timer(const Duration(seconds: 4), () {
          if (ctx.mounted && Navigator.of(ctx).canPop()) {
            Navigator.of(ctx).pop();
          }
        });

        return SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  autoDismissTimer?.cancel();
                  if (ctx.mounted) {
                    Navigator.of(ctx).pop(); // Dismiss banner
                  }
                  _handleNotificationClick(message); // Perform click action
                },
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(
                        color: Theme.of(context).dividerColor.withValues(alpha: 0.08),
                        width: 1.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // A beautiful primary circular notification bell icon
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_active_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        // Title and Body
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.title ?? 'Notification',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notification.body ?? '',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                                      fontSize: 13,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Close Button
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            Icons.close_rounded,
                            color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.4),
                            size: 20,
                          ),
                          onPressed: () {
                            autoDismissTimer?.cancel();
                            if (ctx.mounted) {
                              Navigator.of(ctx).pop();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1.2),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutQuad)),
          child: child,
        );
      },
    );
  }

  /// Action callback when user taps a notification
  void _handleNotificationClick(RemoteMessage message) {
    debugPrint('Handling notification interaction...');
  }
}

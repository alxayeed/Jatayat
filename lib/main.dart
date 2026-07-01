import 'package:feedback_github/feedback_github.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/transit_region.dart';
import 'core/database/database_sync_service.dart';
import 'core/database/local_database.dart';
import 'core/providers/settings_provider.dart';
import 'core/router/app_router.dart';
import 'core/services/notification_service.dart';
import 'core/styles/app_theme.dart';
import 'core/utils/supabase_logger.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Determine flavor at compile-time (defaults to 'dev')
  const String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  final String envFile = flavor == 'prod' ? '.env.prod' : '.env.dev';

  try {
    // Load flavor-specific configuration
    await dotenv.load(fileName: envFile);
    debugPrint('🚀 Environment initialized successfully from: $envFile');

    await Firebase.initializeApp();
    NotificationService.instance.initialize();

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      debug: kDebugMode,
      httpClient: kDebugMode ? SupabaseLoggingClient() : null,
    );
  } catch (e) {
    debugPrint('Initialization failed for environment $envFile: $e');
  }

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  // Pre-initialize the local database (triggers migration if needed)
  final localDb = LocalDatabase.instance;
  await localDb.database;

  // Trigger background sync check asynchronously so we don't block the first frame layout
  DatabaseSyncService(supabase: Supabase.instance.client, localDB: localDb)
      .checkAndSync()
      .then((synced) {
        if (synced) {
          debugPrint(
            '🔄 Local-first database sync check completed with updates.',
          );
        } else {
          debugPrint(
            '✅ Local-first database sync check completed: Up-to-date.',
          );
        }
      })
      .catchError((e) {
        debugPrint('❌ Local-first database sync failed: $e');
      });

  // Load saved settings before first frame to prevent flash of defaults
  final savedTheme = await LocalDatabase.instance.getSetting('theme_mode');
  final savedLocale = await LocalDatabase.instance.getSetting('locale');
  final savedOnboarding = await LocalDatabase.instance.getSetting(
    'has_seen_onboarding',
  );
  final savedRegion = await LocalDatabase.instance.getSetting(
    'selected_region',
  );
  setInitialSettings(
    SettingsState(
      themeMode: SettingsNotifier.themeModeFromString(savedTheme),
      locale: savedLocale != null ? Locale(savedLocale) : const Locale('en'),
      hasSeenOnboarding: savedOnboarding == 'true',
      selectedRegion: TransitRegion.fromValue(savedRegion),
    ),
  );

  runApp(
    ProviderScope(
      child: GithubFeedback(
        config: FeedbackConfig(
          enabled: dotenv.env['SHOW_FEEDBACK_BUTTON'] == 'true',
          backend: GitHubFeedbackBackend(
            token: dotenv.env['GITHUB_TOKEN'] ?? '',
            repoOwner: 'alxayeed',
            repoName: 'Jatayat',
            branch: 'feature/feedback',
          ),
        ),
        child: const JatayatApp(),
      ),
    ),
  );
}

class JatayatApp extends ConsumerWidget {
  const JatayatApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: "Jatayat",
      debugShowCheckedModeBanner: false,
      routerConfig: router,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,

      locale: settings.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}

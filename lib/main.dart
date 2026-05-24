import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/database/local_database.dart';
import 'core/providers/settings_provider.dart';
import 'core/router/app_router.dart';
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

    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      debug: true,
      httpClient: SupabaseLoggingClient(),
    );
  } catch (e) {
    debugPrint('Initialization failed for environment $envFile: $e');
  }

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  // Pre-initialize the local database (triggers migration if needed)
  await LocalDatabase.instance.database;

  // Load saved settings before first frame to prevent flash of defaults
  final savedTheme = await LocalDatabase.instance.getSetting('theme_mode');
  final savedLocale = await LocalDatabase.instance.getSetting('locale');
  setInitialSettings(SettingsState(
    themeMode: SettingsNotifier.themeModeFromString(savedTheme),
    locale: savedLocale != null ? Locale(savedLocale) : const Locale('en'),
  ));

  runApp(const ProviderScope(child: JatayatApp()));
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

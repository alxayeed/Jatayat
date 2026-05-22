import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/providers/settings_provider.dart';
import 'core/router/app_router.dart';
import 'core/styles/app_theme.dart';
import 'core/ui/screens/custom_feedback_sheet.dart';
import 'core/utils/supabase_logger.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");

    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      debug: true,
      httpClient: SupabaseLoggingClient(),
    );
  } catch (e) {
    debugPrint('Initialization failed: $e');
  }

  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  runApp(
    const ProviderScope(
      child: BetterFeedback(
        feedbackBuilder: _customFeedbackBuilder,
        child: JatraApp(),
      ),
    ),
  );
}

class JatraApp extends ConsumerWidget {
  const JatraApp({super.key});

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

Widget _customFeedbackBuilder(
  BuildContext context,
  OnSubmit onSubmit,
  ScrollController? scrollController,
) {
  return CustomFeedbackSheet(submit: onSubmit);
}

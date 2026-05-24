import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../l10n/app_localizations.dart';

class AppErrorHandler {
  /// Maps a technical exception/error to a safe, user-friendly, localized message.
  static String getFriendlyMessage(Object error, AppLocalizations l10n) {
    if (error is SocketException) {
      return l10n.errorNetwork;
    }

    if (error is TimeoutException) {
      return l10n.errorTimeout;
    }

    if (error is PostgrestException) {
      final status = int.tryParse(error.code ?? '');
      if (status == 404 || error.message.toLowerCase().contains('not found')) {
        return l10n.errorNotFound;
      }
      if (status == 401 ||
          status == 403 ||
          error.message.toLowerCase().contains('unauthorized')) {
        return l10n.errorUnauthorized;
      }
      // Hide internal query details by returning a generic server error
      return l10n.errorServer;
    }

    if (error is HttpException) {
      return l10n.errorNetwork;
    }

    // Secondary pass: Check general exception message string indicators to capture standard HTTP status codes
    final errorString = error.toString().toLowerCase();
    if (errorString.contains('404')) {
      return l10n.errorNotFound;
    }
    if (errorString.contains('401') || errorString.contains('403')) {
      return l10n.errorUnauthorized;
    }
    if (errorString.contains('500') ||
        errorString.contains('502') ||
        errorString.contains('503')) {
      return l10n.errorServer;
    }

    // Default generic friendly error message
    return l10n.errorGeneric;
  }
}

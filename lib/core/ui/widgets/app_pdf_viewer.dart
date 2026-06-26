import 'dart:developer' as developer;
import 'dart:io';

import 'package:feedback_github/feedback_github.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../error/error_handler.dart';

class AppPdfViewer extends StatefulWidget {
  final String pdfUrl;
  final int initialPage;
  final String title;

  const AppPdfViewer({
    super.key,
    required this.pdfUrl,
    required this.initialPage,
    required this.title,
  });

  @override
  State<AppPdfViewer> createState() => _AppPdfViewerState();
}

class _AppPdfViewerState extends State<AppPdfViewer> {
  String? _localPath;
  bool _isLoading = true;
  Object? _error;

  // Controls tracking and state management
  int _totalPages = 0;
  int _currentPage = 0;
  bool _isReady = false;
  PDFViewController? _pdfViewController;

  @override
  void initState() {
    super.initState();
    // Native PDFView engine uses 0-based indexing (Page 1 = index 0)
    _currentPage = widget.initialPage - 1;
    _downloadAndSavePdf();
  }

  Future<void> _downloadAndSavePdf() async {
    try {
      final dir = await getTemporaryDirectory();
      // Extract file name cleanly while stripping bucket query parameters
      final filename = widget.pdfUrl.split('/').last.split('?').first;
      final file = File('${dir.path}/$filename');

      // Check if file is already cached locally
      if (await file.exists()) {
        final lastModified = await file.lastModified();
        final difference = DateTime.now().difference(lastModified);

        // If cached file is newer than 3 days, load it instantly!
        if (difference.inDays < 3) {
          developer.log(
            '📂 Cache Hit: Loading PDF from local storage: ${file.path} (Age: ${difference.inDays} days)',
            name: 'PdfViewer',
          );
          if (mounted) {
            setState(() {
              _localPath = file.path;
              _isLoading = false;
            });
          }
          return;
        } else {
          developer.log(
            '⏳ Cache Expired: File is older than 3 days. Redownloading...',
            name: 'PdfViewer',
          );
        }
      } else {
        developer.log(
          '🌐 Cache Miss: PDF not found locally. Downloading from ${widget.pdfUrl}',
          name: 'PdfViewer',
        );
      }

      // Download from the server
      final response = await http.get(Uri.parse(widget.pdfUrl));
      if (response.statusCode != 200) {
        throw 'Failed to download asset (${response.statusCode})';
      }

      await file.writeAsBytes(response.bodyBytes);

      if (mounted) {
        setState(() {
          _localPath = file.path;
          _isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      developer.log(
        '❌ Err: [Download PDF]',
        name: 'PdfViewer',
        error: e,
        stackTrace: stackTrace,
      );

      if (mounted) {
        setState(() {
          _error = e;
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!; // Fetch localization

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (_isReady && _totalPages > 0)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  '${_currentPage + 1} / $_totalPages',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(theme, l10n),
      floatingActionButton: FeedbackButton(),
    );
  }

  Widget _buildBody(ThemeData theme, AppLocalizations l10n) {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              l10n.loadingGazette, // Localized String
              style: const TextStyle(color: AppColors.onSurfaceVariant),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.errorLoadingPdf, // Localized String
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppErrorHandler.getFriendlyMessage(_error!, l10n),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return PDFView(
      filePath: _localPath,
      enableSwipe: true,
      swipeHorizontal: false,
      autoSpacing: true,
      pageFling: true,
      pageSnap: true,
      defaultPage: _currentPage,
      fitPolicy: FitPolicy.WIDTH,
      preventLinkNavigation: false,
      onRender: (pages) {
        setState(() {
          _totalPages = pages ?? 0;
          _isReady = true;
        });

        // Runtime Guard: If the native framework missed the defaultPage assignment
        // layout pass during initial hot boot buffers, force-jump explicitly.
        if (widget.initialPage > 1) {
          Future.delayed(const Duration(milliseconds: 100), () {
            _pdfViewController?.setPage(widget.initialPage - 1);
          });
        }
      },
      onError: (error) {
        setState(() => _error = error);
      },
      onPageError: (page, error) {
        developer.log('❌ Page Error: [$page] $error', name: 'PdfViewer');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        _pdfViewController = pdfViewController;
      },
      onPageChanged: (int? page, int? total) {
        if (page != null) {
          setState(() => _currentPage = page);
        }
      },
    );
  }
}

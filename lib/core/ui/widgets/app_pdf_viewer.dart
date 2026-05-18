import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../../../../core/styles/app_colors.dart';

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
  String _errorMessage = '';

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
    final stopwatch = Stopwatch()..start();
    developer.log('🔼 Req: [Download PDF] ${widget.pdfUrl}', name: 'PdfViewer');

    try {
      final response = await http.get(Uri.parse(widget.pdfUrl));
      if (response.statusCode != 200) {
        throw 'Failed to download asset (${response.statusCode})';
      }

      final dir = await getTemporaryDirectory();
      // Extract file name cleanly while stripping bucket query parameters
      final filename = widget.pdfUrl.split('/').last.split('?').first;
      final file = File('${dir.path}/$filename');

      await file.writeAsBytes(response.bodyBytes);

      stopwatch.stop();
      developer.log(
        '✅ Res: [Download PDF] Finished in ${stopwatch.elapsedMilliseconds}ms',
        name: 'PdfViewer',
      );

      if (mounted) {
        setState(() {
          _localPath = file.path;
          _isLoading = false;
        });
      }
    } catch (e, stackTrace) {
      stopwatch.stop();
      developer.log(
        '❌ Err: [Download PDF]',
        name: 'PdfViewer',
        error: e,
        stackTrace: stackTrace,
      );

      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
      body: _buildBody(theme),
    );
  }

  Widget _buildBody(ThemeData theme) {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: 16),
            Text(
              'গ্যাজেট রেফারেন্স লোড হচ্ছে...',
              style: TextStyle(color: AppColors.onSurfaceVariant),
            ),
          ],
        ),
      );
    }

    if (_errorMessage.isNotEmpty) {
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
                'ডকুমেন্টটি প্রদর্শন করা যায়নি',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage,
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
      // Immediate native viewport target assignment
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
        setState(() => _errorMessage = error.toString());
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

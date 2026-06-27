import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/services.dart';

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
  final String? origin;
  final String? destination;

  const AppPdfViewer({
    super.key,
    required this.pdfUrl,
    required this.initialPage,
    required this.title,
    this.origin,
    this.destination,
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
  final _transformationController = TransformationController();
  bool _swipeHorizontal = false;

  @override
  void initState() {
    super.initState();
    // Zoom in by 1.25x initially
    _transformationController.value = Matrix4.identity();
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
  void dispose() {
    _transformationController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

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
          if (_isReady && _totalPages > 0) ...[
            IconButton(
              icon: const Icon(Icons.chevron_left_rounded),
              onPressed: _currentPage > 0
                  ? () {
                      _pdfViewController?.setPage(_currentPage - 1);
                    }
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right_rounded),
              onPressed: _currentPage < _totalPages - 1
                  ? () {
                      _pdfViewController?.setPage(_currentPage + 1);
                    }
                  : null,
            ),
            const SizedBox(width: 8),
            Center(
              child: Text(
                '${_currentPage + 1} / $_totalPages',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ],
      ),
      body: Column(
        children: [
          _buildJourneyHeader(theme, l10n),
          Expanded(
            child: _buildBody(theme, l10n),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'orientation_fab',
            backgroundColor: theme.colorScheme.secondaryContainer,
            foregroundColor: theme.colorScheme.onSecondaryContainer,
            shape: const CircleBorder(),
            onPressed: () {
              setState(() {
                _swipeHorizontal = !_swipeHorizontal;
              });
              if (_swipeHorizontal) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
              } else {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]);
              }
            },
            child: Icon(_swipeHorizontal ? Icons.portrait_rounded : Icons.landscape_rounded),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'zoom_in_fab',
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            shape: const CircleBorder(),
            onPressed: () {
              final currentMatrix = _transformationController.value;
              final currentScale = currentMatrix.getMaxScaleOnAxis();
              if (currentScale < 4.0) {
                _transformationController.value = currentMatrix * Matrix4.diagonal3Values(1.2, 1.2, 1.0);
              }
            },
            child: const Icon(Icons.zoom_in),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'zoom_out_fab',
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            shape: const CircleBorder(),
            onPressed: () {
              final currentMatrix = _transformationController.value;
              final currentScale = currentMatrix.getMaxScaleOnAxis();
              if (currentScale > 1.0) {
                final targetScale = currentScale * 0.8;
                if (targetScale < 1.0) {
                  _transformationController.value = Matrix4.identity();
                } else {
                  _transformationController.value = currentMatrix * Matrix4.diagonal3Values(0.8, 0.8, 1.0);
                }
              }
            },
            child: const Icon(Icons.zoom_out),
          ),
          const SizedBox(height: 8),
          FeedbackButton(),
        ],
      ),
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

    return InteractiveViewer(
      transformationController: _transformationController,
      minScale: 1.0,
      maxScale: 4.0,
      child: PDFView(
        filePath: _localPath,
        enableSwipe: false,
        swipeHorizontal: _swipeHorizontal,
        autoSpacing: true,
        pageFling: false,
        pageSnap: false,
        defaultPage: _currentPage,
        fitPolicy: _swipeHorizontal ? FitPolicy.HEIGHT : FitPolicy.WIDTH,
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
      ),
    );
  }

  Widget _buildJourneyHeader(ThemeData theme, AppLocalizations l10n) {
    if (widget.origin == null || widget.destination == null) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.radio_button_checked,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.origin!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.arrow_forward_rounded, size: 14, color: Colors.grey),
          ),
          Icon(
            Icons.location_on,
            size: 16,
            color: theme.colorScheme.error,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.destination!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

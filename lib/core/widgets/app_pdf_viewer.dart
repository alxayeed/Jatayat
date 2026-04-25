import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/styles/app_colors.dart';

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
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  double _zoomLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  Future<void> _downloadPdf() async {
    final Uri url = Uri.parse(widget.pdfUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not trigger download')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 14)),
        backgroundColor: AppColors.surfaceContainerLowest,
        actions: [
          // Zoom Out
          IconButton(
            icon: const Icon(Icons.zoom_out_rounded),
            onPressed: () {
              setState(() {
                _zoomLevel = (_zoomLevel - 0.25).clamp(1.0, 3.0);
                _pdfViewerController.zoomLevel = _zoomLevel;
              });
            },
          ),
          // Zoom In
          IconButton(
            icon: const Icon(Icons.zoom_in_rounded),
            onPressed: () {
              setState(() {
                _zoomLevel = (_zoomLevel + 0.25).clamp(1.0, 3.0);
                _pdfViewerController.zoomLevel = _zoomLevel;
              });
            },
          ),
          const VerticalDivider(width: 1, indent: 15, endIndent: 15),
          // Download
          IconButton(
            icon: const Icon(Icons.file_download_outlined),
            onPressed: _downloadPdf,
            tooltip: 'Download PDF',
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.pdfUrl,
        controller: _pdfViewerController,
        key: _pdfViewerKey,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          _pdfViewerController.jumpToPage(widget.initialPage);
        },
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load PDF: ${details.error}')),
          );
        },
      ),
      // Floating Navigation Controls for easier one-handed use
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'prevPage',
            onPressed: () => _pdfViewerController.previousPage(),
            child: const Icon(Icons.keyboard_arrow_up),
          ),
          const SizedBox(height: 8),
          FloatingActionButton.small(
            heroTag: 'nextPage',
            onPressed: () => _pdfViewerController.nextPage(),
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}
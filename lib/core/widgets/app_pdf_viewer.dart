import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;
import '../../../../core/styles/app_colors.dart';

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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleExternalLaunch();
    });
  }

  Future<void> _handleExternalLaunch() async {
    final String urlWithPage = '${widget.pdfUrl}#page=${widget.initialPage}';
    final Uri url = Uri.parse(urlWithPage);

    try {
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        throw 'OS rejected the launch request.';
      }

      if (mounted) context.pop();
    } catch (e, stackTrace) {
      developer.log(
        '❌ Err: [PDF Launch Failed]',
        name: 'PdfViewer',
        error: e,
        stackTrace: stackTrace,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening PDF: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );

        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) context.pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: 16),
            Text(
              'গ্যাজেট রেফারেন্স ওপেন হচ্ছে...',
              style: TextStyle(color: AppColors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
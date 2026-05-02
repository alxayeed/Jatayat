import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
    // We trigger the launch after the first frame to avoid UI collisions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleExternalLaunch();
    });
  }

  Future<void> _handleExternalLaunch() async {
    // Construct the URL with the #page fragment
    final String urlWithPage = '${widget.pdfUrl}#page=${widget.initialPage}';
    final Uri url = Uri.parse(urlWithPage);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch $urlWithPage';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening PDF: $e')),
        );
      }
    } finally {
      // Go back to the previous screen (FareDetails)
      // so the user doesn't stay on a blank screen
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // This screen is now just a bridge.
    // We show a simple loader in case the OS takes a second to switch apps.
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
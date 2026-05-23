import 'dart:convert';
import 'dart:ui' as ui;

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final feedbackProvider = AsyncNotifierProvider<GitHubFeedbackNotifier, void>(
  GitHubFeedbackNotifier.new,
);

class GitHubFeedbackNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    return;
  }

  Future<bool> uploadFeedback({
    required UserFeedback feedback,
    required String feedbackType,
  }) async {
    state = const AsyncLoading();

    final String githubToken = dotenv.env['GITHUB_TOKEN'] ?? '';
    const String repoOwner = 'alxayeed';
    const String repoName = 'Jatayat';
    const String activeBranch =
        'feature/feedback'; // Pointing to your active feature branch

    if (githubToken.isEmpty) {
      state = AsyncError(
        Exception("⛔ GITHUB_TOKEN is missing in your .env file!"),
        StackTrace.current,
      );
      return false;
    }

    final cleanText = feedback.text.trim();
    final firstLine = cleanText.isNotEmpty
        ? cleanText.split('\n').first
        : 'Feedback_${DateTime.now().millisecondsSinceEpoch}';

    final String sanitizedFileName = firstLine
        .replaceAll(RegExp(r'[^\w\s\-]'), '')
        .replaceAll(RegExp(r'\s+'), '_')
        .toLowerCase();

    // Appending timestamp ensures completely unique file entries per test run
    final String fileName =
        '${sanitizedFileName}_${DateTime.now().millisecondsSinceEpoch}.png';

    final String storageUrl =
        'https://api.github.com/repos/$repoOwner/$repoName/contents/feedbacks/$fileName';
    final String issueUrl =
        'https://api.github.com/repos/$repoOwner/$repoName/issues';

    List<int> compressedBytes = feedback.screenshot;
    try {
      final ui.Codec codec = await ui.instantiateImageCodec(
        feedback.screenshot,
        targetWidth: 480,
      );
      final ui.FrameInfo frameInfo = await codec.getNextFrame();
      final ui.Image image = frameInfo.image;

      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        compressedBytes = byteData.buffer.asUint8List();
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return false;
    }

    bool isAssetUploaded = false;

    try {
      final storageResponse = await http.put(
        Uri.parse(storageUrl),
        headers: {
          'Authorization': 'Bearer $githubToken',
          'Accept': 'application/vnd.github+json',
          'Content-Type': 'application/json',
          'User-Agent': 'Flutter-Jatayat-Beta',
        },
        body: jsonEncode({
          'message':
              '📸 Upload automated tester screenshot attachment: $fileName',
          'content': base64Encode(compressedBytes),
          'branch': activeBranch,
          // Tells GitHub to commit explicitly to feature/feedback
        }),
      );

      if (storageResponse.statusCode == 201 ||
          storageResponse.statusCode == 200) {
        isAssetUploaded = true;
        debugPrint(
          '🚀 Git Blob Engine: Asset safely committed to $activeBranch branch.',
        );
      } else {
        debugPrint(
          '⛔ Git Blob Engine Error Status: ${storageResponse.statusCode}',
        );
        debugPrint('⛔ Git Blob Engine Failure Spec: ${storageResponse.body}');
      }
    } catch (uploadException) {
      state = AsyncError(uploadException, StackTrace.current);
      return false;
    }

    // Relative markdown path tracking mapped securely to feature/feedback branch
    final String nativeMarkdownImage = isAssetUploaded
        ? '![Bug Screenshot](../blob/$activeBranch/feedbacks/$fileName?raw=true)'
        : '*[Screenshot upload verification failed]*';

    final isBug = feedbackType == 'bug';
    final String cleanLabel = isBug ? 'bug' : 'enhancement';
    final String headingPrefix = isBug ? '📝 Bug description' : '📝 Suggestion';

    final String issueBody =
        '''
**Label:** `$cleanLabel`<br>
*Reported: ${DateTime.now().toLocal()}*

---

### $headingPrefix
> ${feedback.text.trim()}

---

### Attached screenshots:

$nativeMarkdownImage
''';
    final String issueTitle = isBug
        ? '🐛 Bug: $firstLine'
        : '💡 Suggestion: $firstLine';

    final List<String> targetLabels = isBug
        ? ['bug', 'beta-tester-feedback']
        : ['enhancement', 'beta-tester-feedback'];

    try {
      final response = await http.post(
        Uri.parse(issueUrl),
        headers: {
          'Authorization': 'Bearer $githubToken',
          'Accept': 'application/vnd.github+json',
          'Content-Type': 'application/json',
          'User-Agent': 'Flutter-Jatayat-Beta',
        },
        body: jsonEncode({
          'title': issueTitle,
          'body': issueBody,
          'labels': targetLabels,
        }),
      );

      if (response.statusCode == 201) {
        state = const AsyncData(null);
        return true;
      } else {
        state = AsyncError(
          Exception("GitHub submission failed: ${response.statusCode}"),
          StackTrace.current,
        );
        return false;
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return false;
    }
  }
}

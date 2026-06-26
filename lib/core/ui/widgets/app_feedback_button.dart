// import 'package:feedback/feedback.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../providers/feedback_provider.dart';
//
// class AppFeedbackButton extends ConsumerWidget {
//   const AppFeedbackButton({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final showFeedback = dotenv.env['SHOW_FEEDBACK_BUTTON'] == 'true';
//     if (!showFeedback) {
//       return const SizedBox.shrink();
//     }
//
//     final theme = Theme.of(context);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: theme.colorScheme.secondaryContainer,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.08),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: IconButton(
//           onPressed: () => _showFeedbackSystem(context, ref),
//           icon: const Icon(Icons.feedback, size: 20),
//           color: theme.colorScheme.onSecondaryContainer,
//           tooltip: 'Share App Insights',
//           constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
//         ),
//       ),
//     );
//   }
//
//   void _showFeedbackSystem(BuildContext context, WidgetRef ref) {
//     final theme = Theme.of(context);
//
//     BetterFeedback.of(context).show((UserFeedback feedback) async {
//       final String feedbackType = feedback.extra?['type'] ?? 'bug';
//
//       final bool success = await ref
//           .read(feedbackProvider.notifier)
//           .uploadFeedback(feedback: feedback, feedbackType: feedbackType);
//
//       if (!context.mounted) return;
//
//       if (success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: Text(
//               feedbackType == 'bug'
//                   ? '🐛 Bug report sent successfully! Thanks!'
//                   : '💡 Thank you for your Suggestion!',
//             ),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             behavior: SnackBarBehavior.floating,
//             backgroundColor: theme.colorScheme.error,
//             content: const Text('Failed to submit feedback. Please try again.'),
//           ),
//         );
//       }
//     });
//   }
// }

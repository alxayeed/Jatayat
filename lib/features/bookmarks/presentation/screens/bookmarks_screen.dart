import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        CustomAppBar(title: AppStrings.appName),
        SliverFillRemaining(child: const Center(child: Text('Coming Soon')))]),
    );
  }
}

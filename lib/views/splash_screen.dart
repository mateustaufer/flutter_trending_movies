import 'package:flutter/material.dart';

import '../widgets/base_page_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePageWidget(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

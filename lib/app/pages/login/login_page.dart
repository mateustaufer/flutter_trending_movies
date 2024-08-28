import 'package:flutter/material.dart';

import '../../widgets/base_page_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: const Center(
        child: Text('Login Page'),
      ),
    );
  }
}

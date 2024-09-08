import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/routes/routes.dart';
import '../../widgets/base_page_widget.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lotties/not_found.json',
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.home,
                (route) => false,
              ),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/routes/routes.dart';
import '../../widgets/base_page_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.home,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      body: Center(
        child: Lottie.asset(
          'assets/lotties/movie_splash.json',
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'styles/app_themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trending Movies',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}

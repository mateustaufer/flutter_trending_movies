import 'package:flutter/material.dart';

import 'core/routes/routes.dart';

class TrendingMovieApp extends StatelessWidget {
  const TrendingMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trending Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.home,
    );
  }
}

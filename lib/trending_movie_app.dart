import 'package:flutter/material.dart';

import 'routes.dart';

class TrendingMovieApp extends StatelessWidget {
  const TrendingMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trending Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routes.routerConfig,
    );
  }
}

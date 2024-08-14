import 'package:flutter/material.dart';

import 'views/counter_page_view.dart';

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
      home: const CounterPageView(title: 'Counter'),
    );
  }
}

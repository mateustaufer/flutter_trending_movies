import 'package:flutter/material.dart';

import '../../views/counter_page_view.dart';
import '../../views/home_page_view.dart';
import '../../views/splash_screen.dart';
import '../../views/trending_movies_page_view.dart';

class Routes {
  static const home = '/';
  static const splashScreen = '/welcome';
  static const trendingMovies = '/trending-movies';
  static const counter = '/counter';

  Routes._internal();
  static final instance = Routes._internal();

  Map<String, Widget Function(BuildContext)> get routes => {
        home: (context) => const HomePageView(),
        splashScreen: (context) => const SplashScreen(),
        trendingMovies: (context) => const TrendingMoviesPageView(),
        counter: (context) => const CounterPageView(),
      };
}

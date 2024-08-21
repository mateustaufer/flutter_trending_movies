import 'package:flutter/material.dart';

import '../../views/counter_page_view.dart';
import '../../views/home_page_view.dart';
import '../../views/splash_screen.dart';
import '../../views/trending_movies_page_view.dart';

class Routes {
  static const home = '/';
  static const splashScreen = '/welcome';
  static const counter = '/counter';
  static const trendingMovies = '/trending-movies';
  static const movieDetails = '/trending-movies/movie/:id';

  Routes._internal();
  static final instance = Routes._internal();

  Map<String, Widget Function(BuildContext)> get routes => {
        home: (context) => const HomePageView(),
        splashScreen: (context) => const SplashScreen(),
        counter: (context) => const CounterPageView(),
        trendingMovies: (context) => const TrendingMoviesPageView(),
        //movieDetails: (context) => const MoviePageView(),
      };
}

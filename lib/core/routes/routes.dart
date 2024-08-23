import 'package:flutter/material.dart';

import '../../views/counter_page_view.dart';
import '../../views/home_page_view.dart';
import '../../views/movie_page_view.dart';
import '../../views/splash_screen.dart';
import '../../views/trending_movies_page_view.dart';

class Routes {
  static const home = '/';
  static const splashScreen = '/splash-screen';
  static const counter = '/counter';
  static const trendingMovies = '/trending-movies';
  static const movieDetails = '/trending-movies/movie-details';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (_) => const HomePageView(),
    splashScreen: (_) => const SplashScreen(),
    counter: (_) => const CounterPageView(),
    trendingMovies: (_) => const TrendingMoviesPageView(),
    movieDetails: (_) => const MoviePageView(),
  };
}

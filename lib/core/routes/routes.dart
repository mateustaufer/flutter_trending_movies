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

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name!);

    final parameters = <String, String>{};
    parameters.addAll(uri.queryParameters);
    if (settings.arguments != null &&
        settings.arguments is Map<String, String>) {
      parameters.addAll(settings.arguments as Map<String, String>);
    }

    String name = settings.name ?? '';
    if (!name.contains('?')) {
      String parameterString = parameters.entries.isNotEmpty ? '?' : '';
      parameters.forEach((key, value) {
        parameterString += '$key=$value&';
      });

      name = '${settings.name}$parameterString';
    }

    if (routes.containsKey(uri.path)) {
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => routes[uri.path]!(context),
        settings: RouteSettings(arguments: parameters, name: name),
      );
    }

    return PageRouteBuilder(
      pageBuilder: (context, _, __) => routes[home]!(context),
      settings: RouteSettings(arguments: parameters, name: name),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}

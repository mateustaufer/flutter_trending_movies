import 'package:flutter/material.dart';

import '../../pages/counter/counter_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/movie/movie_page.dart';
import '../../pages/splash/splash_page.dart';
import '../../pages/trending_movies/trending_movies_page.dart';

class Routes {
  static const home = '/';
  static const splashScreen = '/welcome';
  static const counter = '/counter';
  static const trendingMovies = '/trending-movies';
  static const movieDetails = '/trending-movies/movie-details';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (_) => const HomePage(),
    splashScreen: (_) => const SplashPage(),
    counter: (_) => const CounterPage(),
    trendingMovies: (_) => const TrendingMoviesPage(),
    movieDetails: (_) => const MoviePage(),
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

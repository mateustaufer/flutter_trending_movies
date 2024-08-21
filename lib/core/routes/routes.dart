import 'package:go_router/go_router.dart';

import '../../views/counter_page_view.dart';
import '../../views/home_page_view.dart';
import '../../views/movie_page_view.dart';
import '../../views/splash_screen.dart';
import '../../views/trending_movies_page_view.dart';

class Routes {
  static const home = 'home';
  static const splashScreen = 'splash-screen';
  static const counter = 'counter';
  static const trendingMovies = 'trending-movies';
  static const movieDetails = 'movie-details';

  Routes._internal();
  static final instance = Routes._internal();

  GoRouter get routerConfig => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: home,
            builder: (context, state) => const HomePageView(),
            routes: [
              GoRoute(
                path: 'welcome',
                name: splashScreen,
                builder: (context, state) => const SplashScreen(),
              ),
              GoRoute(
                path: 'counter',
                name: counter,
                builder: (context, state) => const CounterPageView(),
              ),
              GoRoute(
                path: 'trending-movies',
                name: trendingMovies,
                builder: (context, state) => const TrendingMoviesPageView(),
                routes: [
                  GoRoute(
                    path: 'movie-details/:id',
                    name: movieDetails,
                    builder: (context, state) => MoviePageView(
                      id: state.pathParameters["id"] ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}

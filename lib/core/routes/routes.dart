import 'package:go_router/go_router.dart';

import '../../views/counter_page_view.dart';
import '../../views/home_page_view.dart';
import '../../views/splash_screen.dart';
import '../../views/trending_movies_page.dart';

class Routes {
  static const home = 'home';
  static const splashScreen = 'splash-screen';
  static const trendingMovies = 'trending-movies';
  static const counter = 'counter';

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
                path: 'trending-movies',
                name: trendingMovies,
                builder: (context, state) => const TrendingMoviesPage(),
              ),
              GoRoute(
                path: 'counter',
                name: counter,
                builder: (context, state) => const CounterPageView(),
              ),
            ],
          ),
        ],
      );
}

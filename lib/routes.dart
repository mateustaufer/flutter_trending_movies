import 'package:go_router/go_router.dart';

import 'views/counter_page_view.dart';
import 'views/home_page_view.dart';
import 'views/splash_screen.dart';

class Routes {
  static const home = '/';
  static const splashScreen = 'welcome';
  static const counter = 'counter';

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (_, __) => const HomePageView(),
        routes: [
          GoRoute(
            path: Routes.splashScreen,
            builder: (_, __) => const SplashScreen(),
          ),
          GoRoute(
            path: Routes.counter,
            builder: (_, __) => const CounterPageView(title: 'Counter'),
          ),
        ],
      ),
    ],
  );

  static final routerConfig = Routes()._router;
}

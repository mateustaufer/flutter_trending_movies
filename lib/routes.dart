import 'package:go_router/go_router.dart';

import 'views/counter_page_view.dart';
import 'views/home_page_view.dart';

class Routes {
  static const home = '/';
  static const counter = 'counter';

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          return const HomePageView();
        },
        routes: [
          GoRoute(
            path: Routes.counter,
            builder: (context, state) {
              return const CounterPageView(title: 'Counter');
            },
          ),
        ],
      ),
    ],
  );

  static final routerConfig = Routes()._router;
}

import 'package:flutter/material.dart';

import 'core/routes/routes.dart';

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
      onGenerateRoute: (settings) {
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

        if (Routes.routes.containsKey(uri.path)) {
          return MaterialPageRoute(
            builder: Routes.routes[uri.path]!,
            settings: RouteSettings(arguments: parameters, name: name),
          );
        }

        return MaterialPageRoute(
          builder: Routes.routes[Routes.home]!,
          settings: RouteSettings(arguments: parameters, name: name),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/dependencies_injecttion.dart';
import 'trending_movie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  DependenciesInjection.init();

  runApp(const TrendingMovieApp());
}

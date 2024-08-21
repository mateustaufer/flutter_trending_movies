import 'package:flutter/material.dart';

import 'core/configure_nonweb.dart'
    if (dart.library.html) 'core/configure_web.dart';
import 'core/dependencies_injecttion.dart';
import 'trending_movie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureUrlStrategy();

  DependenciesInjection.init();

  runApp(const TrendingMovieApp());
}

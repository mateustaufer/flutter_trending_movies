import 'package:flutter/material.dart';

import 'core/bindings/bindings.dart';
import 'core/configure_nonweb.dart'
    if (dart.library.html) 'core/configure_web.dart';
import 'trending_movie_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureUrlStrategy();

  Bindings.init();

  runApp(const TrendingMovieApp());
}

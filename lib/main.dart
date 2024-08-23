import 'package:flutter/material.dart';

import 'core/bindings/bindings.dart';
import 'trending_movie_app.dart';
import 'utils/configure_nonweb.dart'
    if (dart.library.html) 'utils/configure_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureUrlStrategy();

  Bindings.init();

  runApp(const TrendingMovieApp());
}

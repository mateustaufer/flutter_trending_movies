import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/core/bindings/bindings.dart';
import 'app/utils/configure_nonweb.dart'
    if (dart.library.html) 'app/utils/configure_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureUrlStrategy();

  Bindings.init();

  runApp(const App());
}

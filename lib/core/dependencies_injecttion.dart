import 'package:get_it/get_it.dart';

import '../controllers/trending_movies_page_controller.dart';
import '../data/providers/movie_provider.dart';
import '../data/repositories/movie_repository.dart';
import '../data/stores/movie_store.dart';

class DependenciesInjection {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<MovieProvider>(
      () => MovieProvider(),
    );

    getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepository(getIt()),
    );

    getIt.registerLazySingleton<MovieStore>(
      () => MovieStore(getIt()),
    );

    getIt.registerFactory<TrendingMoviesPageController>(
      () => TrendingMoviesPageController(getIt()),
    );
  }
}

import 'package:get_it/get_it.dart';

import '../../data/network/api_client.dart';
import '../../data/network/dio_client.dart';
import '../../data/providers/movie_provider.dart';
import '../../data/repositories/movie_repository.dart';
import '../../data/stores/movie_store.dart';
import '../../data/stores/trending_movies_store.dart';

class Bindings {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<ApiClient>(
      () => DioClient(),
    );

    getIt.registerLazySingleton<MovieProvider>(
      () => MovieProvider(getIt()),
    );

    getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepository(getIt()),
    );

    getIt.registerLazySingleton<MovieStore>(
      () => MovieStore(getIt()),
    );

    getIt.registerLazySingleton<TrendingMoviesStore>(
      () => TrendingMoviesStore(getIt()),
    );
  }
}

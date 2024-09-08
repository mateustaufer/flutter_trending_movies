import 'package:get_it/get_it.dart';

import '../../data/decorators/movie/movie_cache_repository_decorator.dart';
import '../../data/providers/movie_provider.dart';
import '../../data/repositories/movie/movie_repository.dart';
import '../../data/repositories/movie/movie_repository_imp.dart';
import '../../data/stores/movie_store.dart';
import '../../data/stores/trending_movies_store.dart';
import '../network/api_client.dart';
import '../network/dio_client.dart';
import '../storage/local/local_storage.dart';
import '../storage/local/shared_preferences_imp.dart';

class Bindings {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<ApiClient>(() => DioClient());
    getIt.registerLazySingleton<LocalStorage>(() => SharedPreferencesImp());
    getIt.registerLazySingleton<MovieProvider>(() => MovieProvider(getIt()));

    getIt.registerLazySingleton<MovieRepository>(
      () => MovieCacheRepositoryDecorator(MovieRepositoryImp(getIt())),
    );

    getIt.registerLazySingleton<MovieStore>(() => MovieStore(getIt()));

    getIt.registerLazySingleton<TrendingMoviesStore>(
      () => TrendingMoviesStore(getIt()),
    );
  }
}

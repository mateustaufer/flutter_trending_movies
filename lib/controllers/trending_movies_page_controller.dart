import 'package:get_it/get_it.dart';

import '../data/repositories/movie_repository.dart';
import '../data/stores/movie_store.dart';

class TrendingMoviesPageController {
  final MovieRepository repository;

  TrendingMoviesPageController(this.repository) {
    movieStore = GetIt.I.get<MovieStore>();
    movieStore.fetchTrendingMoviesList();
  }

  late MovieStore movieStore;
}

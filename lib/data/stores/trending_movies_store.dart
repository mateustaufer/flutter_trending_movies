import 'package:flutter/material.dart';

import '../repositories/movie/movie_repository.dart';
import '../states/trending_movies_state.dart';

class TrendingMoviesStore extends ValueNotifier<TrendingMoviesState> {
  final MovieRepository repository;

  TrendingMoviesStore(this.repository) : super(TrendingMoviesInitialState());

  Future<void> fetchTrendingMoviesList() async {
    value = TrendingMoviesLoadingState();

    final response =
        await repository.fetchTrendingMoviesList(timeWindow: 'day');

    response.fold(
      (l) => value = TrendingMoviesErrorState(message: l.statusMessage ?? ''),
      (r) => value = TrendingMoviesSuccessState(movies: r.movies ?? []),
    );
  }
}

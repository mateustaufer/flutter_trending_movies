import 'package:flutter/material.dart';

import '../repositories/movie_repository.dart';
import '../states/movie_state.dart';

class MovieStore extends ValueNotifier<MovieState> {
  final MovieRepository repository;

  MovieStore(this.repository) : super(MovieInitialState());

  Future<void> fetchTrendingMoviesList() async {
    value = MovieLoadingState();

    final response =
        await repository.fetchTrendingMoviesList(timeWindow: 'day');

    response.fold(
      (l) {
        value = MovieErrorState(message: l.statusMessage ?? '');
      },
      (r) {
        value = MovieSuccesState(movies: r.movies ?? []);
      },
    );
  }
}

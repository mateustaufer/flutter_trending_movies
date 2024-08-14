import 'package:flutter/material.dart';

import '../data/models/movie_model.dart';
import '../data/providers/movie_provider.dart';
import '../data/repositories/movie_repository.dart';

class HomePageController {
  final movieRepository = MovieRepository(MovieProvider());

  var isLoading = ValueNotifier<bool>(false);
  var movies = ValueNotifier<List<MovieModel>>([]);

  Future<void> fetchTrendingMovies(context) async {
    isLoading.value = true;

    final response =
        await movieRepository.fetchTrendingMoviesList(timeWindow: 'day');

    response.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.statusMessage ?? ''),
            showCloseIcon: true,
          ),
        );
      },
      (r) {
        movies.value = r.movies ?? [];
      },
    );

    isLoading.value = false;
  }
}

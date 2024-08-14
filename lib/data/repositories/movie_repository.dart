import 'package:flutter/foundation.dart';

import '../models/movies_list_model.dart';
import '../providers/movie_provider.dart';

class MovieRepository {
  final MovieProvider movieProvider;

  MovieRepository(this.movieProvider);

  Future<MoviesListModel> fetchMoviesList({
    required int listId,
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final response = await movieProvider.fetchMoviesList(
        listId: listId,
        language: language,
        page: page,
      );

      return MoviesListModel.fromRawJson(response.body);
    } catch (e, s) {
      if (kDebugMode) {
        print('MoviesRepository fetchMoviesList error ==> $e');
        print('MoviesRepository fetchMoviesList stackTrace ==> $s');
      }

      return MoviesListModel();
    }
  }
}

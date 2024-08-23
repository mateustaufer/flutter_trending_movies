import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../models/error_response_body.dart';
import '../models/movie_model.dart';
import '../models/movies_list_model.dart';
import '../providers/movie_provider.dart';

class MovieRepository {
  final MovieProvider movieProvider;

  MovieRepository(this.movieProvider);

  Future<Either<ErrorResponseBody, MoviesListModel>> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  }) async {
    try {
      final response = await movieProvider.fetchTrendingMoviesList(
        timeWindow: timeWindow,
        language: language,
      );

      if (response.statusCode != 200) {
        final responseError = ErrorResponseBody.fromRawJson(response.body);
        return left(responseError);
      }

      return right(MoviesListModel.fromRawJson(response.body));
    } catch (e, s) {
      if (kDebugMode) {
        print('MovieRepository fetchTrendingMoviesList error ==> $e');
        print('MovieRepository fetchTrendingMoviesList stackTrace ==> $s');
      }

      return left(
        ErrorResponseBody(
          success: false,
          statusCode: 500,
          statusMessage: 'Erro ao buscar a lista de filmes em alta.',
        ),
      );
    }
  }

  Future<Either<ErrorResponseBody, MovieModel>> fetchMovieDetails({
    required String movieId,
    String language = 'pt-BR',
  }) async {
    try {
      final response = await movieProvider.fetchMovieDetails(
        movieId: movieId,
        language: language,
      );

      if (response.statusCode != 200) {
        final responseError = ErrorResponseBody.fromRawJson(response.body);
        return left(responseError);
      }

      return right(MovieModel.fromRawJson(response.body));
    } catch (e, s) {
      if (kDebugMode) {
        print('MovieRepository fetchMovieDetails error ==> $e');
        print('MovieRepository fetchMovieDetails stackTrace ==> $s');
      }

      return left(
        ErrorResponseBody(
          success: false,
          statusCode: 500,
          statusMessage: 'Erro ao buscar o filme.',
        ),
      );
    }
  }
}

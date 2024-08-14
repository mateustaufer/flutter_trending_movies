import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../models/movies_list_model.dart';
import '../network/response_error.dart';
import '../providers/movie_provider.dart';

class MovieRepository {
  final MovieProvider movieProvider;

  MovieRepository(this.movieProvider);

  Future<Either<ResponseError, MoviesListModel>> fetchMoviesList({
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

      if (response.statusCode != 200) {
        final responseError = ResponseError.fromRawJson(response.body);
        return left(responseError);
      }

      return right(MoviesListModel.fromRawJson(response.body));
    } catch (e, s) {
      if (kDebugMode) {
        print('MoviesRepository fetchMoviesList error ==> $e');
        print('MoviesRepository fetchMoviesList stackTrace ==> $s');
      }

      return left(
        ResponseError(
          success: false,
          statusCode: 500,
          statusMessage: 'Erro ao buscar a lista de filmes',
        ),
      );
    }
  }

  Future<Either<ResponseError, MoviesListModel>> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  }) async {
    try {
      final response = await movieProvider.fetchTrendingMoviesList(
        timeWindow: timeWindow,
        language: language,
      );

      if (response.statusCode != 200) {
        final responseError = ResponseError.fromRawJson(response.body);
        return left(responseError);
      }

      return right(MoviesListModel.fromRawJson(response.body));
    } catch (e, s) {
      if (kDebugMode) {
        print('MoviesRepository fetchTrendingMoviesList error ==> $e');
        print('MoviesRepository fetchTrendingMoviesList stackTrace ==> $s');
      }

      return left(
        ResponseError(
          success: false,
          statusCode: 500,
          statusMessage: 'Erro ao buscar a lista de filmes mais assistidos.',
        ),
      );
    }
  }
}

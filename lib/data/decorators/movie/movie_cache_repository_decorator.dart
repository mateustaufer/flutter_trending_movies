import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../core/storage/storage.dart';
import '../../models/error_response_body.dart';
import '../../models/movie_model.dart';
import '../../models/movies_list_model.dart';
import 'movie_repository_decorator.dart';

class MovieCacheRepositoryDecorator extends MovieRepositoryDecorator {
  MovieCacheRepositoryDecorator(super.movieRepository);

  @override
  Future<Either<ErrorResponseBody, MoviesListModel>> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  }) async {
    return await super.fetchTrendingMoviesList(
      timeWindow: timeWindow,
      language: language,
    );
  }

  @override
  Future<Either<ErrorResponseBody, MovieModel>> fetchMovieDetails({
    required String movieId,
    String language = 'pt-BR',
  }) async {
    return await super.fetchMovieDetails(movieId: movieId, language: language);
  }

  void saveTrendingMoviesListInCache(MoviesListModel trendingMoviesList) async {
    final storage = GetIt.I.get<Storage>();
    await storage.save(
      'trendingMoviesList',
      jsonEncode(trendingMoviesList.toJson()),
    );
  }

  Future<MoviesListModel?> getTrendingMoviesListFromCache() async {
    final storage = GetIt.I.get<Storage>();

    final trendingMoviesListJson = await storage.read('trendingMoviesList');
    if (trendingMoviesListJson != null) {
      return MoviesListModel.fromJson(jsonDecode(trendingMoviesListJson));
    }

    return null;
  }

  void saveMovieDetailsInCache(MovieModel movie) {
    final storage = GetIt.I.get<Storage>();
    storage.save('movieDetails', jsonEncode(movie.toJson()));
  }

  Future<MovieModel?> getMovieDetailsFromCache() async {
    final storage = GetIt.I.get<Storage>();

    final movieDetailsJson = await storage.read('movieDetails');
    if (movieDetailsJson != null) {
      return MovieModel.fromJson(jsonDecode(movieDetailsJson));
    }

    return null;
  }
}

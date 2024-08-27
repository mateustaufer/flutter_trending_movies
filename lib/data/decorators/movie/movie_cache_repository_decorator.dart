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
    return (await super.fetchTrendingMoviesList(
      timeWindow: timeWindow,
      language: language,
    ))
        .fold(
      (l) async {
        final trendingMoviesList = await getTrendingMoviesListFromCache();
        if (trendingMoviesList != null) {
          return Right(trendingMoviesList);
        }
        return Left(l);
      },
      (r) async {
        saveTrendingMoviesListInCache(r);
        return Right(r);
      },
    );
  }

  @override
  Future<Either<ErrorResponseBody, MovieModel>> fetchMovieDetails({
    required String movieId,
    String language = 'pt-BR',
  }) async {
    return (await super.fetchMovieDetails(movieId: movieId, language: language))
        .fold(
      (l) async {
        final movieDetails = await getMovieDetailsFromCache();
        if (movieDetails != null) {
          return Right(movieDetails);
        }
        return Left(l);
      },
      (r) async {
        saveMovieDetailsInCache(r);
        return Right(r);
      },
    );
  }

  void saveTrendingMoviesListInCache(MoviesListModel trendingMoviesList) async {
    final json = trendingMoviesList.toEncodedJson();
    final storage = GetIt.I.get<Storage>();
    storage.save('trendingMoviesList', json);
  }

  Future<MoviesListModel?> getTrendingMoviesListFromCache() async {
    final storage = GetIt.I.get<Storage>();

    final trendingMoviesListJson = await storage.read('trendingMoviesList');
    if (trendingMoviesListJson != null) {
      return MoviesListModel.fromRawJson(trendingMoviesListJson);
    }

    return null;
  }

  void saveMovieDetailsInCache(MovieModel movie) {
    final json = movie.toEncodedJson();
    final storage = GetIt.I.get<Storage>();
    storage.save('movieDetails', json);
  }

  Future<MovieModel?> getMovieDetailsFromCache() async {
    final storage = GetIt.I.get<Storage>();

    final movieDetailsJson = await storage.read('movieDetails');
    if (movieDetailsJson != null) {
      return MovieModel.fromRawJson(movieDetailsJson);
    }

    return null;
  }
}

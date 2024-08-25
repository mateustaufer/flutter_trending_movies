import 'package:dartz/dartz.dart';

import '../../models/error_response_body.dart';
import '../../models/movie_model.dart';
import '../../models/movies_list_model.dart';
import '../../repositories/movie/movie_repository.dart';

class MovieRepositoryDecorator implements MovieRepository {
  final MovieRepository movieRepository;

  MovieRepositoryDecorator(this.movieRepository);

  @override
  Future<Either<ErrorResponseBody, MoviesListModel>> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  }) async {
    return await movieRepository.fetchTrendingMoviesList(
      timeWindow: timeWindow,
      language: language,
    );
  }

  @override
  Future<Either<ErrorResponseBody, MovieModel>> fetchMovieDetails({
    required String movieId,
    String language = 'pt-BR',
  }) {
    return movieRepository.fetchMovieDetails(
      movieId: movieId,
      language: language,
    );
  }
}

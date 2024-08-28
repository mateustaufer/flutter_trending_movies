import 'package:dartz/dartz.dart';

import '../../models/error_response_body.dart';
import '../../models/movie_model.dart';
import '../../models/movies_list_model.dart';

abstract class MovieRepository {
  Future<Either<ErrorResponseBody, MoviesListModel>> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  });

  Future<Either<ErrorResponseBody, MovieModel>> fetchMovieDetails({
    required String movieId,
    String language = 'pt-BR',
  });
}

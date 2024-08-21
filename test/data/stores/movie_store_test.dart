import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/data/network/network_response.dart';
import 'package:flutter_trending_movies/data/network/response_error.dart';
import 'package:flutter_trending_movies/data/repositories/movie_repository.dart';
import 'package:flutter_trending_movies/data/states/movie_state.dart';
import 'package:flutter_trending_movies/data/stores/movie_store.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/movie_provider_mock.dart';

void main() {
  final provider = MovieProviderMock();
  final repository = MovieRepository(provider);
  final store = MovieStore(repository);

  test(
    'is expected a movie details',
    () async {
      when(
        () => provider.fetchMovieDetails(movieId: '348'),
      ).thenAnswer(
        (_) async => NetworkResponse(
          body: MovieProviderMock.movieDetailsResponseBody,
          statusCode: 200,
        ),
      );

      await store.fetchMovieDetails(movieId: '348');

      expect(store.value, isA<MovieSuccessState>());
    },
  );

  test(
    'is expected a error when try to fetch a movie details',
    () async {
      when(
        () => provider.fetchMovieDetails(movieId: '348'),
      ).thenThrow(
        (_) async => ResponseError(
          success: false,
          statusCode: 500,
          statusMessage: 'Erro ao buscar o filme.',
        ),
      );

      await store.fetchMovieDetails(movieId: '348');

      expect(store.value, isA<MovieErrorState>());
    },
  );
}

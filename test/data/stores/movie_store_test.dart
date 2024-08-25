import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/data/models/error_response_body.dart';
import 'package:flutter_trending_movies/data/network/network_response.dart';
import 'package:flutter_trending_movies/data/repositories/movie_repository_imp.dart';
import 'package:flutter_trending_movies/data/states/movie_state.dart';
import 'package:flutter_trending_movies/data/stores/movie_store.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/movie_provider_mock.dart';

void main() {
  final provider = MovieProviderMock();
  final repository = MovieRepositoryImp(provider);
  final store = MovieStore(repository);

  test(
    'is expected a movie',
    () async {
      when(
        () => provider.fetchMovieDetails(movieId: '348'),
      ).thenAnswer(
        (_) async {
          return NetworkResponse(
            body: MovieProviderMock.movieDetailsResponseBody,
            statusCode: 200,
          );
        },
      );

      await store.fetchMovieDetails(movieId: '348');

      expect(store.value, isA<MovieSuccessState>());
    },
  );

  test(
    'is expected a error when try to fetch a movie',
    () async {
      when(
        () => provider.fetchMovieDetails(movieId: '348'),
      ).thenThrow(
        (_) async => ErrorResponseBody(
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

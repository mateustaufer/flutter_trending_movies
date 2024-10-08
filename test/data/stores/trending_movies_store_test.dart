import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/app/core/network/network_response.dart';
import 'package:flutter_trending_movies/app/data/models/error_response_body.dart';
import 'package:flutter_trending_movies/app/data/repositories/movie/movie_repository_imp.dart';
import 'package:flutter_trending_movies/app/data/states/trending_movies_state.dart';
import 'package:flutter_trending_movies/app/data/stores/trending_movies_store.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/movie_provider_mock.dart';

void main() {
  final provider = MovieProviderMock();
  final repository = MovieRepositoryImp(provider);
  final store = TrendingMoviesStore(repository);

  test(
    'is expected a trending movies list',
    () async {
      when(
        () {
          return provider.fetchTrendingMoviesList(timeWindow: 'day');
        },
      ).thenAnswer(
        (_) async {
          return NetworkResponse(
            body: MovieProviderMock.trendingMoviesReponseBody,
            statusCode: 200,
          );
        },
      );

      await store.fetchTrendingMoviesList();

      expect(store.value, isA<TrendingMoviesSuccessState>());
    },
  );

  test(
    'is expected a error when try to fetch a trending movies list',
    () async {
      when(
        () => provider.fetchTrendingMoviesList(timeWindow: 'day'),
      ).thenThrow(
        (_) async => ErrorResponseBody(
          success: false,
          statusCode: 500,
          statusMessage: 'Erro ao buscar a lista de filmes em alta.',
        ),
      );

      await store.fetchTrendingMoviesList();

      expect(store.value, isA<TrendingMoviesErrorState>());
    },
  );
}

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/data/network/network_response.dart';
import 'package:flutter_trending_movies/data/repositories/movie_repository.dart';
import 'package:flutter_trending_movies/data/states/trending_movies_state.dart';
import 'package:flutter_trending_movies/data/stores/trending_movies_store.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/movie_mock.dart';

void main() {
  final provider = MovieMock();
  final repository = MovieRepository(provider);
  final store = TrendingMoviesStore(repository);

  test(
    'Movie State Success',
    () async {
      when(
        () {
          return provider.fetchTrendingMoviesList(timeWindow: 'day');
        },
      ).thenAnswer(
        (_) async {
          return NetworkResponse(body: MovieMock.responseBody, statusCode: 200);
        },
      );

      await store.fetchTrendingMoviesList();

      expect(store.value, isA<TrendingMoviesSuccessState>());
    },
  );

  test(
    'Movie State Error',
    () async {
      when(
        () => provider.fetchTrendingMoviesList(timeWindow: 'day'),
      ).thenThrow(
        (_) async => Exception('Error'),
      );

      await store.fetchTrendingMoviesList();

      expect(store.value, isA<TrendingMoviesErrorState>());
    },
  );
}

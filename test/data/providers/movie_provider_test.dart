import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/data/network/network_response.dart';
import 'package:flutter_trending_movies/data/repositories/movie_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/movie_provider_mock.dart';

void main() {
  final movieProviderMock = MovieProviderMock();
  final movieRepository = MovieRepository(movieProviderMock);

  test('Fetch trending movies list', () async {
    when(
      () => movieProviderMock.fetchTrendingMoviesList(timeWindow: 'day'),
    ).thenAnswer(
      (_) async => NetworkResponse(
        body: MovieProviderMock.trendingMoviesReponseBody,
        statusCode: 200,
      ),
    );

    final response = await movieRepository.fetchTrendingMoviesList(
      timeWindow: 'day',
    );

    response.fold(
      (l) => expect(l.statusMessage, isNotEmpty),
      (r) => expect(r.movies, isNotEmpty),
    );
  });

  test('Fetch movie details', () async {
    when(
      () => movieProviderMock.fetchMovieDetails(movieId: '348'),
    ).thenAnswer(
      (_) async => NetworkResponse(
        body: MovieProviderMock.movieDetailsResponseBody,
        statusCode: 200,
      ),
    );

    final response = await movieRepository.fetchMovieDetails(movieId: '348');

    response.fold(
      (l) => expect(l.statusMessage, isNotEmpty),
      (r) => expect(r, isNotNull),
    );
  });
}

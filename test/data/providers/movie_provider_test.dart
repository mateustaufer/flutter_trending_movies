import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/data/network/network_response.dart';
import 'package:flutter_trending_movies/data/repositories/movie_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/movie_mock.dart';

void main() {
  final movieMock = MovieMock();
  final movieRepository = MovieRepository(movieMock);

  test('Fetch Trending Movies List', () async {
    when(
      () => movieMock.fetchTrendingMoviesList(timeWindow: 'day'),
    ).thenAnswer(
      (_) async =>
          NetworkResponse(body: MovieMock.responseBody, statusCode: 200),
    );

    final response = await movieRepository.fetchTrendingMoviesList(
      timeWindow: 'day',
    );

    response.fold(
      (l) => expect(l.statusMessage, isNotEmpty),
      (r) => expect(r.movies, isNotEmpty),
    );
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_trending_movies/data/network/network_response.dart';
import 'package:flutter_trending_movies/data/repositories/movie_repository.dart';
import 'package:flutter_trending_movies/views/counter_page_view.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/movie_mock.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CounterPageView(title: 'Counter')),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

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

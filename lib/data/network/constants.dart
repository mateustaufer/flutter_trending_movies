class Constants {
  static const environment = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'api.themoviedb.org',
  );

  static const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: '4a7018376d6a5239159d0bb9b44a54ad',
  );

  static const bearerToken = String.fromEnvironment(
    'BEARER_TOKEN',
    defaultValue:
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTcwMTgzNzZkNmE1MjM5MTU5ZDBiYjliNDRhNTRhZCIsIm5iZiI6MTcyMzU3OTExNy42NjUxNDQsInN1YiI6IjY2OTFiOGMzYjcxYzRmYmJlYjAyMzgxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QSedvf21kxZ5RUMqkgpMft7LZhSrQPBqepoqN5VHx6s',
  );
}

class Constants {
  static const environment = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'BASE_URL',
  );

  static const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'YOUR_API_KEY',
  );

  static const bearerToken = String.fromEnvironment(
    'BEARER_TOKEN',
    defaultValue: 'YOUR_BEARER_TOKEN',
  );
}

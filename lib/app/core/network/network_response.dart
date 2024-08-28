class NetworkResponse {
  final String body;
  final int statusCode;

  NetworkResponse({
    required this.body,
    required this.statusCode,
  });

  @override
  String toString() => 'NetworkResponse(body: $body, statusCode: $statusCode)';
}

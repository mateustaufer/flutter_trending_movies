import 'network_response.dart';

abstract class ApiClient {
  Future<NetworkResponse> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  });

  Future<NetworkResponse> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  });

  Future<NetworkResponse> put({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  });

  Future<NetworkResponse> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  });

  Future<NetworkResponse> patch({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  });

  Future<NetworkResponse> head({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  });
}

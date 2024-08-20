import 'package:http/http.dart' as http;

import '../../core/constants.dart';
import 'network_response.dart';

class Api {
  Api._internal();
  static final _instance = Api._internal();
  factory Api() => _instance;

  NetworkResponse _getResponse(http.Response response) {
    return NetworkResponse(
      body: response.body,
      statusCode: response.statusCode,
    );
  }

  Map<String, String> _getHeaders({required bool isAuthenticated}) {
    if (!isAuthenticated) {
      return {'Content-Type': 'application/json;charset=utf-8'};
    }

    return {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer ${Constants.bearerToken}',
    };
  }

  Future<NetworkResponse> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.get(
        Uri.https(
          Constants.baseUrl,
          '${Constants.apiVersion}/$path',
          queryParameters,
        ),
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NetworkResponse> post({
    required String path,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.post(
        Uri.https(Constants.baseUrl, '${Constants.apiVersion}/$path'),
        body: body,
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NetworkResponse> put({
    required String path,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.put(
        Uri.https(Constants.baseUrl, '${Constants.apiVersion}/$path'),
        body: body,
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NetworkResponse> delete({
    required String path,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.delete(
        Uri.https(Constants.baseUrl, '${Constants.apiVersion}/$path'),
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NetworkResponse> patch({
    required String path,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.patch(
        Uri.https(Constants.baseUrl, '${Constants.apiVersion}/$path'),
        body: body,
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<NetworkResponse> head({
    required String path,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.head(
        Uri.https(Constants.baseUrl, '${Constants.apiVersion}/$path'),
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e) {
      rethrow;
    }
  }
}

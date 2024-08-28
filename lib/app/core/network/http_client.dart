import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../data/models/error_response_body.dart';
import '../constants/constants.dart';
import 'api_client.dart';
import 'network_response.dart';

class HttpClient implements ApiClient {
  Map<String, String> _getHeaders({required bool isAuthenticated}) {
    if (!isAuthenticated) {
      return {'Content-Type': 'application/json;charset=utf-8'};
    }

    return {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer ${Constants.bearerToken}',
    };
  }

  NetworkResponse _getResponse(http.Response response) {
    return NetworkResponse(
      body: response.body,
      statusCode: response.statusCode,
    );
  }

  @override
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
    } catch (e, s) {
      if (kDebugMode) {
        print('Api get Error ==> $e');
        print('Api get Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'Api',
        methodName: 'get',
      );

      final errorJsonBody = errorResponse.toEncodedJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }

  @override
  Future<NetworkResponse> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.post(
        Uri.https(
          Constants.baseUrl,
          '${Constants.apiVersion}/$path',
          queryParameters,
        ),
        body: body,
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e, s) {
      if (kDebugMode) {
        print('Api post Error ==> $e');
        print('Api post Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'Api',
        methodName: 'post',
      );

      final errorJsonBody = errorResponse.toEncodedJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }

  @override
  Future<NetworkResponse> put({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.put(
        Uri.https(
          Constants.baseUrl,
          '${Constants.apiVersion}/$path',
          queryParameters,
        ),
        body: body,
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e, s) {
      if (kDebugMode) {
        print('Api put Error ==> $e');
        print('Api put Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'Api',
        methodName: 'put',
      );

      final errorJsonBody = errorResponse.toEncodedJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }

  @override
  Future<NetworkResponse> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.delete(
        Uri.https(
          Constants.baseUrl,
          '${Constants.apiVersion}/$path',
          queryParameters,
        ),
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e, s) {
      if (kDebugMode) {
        print('Api delete Error ==> $e');
        print('Api delete Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'Api',
        methodName: 'delete',
      );

      final errorJsonBody = errorResponse.toEncodedJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }

  @override
  Future<NetworkResponse> patch({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.patch(
        Uri.https(
          Constants.baseUrl,
          '${Constants.apiVersion}/$path',
          queryParameters,
        ),
        body: body,
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e, s) {
      if (kDebugMode) {
        print('Api patch Error ==> $e');
        print('Api patch Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'Api',
        methodName: 'patch',
      );

      final errorJsonBody = errorResponse.toEncodedJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }

  @override
  Future<NetworkResponse> head({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await http.head(
        Uri.https(
          Constants.baseUrl,
          '${Constants.apiVersion}/$path',
          queryParameters,
        ),
        headers: _getHeaders(isAuthenticated: isAuthenticated),
      );

      return _getResponse(response);
    } catch (e, s) {
      if (kDebugMode) {
        print('Api head Error ==> $e');
        print('Api head Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'Api',
        methodName: 'patch',
      );

      final errorJsonBody = errorResponse.toEncodedJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }
}

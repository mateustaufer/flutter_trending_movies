import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/constants.dart';
import '../models/error_response_body.dart';
import 'network_response.dart';

class Api {
  Api._internal();
  static final instance = Api._internal();

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

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
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

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
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

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
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

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
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

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
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

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }
}

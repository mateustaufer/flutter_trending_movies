import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/constants/constants.dart';
import '../models/error_response_body.dart';
import 'api_client.dart';
import 'network_response.dart';

class DioClient implements ApiClient {
  Options _getOptions({required bool isAuthenticated}) {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    if (isAuthenticated) {
      headers = {
        'Content-Type': 'application/json;charset=utf-8',
        'Authorization': 'Bearer ${Constants.bearerToken}',
      };
    }

    return Options(headers: headers);
  }

  NetworkResponse _getResponse(Response response) {
    return NetworkResponse(
      body: response.data,
      statusCode: response.statusCode ?? 500,
    );
  }

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://${Constants.baseUrl}/${Constants.apiVersion}/',
    ),
  );

  @override
  Future<NetworkResponse> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await _dio.get<String>(
        path,
        queryParameters: queryParameters,
        options: _getOptions(isAuthenticated: isAuthenticated),
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

  @override
  Future<NetworkResponse> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await _dio.post<String>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: _getOptions(isAuthenticated: isAuthenticated),
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

  @override
  Future<NetworkResponse> put({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await _dio.put<String>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: _getOptions(isAuthenticated: isAuthenticated),
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

  @override
  Future<NetworkResponse> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await _dio.delete<String>(
        path,
        queryParameters: queryParameters,
        options: _getOptions(isAuthenticated: isAuthenticated),
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

  @override
  Future<NetworkResponse> patch({
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> body,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await _dio.patch<String>(
        path,
        queryParameters: queryParameters,
        data: body,
        options: _getOptions(isAuthenticated: isAuthenticated),
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

  @override
  Future<NetworkResponse> head({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool isAuthenticated = true,
  }) async {
    try {
      final response = await _dio.head<String>(
        path,
        queryParameters: queryParameters,
        options: _getOptions(isAuthenticated: isAuthenticated),
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
        methodName: 'head',
      );

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }
}

import 'package:flutter/foundation.dart';

import '../models/error_response_body.dart';
import '../network/api.dart';
import '../network/network_response.dart';

class MovieProvider {
  Future<NetworkResponse> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  }) async {
    try {
      final response = await Api.instance.get(
        path: 'trending/movie/$timeWindow',
        queryParameters: {'language': language},
      );

      return response;
    } catch (e, s) {
      if (kDebugMode) {
        print('MovieProvider fetchTrendingMoviesList Error ==> $e');
        print('MovieProvider fetchTrendingMoviesList Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'MovieProvider',
        methodName: 'fetchTrendingMoviesList',
      );

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }

  Future<NetworkResponse> fetchMovieDetails({
    required String movieId,
    String language = 'pt-BR',
  }) async {
    try {
      final response = await Api.instance.get(
        path: 'movie/$movieId',
        queryParameters: {'language': language},
      );

      return response;
    } catch (e, s) {
      if (kDebugMode) {
        print('MovieProvider fetchMovieDetails Error ==> $e');
        print('MovieProvider fetchMovieDetails Stack ==> $s');
      }

      final errorResponse = ErrorResponseBody.fromCatch(
        error: e,
        stackTrace: s,
        className: 'MovieProvider',
        methodName: 'fetchMovieDetails',
      );

      final errorJsonBody = errorResponse.toRawJson();

      return NetworkResponse(body: errorJsonBody, statusCode: 500);
    }
  }
}

import 'package:flutter/foundation.dart';

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

      rethrow;
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

      rethrow;
    }
  }
}

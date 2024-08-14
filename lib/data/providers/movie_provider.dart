import '../network/api.dart';
import '../network/network_response.dart';

class MovieProvider {
  Future<NetworkResponse> fetchMoviesList({
    required int listId,
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final response = await Api.method.get(
        path: 'list/$listId',
        queryParameters: {
          'language': language,
          'page': page.toString(),
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<NetworkResponse> fetchTrendingMoviesList({
    required String timeWindow,
    String language = 'pt-BR',
  }) async {
    try {
      final response = await Api.method.get(
        path: '/trending/movie/$timeWindow',
        queryParameters: {'language': language},
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

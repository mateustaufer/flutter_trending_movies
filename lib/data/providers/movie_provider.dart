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
    } catch (e) {
      rethrow;
    }
  }
}

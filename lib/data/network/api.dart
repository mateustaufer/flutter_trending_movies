import 'package:http/http.dart' as http;

import 'constants.dart';
import 'network_response.dart';

class Api {
  static final api = Api();

  NetworkResponse getResponse(http.Response response) {
    return NetworkResponse(
      body: response.body,
      statusCode: response.statusCode,
    );
  }

  static Future<NetworkResponse> get({required String path}) async {
    try {
      final response = await http.get(Uri.https(Constants.baseUrl, path));

      return api.getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NetworkResponse> post({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.post(
        Uri.https(Constants.baseUrl, path),
        body: body,
      );

      return api.getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NetworkResponse> put({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.put(
        Uri.https(Constants.baseUrl, path),
        body: body,
      );

      return api.getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NetworkResponse> delete({required String path}) async {
    try {
      final response = await http.delete(Uri.https(Constants.baseUrl, path));

      return api.getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NetworkResponse> patch({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.patch(
        Uri.https(Constants.baseUrl, path),
        body: body,
      );

      return api.getResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NetworkResponse> head({required String path}) async {
    try {
      final response = await http.head(Uri.https(Constants.baseUrl, path));

      return api.getResponse(response);
    } catch (e) {
      rethrow;
    }
  }
}

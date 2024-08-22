import 'dart:convert';

class ErrorResponse {
  bool? success;
  int? statusCode;
  String? statusMessage;
  String? errorMessage;

  ErrorResponse({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.errorMessage,
  });

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromMap(json.decode(str));

  ErrorResponse.fromMap(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = int.tryParse(json['status_code'].toString());
    statusMessage = json['status_message'];
    errorMessage = json['error_message'];
  }
}

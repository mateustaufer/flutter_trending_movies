import 'dart:convert';

class ResponseError {
  bool? success;
  int? statusCode;
  String? statusMessage;
  String? errorMessage;

  ResponseError({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.errorMessage,
  });

  factory ResponseError.fromRawJson(String str) =>
      ResponseError.fromMap(json.decode(str));

  ResponseError.fromMap(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = int.tryParse(json['status_code'].toString());
    statusMessage = json['status_message'];
    errorMessage = json['error_message'];
  }
}

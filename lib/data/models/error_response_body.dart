import 'dart:convert';

class ErrorResponseBody {
  bool? success;
  int? statusCode;
  String? statusMessage;
  String? errorMessage;

  ErrorResponseBody({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.errorMessage,
  });

  ErrorResponseBody copyWith({
    bool? success,
    int? statusCode,
    String? statusMessage,
    String? errorMessage,
  }) {
    return ErrorResponseBody(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory ErrorResponseBody.fromRawJson(String str) =>
      ErrorResponseBody.fromMap(json.decode(str));

  ErrorResponseBody.fromMap(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = int.tryParse(json['status_code'].toString());
    statusMessage = json['status_message'];
    errorMessage = json['error_message'];
  }

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (success != null) data['success'] = success;
    if (statusCode != null) data['status_code'] = statusCode;
    if (statusMessage != null) data['status_message'] = statusMessage;
    if (errorMessage != null) data['error_message'] = errorMessage;

    return data;
  }

  factory ErrorResponseBody.fromCatch({
    required Object error,
    required StackTrace stackTrace,
    String? className,
    String? methodName,
  }) {
    return ErrorResponseBody(
      success: false,
      statusCode: 500,
      statusMessage: '$className $methodName',
      errorMessage: '$error: $stackTrace',
    );
  }
}

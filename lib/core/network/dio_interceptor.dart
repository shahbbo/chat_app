import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("🚀 Request to ${options.uri} with headers: ${options.headers}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: unused_element
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("❌ Dio Error: ${err.message}");

    final errorMessages = {
      DioExceptionType.connectionTimeout: "Connection Timeout",
      DioExceptionType.sendTimeout: "Send Timeout",
      DioExceptionType.receiveTimeout: "Receive Timeout",
      DioExceptionType.cancel: "Request Cancelled",
      DioExceptionType.connectionError: "No Internet Connection",
      DioExceptionType.badResponse: "Bad Response: ${err.response?.statusCode}",
    };
    err = err.copyWith(error: errorMessages[err.type] ?? "Unexpected Error");

    handler.next(err);
  }
}

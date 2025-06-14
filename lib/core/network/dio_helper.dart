import 'package:dio/dio.dart';

import '../constants/endpoint_constants.dart';
import 'dio_interceptor.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio();
    dio.interceptors.add(DioInterceptor());
  }


  String? token = '';

  Future<Response> get(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return dio.get(
      EndpointConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: {
        'token': token,
        ...?headers
      }),
    );
  }

  Future<Response> post(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post(EndpointConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          'token': token,
          ...?headers
        }, validateStatus: (status) => true));
  }

  Future<Response> delete(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.delete(EndpointConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          'token': token
          ,...?headers
        }, validateStatus: (status) => true));
  }

  Future<Response> update(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.put(EndpointConstants.baseUrl + endPoint,
        data: body,
        options: Options(headers: {
          'token': token
          ,...?headers
        }, validateStatus: (status) => true));
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'failures.dart';

class ApiHelper {
  static Future<Either<Failures, T>> safeApiCall<T>(
      Future<Response> Function() request,
      T Function(dynamic data) fromJson,
      ) async {
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.none) {
      return Left(NetworkFailure());
    }

    try {
      final response = await request();

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(fromJson(response.data));
        } else {
          return Left(_handleHttpError(response));
        }
      } else {
        return Left(UnknownFailure('Unknown Response Status'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  static Failures _handleHttpError(Response response) {
    final statusCode = response.statusCode ?? 520;
    final dataMessage = response.data.toString();

    switch (statusCode) {
      case 400:
        return BadRequestFailure("Bad Request: $dataMessage");
      case 401:
        return UnauthorizedFailure("Unauthorized: $dataMessage");
      case 403:
        return ForbiddenFailure("Forbidden: $dataMessage");
      case 404:
        return NotFoundFailure("Not Found: $dataMessage");
      case 409:
        return ConflictFailure("Conflict: $dataMessage");
      case 422:
        return UnprocessableEntityFailure("Unprocessable Entity: $dataMessage");
      case 429:
        return RateLimitExceededFailure("Rate Limit Exceeded: $dataMessage");
      case 500:
        return InternalServerErrorFailure("Internal Server Error");
      case 503:
        return ServiceUnavailableFailure("Service Unavailable");
      case 501:
        return UnsupportedOperationFailure("Not Implemented");
      case 502:
        return DependencyFailure("Bad Gateway or Dependency Failure");
      case 507:
        return ResourceLimitExceededFailure("Resource Limit Exceeded");
      default:
        return CustomFailure("Unexpected Error: $dataMessage", statusCode);
    }
  }

  static Failures _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure("Timeout occurred");
      case DioExceptionType.badResponse:
        final response = e.response;
        if (response != null) {
          return _handleHttpError(response);
        } else {
          return UnknownFailure("Bad Response with no details");
        }
      case DioExceptionType.cancel:
        return CustomFailure("Request Cancelled", 499);
      case DioExceptionType.connectionError:
        return NetworkFailure("Connection Error");
      default:
        return UnknownFailure("Unknown Dio Error: ${e.message}");
    }
  }

  static Future<Either<Failures, T>> safeApiCallWithInterceptor<T>(
      Future<Response> Function() apiCall,
      T Function(dynamic) fromJson,
      ) async {
    try {
      var response = await apiCall();
      return Right(fromJson(response.data));
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}

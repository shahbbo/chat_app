abstract class Failures {
 final String message;
 final int statusCode;


 Failures(this.message, this.statusCode);
}


class ServerFailure extends Failures {
 ServerFailure([super.message = 'Server Error', super.statusCode = 500]);
}

class CacheFailure extends Failures {
 CacheFailure([super.message = 'Cache Error', super.statusCode = 500]);
}

class NetworkFailure extends Failures {
 NetworkFailure([super.message = 'Network Error', super.statusCode = 503]);
}

class UnauthorizedFailure extends Failures {
 UnauthorizedFailure([super.message = 'Unauthorized Access', super.statusCode = 401]);
}

class NotFoundFailure extends Failures {
 NotFoundFailure([super.message = 'Resource Not Found', super.statusCode = 404]);
}

class BadRequestFailure extends Failures {
 BadRequestFailure([super.message = 'Bad Request', super.statusCode = 400]);
}

class TimeoutFailure extends Failures {
 TimeoutFailure([super.message = 'Request Timeout', super.statusCode = 408]);
}

class UnknownFailure extends Failures {
 UnknownFailure([super.message = 'Unknown Error', super.statusCode = 520]);
}

class ValidationFailure extends Failures {
 ValidationFailure([super.message = 'Validation Error', super.statusCode = 422]);
}

class ConflictFailure extends Failures {
 ConflictFailure([super.message = 'Conflict Error', super.statusCode = 409]);
}

class ForbiddenFailure extends Failures {
 ForbiddenFailure([super.message = 'Forbidden Access', super.statusCode = 403]);
}

class ServiceUnavailableFailure extends Failures {
 ServiceUnavailableFailure([super.message = 'Service Unavailable', super.statusCode = 503]);
}

class RateLimitExceededFailure extends Failures {
 RateLimitExceededFailure([super.message = 'Rate Limit Exceeded', super.statusCode = 429]);
}

class InternalServerErrorFailure extends Failures {
 InternalServerErrorFailure([super.message = 'Internal Server Error', super.statusCode = 500]);
}

class DependencyFailure extends Failures {
 DependencyFailure([super.message = 'Dependency Error', super.statusCode = 502]);
}

class DataNotFoundFailure extends Failures {
 DataNotFoundFailure([super.message = 'Data Not Found', super.statusCode = 204]);
}

class AuthenticationFailure extends Failures {
 AuthenticationFailure([super.message = 'Authentication Failed', super.statusCode = 401]);
}

class PermissionDeniedFailure extends Failures {
 PermissionDeniedFailure([super.message = 'Permission Denied', super.statusCode = 403]);
}

class ResourceLimitExceededFailure extends Failures {
 ResourceLimitExceededFailure([super.message = 'Resource Limit Exceeded', super.statusCode = 507]);
}

class UnsupportedOperationFailure extends Failures {
 UnsupportedOperationFailure([super.message = 'Unsupported Operation', super.statusCode = 501]);
}

class PreconditionFailedFailure extends Failures {
 PreconditionFailedFailure([super.message = 'Precondition Failed', super.statusCode = 412]);
}

class UnprocessableEntityFailure extends Failures {
 UnprocessableEntityFailure([super.message = 'Unprocessable Entity', super.statusCode = 422]);
}


class CustomFailure extends Failures {
  CustomFailure(super.message, super.statusCode);
}





class CustomException implements Exception {
  const CustomException(
    this.message,
    this.errorCode,
  ) : super();
  final String message;
  final int errorCode;
}

class UnknownException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  UnknownException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'Fetch Data Exception';
    result = message;
    return result;
  }
}

class BadRequestException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  BadRequestException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'Bad Request Exception';
    result = message;
    return result;
  }
}

class ForbiddenException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  ForbiddenException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'Forbidden Exception';
    result = message;
    return result;
  }
}

class UnauthorizedException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  UnauthorizedException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'Unauthorized Exception';
    result = message;
    return result;
  }
}

class NotFoundException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  NotFoundException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'Not Found Exception';
    result = message;
    return result;
  }
}

class ServerDownException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  ServerDownException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'Server Down Exception';
    result = message;
    return result;
  }
}

class NoInternetException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  NoInternetException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'No Internet Exception';
    result = message;
    return result;
  }
}

class CustomTimeoutException implements CustomException {
  @override
  final String message;
  @override
  final int errorCode;

  CustomTimeoutException({
    required this.message,
    required this.errorCode,
  });

  @override
  String toString() {
    String result = 'No Internet Exception';
    result = message;
    return result;
  }
}

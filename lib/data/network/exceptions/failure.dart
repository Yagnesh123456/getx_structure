class Failure {
  String errorMessage;
  String errorCode;
  String? loggedErrorMessage;
  Failure({
    required this.errorMessage,
    required this.errorCode,
    this.loggedErrorMessage,
  });
}

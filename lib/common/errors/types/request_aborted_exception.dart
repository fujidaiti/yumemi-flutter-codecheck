class RequestAbortedException implements Exception {
  const RequestAbortedException(this.message);

  final String message;

  @override
  String toString() => "$RequestAbortedException: $message";
}

final class UnknownServerException implements Exception {
  final String? message;
  UnknownServerException([this.message]);

  @override
  String toString() {
    return 'UnknownServerException: $message';
  }
}

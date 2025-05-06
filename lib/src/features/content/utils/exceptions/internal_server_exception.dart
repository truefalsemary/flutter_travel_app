final class InternalServerException implements Exception {
  final String? message;
  InternalServerException([this.message]);

  @override
  String toString() {
    return 'InternalServerException: $message';
  }
}

final class InvalidArgumentException implements Exception {
  final String? message;
  InvalidArgumentException([this.message]);

  @override
  String toString() {
    return 'InvalidArgumentException: $message';
  }
}

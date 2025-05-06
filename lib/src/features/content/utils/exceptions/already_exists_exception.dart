final class AlreadyExistsException implements Exception {
  final String? message;
  AlreadyExistsException([this.message]);

  @override
  String toString() {
    return 'AlreadyExistsException: $message';
  }
}

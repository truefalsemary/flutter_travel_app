import 'package:grpc/grpc.dart';

sealed class BaseGrpcException implements Exception {
  final String featureName;
  final String? details;
  final int? code;

  const BaseGrpcException({
    required this.featureName,
    this.details,
    this.code,
  });
}

class AlreadyExistsGrpcException extends BaseGrpcException {
  const AlreadyExistsGrpcException({
    required super.featureName,
    super.details,
    super.code,
  });

  @override
  String toString() => '${featureName}AlreadyExistsGrpcException';
}

class InvalidArgumentGrpcException extends BaseGrpcException {
  const InvalidArgumentGrpcException({
    required super.featureName,
    super.details,
    super.code,
  });

  @override
  String toString() => '${featureName}InvalidArgumentGrpcException';
}

class InternalServerGrpcException extends BaseGrpcException {
  const InternalServerGrpcException({
    required super.featureName,
    super.details,
    super.code,
  });

  @override
  String toString() => '${featureName}InternalServerGrpcException';
}

class UnknownGrpcException extends BaseGrpcException {
  const UnknownGrpcException({
    required super.featureName,
    super.details,
    super.code,
  });

  @override
  String toString() => '${featureName}UnknownGrpcException';
}

extension GrpcErrorToException on GrpcError {
  BaseGrpcException toCustomGrpcException({
    required String featureName,
  }) =>
      switch (this) {
        GrpcError.alreadyExists => AlreadyExistsGrpcException(
            featureName: featureName,
            details: message,
            code: code,
          ),
        GrpcError.invalidArgument => InvalidArgumentGrpcException(
            featureName: featureName,
            details: message,
            code: code,
          ),
        GrpcError.internal => InternalServerGrpcException(
            featureName: featureName,
            details: message,
            code: code,
          ),
        _ => UnknownGrpcException(
            featureName: featureName,
            details: message,
            code: code,
          ),
      };
}

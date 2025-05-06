import 'package:flutter_travel_app/src/features/content/utils/exceptions/already_exists_exception.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/internal_server_exception.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/invalid_arguments_exception.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/unknown_server_exception.dart';
import 'package:grpc/grpc.dart';

extension GrpcErrorToException on GrpcError {
  Exception get exception => switch (this) {
        GrpcError.alreadyExists => AlreadyExistsException(),
        GrpcError.invalidArgument => InvalidArgumentException(),
        GrpcError.internal => InternalServerException(),
        _ => UnknownServerException(),
      };
}

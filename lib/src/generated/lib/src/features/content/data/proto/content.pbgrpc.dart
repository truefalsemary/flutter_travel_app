//
//  Generated code. Do not modify.
//  source: lib/src/features/content/data/proto/content.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'content.pb.dart' as $0;

export 'content.pb.dart';

@$pb.GrpcServiceName('content.ContentService')
class ContentServiceClient extends $grpc.Client {
  static final _$getRoutes = $grpc.ClientMethod<$0.GetRoutesRequest, $0.GetRoutesResponse>(
      '/content.ContentService/GetRoutes',
      ($0.GetRoutesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRoutesResponse.fromBuffer(value));

  ContentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetRoutesResponse> getRoutes($0.GetRoutesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoutes, request, options: options);
  }
}

@$pb.GrpcServiceName('content.ContentService')
abstract class ContentServiceBase extends $grpc.Service {
  $core.String get $name => 'content.ContentService';

  ContentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetRoutesRequest, $0.GetRoutesResponse>(
        'GetRoutes',
        getRoutes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRoutesRequest.fromBuffer(value),
        ($0.GetRoutesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetRoutesResponse> getRoutes_Pre($grpc.ServiceCall $call, $async.Future<$0.GetRoutesRequest> $request) async {
    return getRoutes($call, await $request);
  }

  $async.Future<$0.GetRoutesResponse> getRoutes($grpc.ServiceCall call, $0.GetRoutesRequest request);
}

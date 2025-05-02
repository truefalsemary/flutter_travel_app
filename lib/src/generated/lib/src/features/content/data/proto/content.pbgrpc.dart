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
  static final _$createPlace = $grpc.ClientMethod<$0.CreatePlaceRequest, $0.CreatePlaceResponse>(
      '/content.ContentService/CreatePlace',
      ($0.CreatePlaceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreatePlaceResponse.fromBuffer(value));
  static final _$uploadImages = $grpc.ClientMethod<$0.UploadImageRequest, $0.UploadImageResponse>(
      '/content.ContentService/UploadImages',
      ($0.UploadImageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadImageResponse.fromBuffer(value));
  static final _$createRoute = $grpc.ClientMethod<$0.CreateRouteRequest, $0.CreateRouteResponse>(
      '/content.ContentService/CreateRoute',
      ($0.CreateRouteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateRouteResponse.fromBuffer(value));

  ContentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetRoutesResponse> getRoutes($0.GetRoutesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoutes, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreatePlaceResponse> createPlace($0.CreatePlaceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPlace, request, options: options);
  }

  $grpc.ResponseFuture<$0.UploadImageResponse> uploadImages($async.Stream<$0.UploadImageRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadImages, request, options: options).single;
  }

  $grpc.ResponseFuture<$0.CreateRouteResponse> createRoute($0.CreateRouteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoute, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.CreatePlaceRequest, $0.CreatePlaceResponse>(
        'CreatePlace',
        createPlace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreatePlaceRequest.fromBuffer(value),
        ($0.CreatePlaceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadImageRequest, $0.UploadImageResponse>(
        'UploadImages',
        uploadImages,
        true,
        false,
        ($core.List<$core.int> value) => $0.UploadImageRequest.fromBuffer(value),
        ($0.UploadImageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateRouteRequest, $0.CreateRouteResponse>(
        'CreateRoute',
        createRoute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRouteRequest.fromBuffer(value),
        ($0.CreateRouteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetRoutesResponse> getRoutes_Pre($grpc.ServiceCall $call, $async.Future<$0.GetRoutesRequest> $request) async {
    return getRoutes($call, await $request);
  }

  $async.Future<$0.CreatePlaceResponse> createPlace_Pre($grpc.ServiceCall $call, $async.Future<$0.CreatePlaceRequest> $request) async {
    return createPlace($call, await $request);
  }

  $async.Future<$0.CreateRouteResponse> createRoute_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateRouteRequest> $request) async {
    return createRoute($call, await $request);
  }

  $async.Future<$0.GetRoutesResponse> getRoutes($grpc.ServiceCall call, $0.GetRoutesRequest request);
  $async.Future<$0.CreatePlaceResponse> createPlace($grpc.ServiceCall call, $0.CreatePlaceRequest request);
  $async.Future<$0.UploadImageResponse> uploadImages($grpc.ServiceCall call, $async.Stream<$0.UploadImageRequest> request);
  $async.Future<$0.CreateRouteResponse> createRoute($grpc.ServiceCall call, $0.CreateRouteRequest request);
}

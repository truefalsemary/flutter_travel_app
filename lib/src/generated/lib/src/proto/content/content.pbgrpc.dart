//
//  Generated code. Do not modify.
//  source: lib/src/proto/content/content.proto
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

import 'content.pb.dart' as $1;

export 'content.pb.dart';

@$pb.GrpcServiceName('content.ContentService')
class ContentServiceClient extends $grpc.Client {
  static final _$getRoutes =
      $grpc.ClientMethod<$1.GetRoutesRequest, $1.GetRoutesResponse>(
          '/content.ContentService/GetRoutes',
          ($1.GetRoutesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.GetRoutesResponse.fromBuffer(value));
  static final _$createPlace =
      $grpc.ClientMethod<$1.CreatePlaceRequest, $1.CreatePlaceResponse>(
          '/content.ContentService/CreatePlace',
          ($1.CreatePlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.CreatePlaceResponse.fromBuffer(value));
  static final _$uploadImages =
      $grpc.ClientMethod<$1.UploadImageRequest, $1.UploadImageResponse>(
          '/content.ContentService/UploadImages',
          ($1.UploadImageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.UploadImageResponse.fromBuffer(value));
  static final _$createRoute =
      $grpc.ClientMethod<$1.CreateRouteRequest, $1.CreateRouteResponse>(
          '/content.ContentService/CreateRoute',
          ($1.CreateRouteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.CreateRouteResponse.fromBuffer(value));

  ContentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.GetRoutesResponse> getRoutes(
      $1.GetRoutesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRoutes, request, options: options);
  }

  $grpc.ResponseFuture<$1.CreatePlaceResponse> createPlace(
      $1.CreatePlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPlace, request, options: options);
  }

  $grpc.ResponseFuture<$1.UploadImageResponse> uploadImages(
      $async.Stream<$1.UploadImageRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadImages, request, options: options)
        .single;
  }

  $grpc.ResponseFuture<$1.CreateRouteResponse> createRoute(
      $1.CreateRouteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoute, request, options: options);
  }
}

@$pb.GrpcServiceName('content.ContentService')
abstract class ContentServiceBase extends $grpc.Service {
  $core.String get $name => 'content.ContentService';

  ContentServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.GetRoutesRequest, $1.GetRoutesResponse>(
        'GetRoutes',
        getRoutes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetRoutesRequest.fromBuffer(value),
        ($1.GetRoutesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.CreatePlaceRequest, $1.CreatePlaceResponse>(
            'CreatePlace',
            createPlace_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.CreatePlaceRequest.fromBuffer(value),
            ($1.CreatePlaceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.UploadImageRequest, $1.UploadImageResponse>(
            'UploadImages',
            uploadImages,
            true,
            false,
            ($core.List<$core.int> value) =>
                $1.UploadImageRequest.fromBuffer(value),
            ($1.UploadImageResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.CreateRouteRequest, $1.CreateRouteResponse>(
            'CreateRoute',
            createRoute_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.CreateRouteRequest.fromBuffer(value),
            ($1.CreateRouteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.GetRoutesResponse> getRoutes_Pre($grpc.ServiceCall $call,
      $async.Future<$1.GetRoutesRequest> $request) async {
    return getRoutes($call, await $request);
  }

  $async.Future<$1.CreatePlaceResponse> createPlace_Pre($grpc.ServiceCall $call,
      $async.Future<$1.CreatePlaceRequest> $request) async {
    return createPlace($call, await $request);
  }

  $async.Future<$1.CreateRouteResponse> createRoute_Pre($grpc.ServiceCall $call,
      $async.Future<$1.CreateRouteRequest> $request) async {
    return createRoute($call, await $request);
  }

  $async.Future<$1.GetRoutesResponse> getRoutes(
      $grpc.ServiceCall call, $1.GetRoutesRequest request);
  $async.Future<$1.CreatePlaceResponse> createPlace(
      $grpc.ServiceCall call, $1.CreatePlaceRequest request);
  $async.Future<$1.UploadImageResponse> uploadImages(
      $grpc.ServiceCall call, $async.Stream<$1.UploadImageRequest> request);
  $async.Future<$1.CreateRouteResponse> createRoute(
      $grpc.ServiceCall call, $1.CreateRouteRequest request);
}

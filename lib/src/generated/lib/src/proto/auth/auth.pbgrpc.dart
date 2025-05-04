//
//  Generated code. Do not modify.
//  source: lib/src/proto/auth/auth.proto
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

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('auth.AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$registerStepOne =
      $grpc.ClientMethod<$0.RegisterStepOneRequest, $0.RegisterStepOneResponse>(
          '/auth.AuthService/RegisterStepOne',
          ($0.RegisterStepOneRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterStepOneResponse.fromBuffer(value));
  static final _$resendVerification = $grpc.ClientMethod<
          $0.ResendVerificationRequest, $0.ResendVerificationResponse>(
      '/auth.AuthService/ResendVerification',
      ($0.ResendVerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ResendVerificationResponse.fromBuffer(value));
  static final _$verifyRegistration = $grpc.ClientMethod<
          $0.VerifyRegistrationRequest, $0.VerifyRegistrationResponse>(
      '/auth.AuthService/VerifyRegistration',
      ($0.VerifyRegistrationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.VerifyRegistrationResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/auth.AuthService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$refreshToken =
      $grpc.ClientMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
          '/auth.AuthService/RefreshToken',
          ($0.RefreshTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RefreshTokenResponse.fromBuffer(value));
  static final _$validateAccessToken = $grpc.ClientMethod<
          $0.ValidateAccessTokenRequest, $0.ValidateAccessTokenResponse>(
      '/auth.AuthService/ValidateAccessToken',
      ($0.ValidateAccessTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ValidateAccessTokenResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RegisterStepOneResponse> registerStepOne(
      $0.RegisterStepOneRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerStepOne, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResendVerificationResponse> resendVerification(
      $0.ResendVerificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resendVerification, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyRegistrationResponse> verifyRegistration(
      $0.VerifyRegistrationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyRegistration, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.RefreshTokenResponse> refreshToken(
      $0.RefreshTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refreshToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.ValidateAccessTokenResponse> validateAccessToken(
      $0.ValidateAccessTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateAccessToken, request, options: options);
  }
}

@$pb.GrpcServiceName('auth.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterStepOneRequest,
            $0.RegisterStepOneResponse>(
        'RegisterStepOne',
        registerStepOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterStepOneRequest.fromBuffer(value),
        ($0.RegisterStepOneResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResendVerificationRequest,
            $0.ResendVerificationResponse>(
        'ResendVerification',
        resendVerification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResendVerificationRequest.fromBuffer(value),
        ($0.ResendVerificationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyRegistrationRequest,
            $0.VerifyRegistrationResponse>(
        'VerifyRegistration',
        verifyRegistration_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyRegistrationRequest.fromBuffer(value),
        ($0.VerifyRegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RefreshTokenRequest, $0.RefreshTokenResponse>(
            'RefreshToken',
            refreshToken_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RefreshTokenRequest.fromBuffer(value),
            ($0.RefreshTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ValidateAccessTokenRequest,
            $0.ValidateAccessTokenResponse>(
        'ValidateAccessToken',
        validateAccessToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ValidateAccessTokenRequest.fromBuffer(value),
        ($0.ValidateAccessTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterStepOneResponse> registerStepOne_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RegisterStepOneRequest> $request) async {
    return registerStepOne($call, await $request);
  }

  $async.Future<$0.ResendVerificationResponse> resendVerification_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ResendVerificationRequest> $request) async {
    return resendVerification($call, await $request);
  }

  $async.Future<$0.VerifyRegistrationResponse> verifyRegistration_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.VerifyRegistrationRequest> $request) async {
    return verifyRegistration($call, await $request);
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.RefreshTokenResponse> refreshToken_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RefreshTokenRequest> $request) async {
    return refreshToken($call, await $request);
  }

  $async.Future<$0.ValidateAccessTokenResponse> validateAccessToken_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ValidateAccessTokenRequest> $request) async {
    return validateAccessToken($call, await $request);
  }

  $async.Future<$0.RegisterStepOneResponse> registerStepOne(
      $grpc.ServiceCall call, $0.RegisterStepOneRequest request);
  $async.Future<$0.ResendVerificationResponse> resendVerification(
      $grpc.ServiceCall call, $0.ResendVerificationRequest request);
  $async.Future<$0.VerifyRegistrationResponse> verifyRegistration(
      $grpc.ServiceCall call, $0.VerifyRegistrationRequest request);
  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.RefreshTokenResponse> refreshToken(
      $grpc.ServiceCall call, $0.RefreshTokenRequest request);
  $async.Future<$0.ValidateAccessTokenResponse> validateAccessToken(
      $grpc.ServiceCall call, $0.ValidateAccessTokenRequest request);
}

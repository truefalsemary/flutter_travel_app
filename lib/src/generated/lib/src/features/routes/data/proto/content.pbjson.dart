//
//  Generated code. Do not modify.
//  source: lib/src/features/routes/data/proto/content.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use difficultyLevelDescriptor instead')
const DifficultyLevel$json = {
  '1': 'DifficultyLevel',
  '2': [
    {'1': 'EASY', '2': 0},
    {'1': 'MEDIUM', '2': 1},
    {'1': 'HARD', '2': 2},
  ],
};

/// Descriptor for `DifficultyLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List difficultyLevelDescriptor = $convert.base64Decode(
    'Cg9EaWZmaWN1bHR5TGV2ZWwSCAoERUFTWRAAEgoKBk1FRElVTRABEggKBEhBUkQQAg==');

@$core.Deprecated('Use getRoutesRequestDescriptor instead')
const GetRoutesRequest$json = {
  '1': 'GetRoutesRequest',
  '2': [
    {'1': 'difficulty_filter', '3': 1, '4': 1, '5': 14, '6': '.content.DifficultyLevel', '10': 'difficultyFilter'},
    {'1': 'distance_filter', '3': 2, '4': 1, '5': 11, '6': '.content.DistanceFilter', '10': 'distanceFilter'},
  ],
};

/// Descriptor for `GetRoutesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoutesRequestDescriptor = $convert.base64Decode(
    'ChBHZXRSb3V0ZXNSZXF1ZXN0EkUKEWRpZmZpY3VsdHlfZmlsdGVyGAEgASgOMhguY29udGVudC'
    '5EaWZmaWN1bHR5TGV2ZWxSEGRpZmZpY3VsdHlGaWx0ZXISQAoPZGlzdGFuY2VfZmlsdGVyGAIg'
    'ASgLMhcuY29udGVudC5EaXN0YW5jZUZpbHRlclIOZGlzdGFuY2VGaWx0ZXI=');

@$core.Deprecated('Use distanceFilterDescriptor instead')
const DistanceFilter$json = {
  '1': 'DistanceFilter',
  '2': [
    {'1': 'min_km', '3': 1, '4': 1, '5': 2, '9': 0, '10': 'minKm', '17': true},
    {'1': 'max_km', '3': 2, '4': 1, '5': 2, '9': 1, '10': 'maxKm', '17': true},
  ],
  '8': [
    {'1': '_min_km'},
    {'1': '_max_km'},
  ],
};

/// Descriptor for `DistanceFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List distanceFilterDescriptor = $convert.base64Decode(
    'Cg5EaXN0YW5jZUZpbHRlchIaCgZtaW5fa20YASABKAJIAFIFbWluS22IAQESGgoGbWF4X2ttGA'
    'IgASgCSAFSBW1heEttiAEBQgkKB19taW5fa21CCQoHX21heF9rbQ==');

@$core.Deprecated('Use getRoutesResponseDescriptor instead')
const GetRoutesResponse$json = {
  '1': 'GetRoutesResponse',
  '2': [
    {'1': 'routes', '3': 1, '4': 3, '5': 11, '6': '.content.Route', '10': 'routes'},
  ],
};

/// Descriptor for `GetRoutesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoutesResponseDescriptor = $convert.base64Decode(
    'ChFHZXRSb3V0ZXNSZXNwb25zZRImCgZyb3V0ZXMYASADKAsyDi5jb250ZW50LlJvdXRlUgZyb3'
    'V0ZXM=');

@$core.Deprecated('Use routeDescriptor instead')
const Route$json = {
  '1': 'Route',
  '2': [
    {'1': 'difficulty', '3': 1, '4': 1, '5': 14, '6': '.content.DifficultyLevel', '10': 'difficulty'},
    {'1': 'distance_km', '3': 2, '4': 1, '5': 2, '10': 'distanceKm'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'path_points', '3': 4, '4': 3, '5': 11, '6': '.content.Point', '10': 'pathPoints'},
    {'1': 'places', '3': 5, '4': 3, '5': 11, '6': '.content.Place', '10': 'places'},
    {'1': 'user_id', '3': 6, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `Route`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDescriptor = $convert.base64Decode(
    'CgVSb3V0ZRI4CgpkaWZmaWN1bHR5GAEgASgOMhguY29udGVudC5EaWZmaWN1bHR5TGV2ZWxSCm'
    'RpZmZpY3VsdHkSHwoLZGlzdGFuY2Vfa20YAiABKAJSCmRpc3RhbmNlS20SEgoEbmFtZRgDIAEo'
    'CVIEbmFtZRIvCgtwYXRoX3BvaW50cxgEIAMoCzIOLmNvbnRlbnQuUG9pbnRSCnBhdGhQb2ludH'
    'MSJgoGcGxhY2VzGAUgAygLMg4uY29udGVudC5QbGFjZVIGcGxhY2VzEhcKB3VzZXJfaWQYBiAB'
    'KAlSBnVzZXJJZA==');

@$core.Deprecated('Use pointDescriptor instead')
const Point$json = {
  '1': 'Point',
  '2': [
    {'1': 'lat', '3': 1, '4': 1, '5': 1, '10': 'lat'},
    {'1': 'lon', '3': 2, '4': 1, '5': 1, '10': 'lon'},
  ],
};

/// Descriptor for `Point`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointDescriptor = $convert.base64Decode(
    'CgVQb2ludBIQCgNsYXQYASABKAFSA2xhdBIQCgNsb24YAiABKAFSA2xvbg==');

@$core.Deprecated('Use placeImageDescriptor instead')
const PlaceImage$json = {
  '1': 'PlaceImage',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'placeholder', '3': 2, '4': 1, '5': 9, '10': 'placeholder'},
  ],
};

/// Descriptor for `PlaceImage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeImageDescriptor = $convert.base64Decode(
    'CgpQbGFjZUltYWdlEhAKA3VybBgBIAEoCVIDdXJsEiAKC3BsYWNlaG9sZGVyGAIgASgJUgtwbG'
    'FjZWhvbGRlcg==');

@$core.Deprecated('Use placeDescriptor instead')
const Place$json = {
  '1': 'Place',
  '2': [
    {'1': 'location', '3': 1, '4': 1, '5': 11, '6': '.content.Point', '10': 'location'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'place_images', '3': 5, '4': 3, '5': 11, '6': '.content.PlaceImage', '10': 'placeImages'},
  ],
};

/// Descriptor for `Place`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDescriptor = $convert.base64Decode(
    'CgVQbGFjZRIqCghsb2NhdGlvbhgBIAEoCzIOLmNvbnRlbnQuUG9pbnRSCGxvY2F0aW9uEhIKBG'
    '5hbWUYAiABKAlSBG5hbWUSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcxIgCgtkZXNjcmlwdGlv'
    'bhgEIAEoCVILZGVzY3JpcHRpb24SNgoMcGxhY2VfaW1hZ2VzGAUgAygLMhMuY29udGVudC5QbG'
    'FjZUltYWdlUgtwbGFjZUltYWdlcw==');


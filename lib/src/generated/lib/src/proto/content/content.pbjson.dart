//
//  Generated code. Do not modify.
//  source: lib/src/proto/content/content.proto
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
    {
      '1': 'difficulty_filter',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.content.DifficultyFilter',
      '10': 'difficultyFilter'
    },
    {
      '1': 'distance_filter',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.content.DistanceFilter',
      '10': 'distanceFilter'
    },
    {'1': 'search_query', '3': 3, '4': 1, '5': 9, '10': 'searchQuery'},
  ],
};

/// Descriptor for `GetRoutesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoutesRequestDescriptor = $convert.base64Decode(
    'ChBHZXRSb3V0ZXNSZXF1ZXN0EkYKEWRpZmZpY3VsdHlfZmlsdGVyGAEgASgLMhkuY29udGVudC'
    '5EaWZmaWN1bHR5RmlsdGVyUhBkaWZmaWN1bHR5RmlsdGVyEkAKD2Rpc3RhbmNlX2ZpbHRlchgC'
    'IAEoCzIXLmNvbnRlbnQuRGlzdGFuY2VGaWx0ZXJSDmRpc3RhbmNlRmlsdGVyEiEKDHNlYXJjaF'
    '9xdWVyeRgDIAEoCVILc2VhcmNoUXVlcnk=');

@$core.Deprecated('Use difficultyFilterDescriptor instead')
const DifficultyFilter$json = {
  '1': 'DifficultyFilter',
  '2': [
    {
      '1': 'min_difficulty',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.content.DifficultyLevel',
      '9': 0,
      '10': 'minDifficulty',
      '17': true
    },
    {
      '1': 'max_difficulty',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.content.DifficultyLevel',
      '9': 1,
      '10': 'maxDifficulty',
      '17': true
    },
  ],
  '8': [
    {'1': '_min_difficulty'},
    {'1': '_max_difficulty'},
  ],
};

/// Descriptor for `DifficultyFilter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List difficultyFilterDescriptor = $convert.base64Decode(
    'ChBEaWZmaWN1bHR5RmlsdGVyEkQKDm1pbl9kaWZmaWN1bHR5GAEgASgOMhguY29udGVudC5EaW'
    'ZmaWN1bHR5TGV2ZWxIAFINbWluRGlmZmljdWx0eYgBARJECg5tYXhfZGlmZmljdWx0eRgCIAEo'
    'DjIYLmNvbnRlbnQuRGlmZmljdWx0eUxldmVsSAFSDW1heERpZmZpY3VsdHmIAQFCEQoPX21pbl'
    '9kaWZmaWN1bHR5QhEKD19tYXhfZGlmZmljdWx0eQ==');

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
    {
      '1': 'routes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.content.Route',
      '10': 'routes'
    },
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
    {
      '1': 'difficulty',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.content.DifficultyLevel',
      '10': 'difficulty'
    },
    {'1': 'distance_km', '3': 2, '4': 1, '5': 2, '10': 'distanceKm'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'path_points',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.content.Point',
      '10': 'pathPoints'
    },
    {
      '1': 'places',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.content.Place',
      '10': 'places'
    },
    {'1': 'user_id', '3': 6, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'route_id', '3': 7, '4': 1, '5': 9, '10': 'routeId'},
    {'1': 'description', '3': 8, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Route`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDescriptor = $convert.base64Decode(
    'CgVSb3V0ZRI4CgpkaWZmaWN1bHR5GAEgASgOMhguY29udGVudC5EaWZmaWN1bHR5TGV2ZWxSCm'
    'RpZmZpY3VsdHkSHwoLZGlzdGFuY2Vfa20YAiABKAJSCmRpc3RhbmNlS20SEgoEbmFtZRgDIAEo'
    'CVIEbmFtZRIvCgtwYXRoX3BvaW50cxgEIAMoCzIOLmNvbnRlbnQuUG9pbnRSCnBhdGhQb2ludH'
    'MSJgoGcGxhY2VzGAUgAygLMg4uY29udGVudC5QbGFjZVIGcGxhY2VzEhcKB3VzZXJfaWQYBiAB'
    'KAlSBnVzZXJJZBIZCghyb3V0ZV9pZBgHIAEoCVIHcm91dGVJZBIgCgtkZXNjcmlwdGlvbhgIIA'
    'EoCVILZGVzY3JpcHRpb24=');

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

@$core.Deprecated('Use placeDescriptor instead')
const Place$json = {
  '1': 'Place',
  '2': [
    {
      '1': 'location',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.content.Point',
      '10': 'location'
    },
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {
      '1': 'images',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.content.Image',
      '10': 'images'
    },
    {'1': 'place_id', '3': 7, '4': 1, '5': 9, '10': 'placeId'},
  ],
};

/// Descriptor for `Place`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDescriptor = $convert.base64Decode(
    'CgVQbGFjZRIqCghsb2NhdGlvbhgBIAEoCzIOLmNvbnRlbnQuUG9pbnRSCGxvY2F0aW9uEhIKBG'
    '5hbWUYAiABKAlSBG5hbWUSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcxIgCgtkZXNjcmlwdGlv'
    'bhgEIAEoCVILZGVzY3JpcHRpb24SJgoGaW1hZ2VzGAUgAygLMg4uY29udGVudC5JbWFnZVIGaW'
    '1hZ2VzEhkKCHBsYWNlX2lkGAcgASgJUgdwbGFjZUlk');

@$core.Deprecated('Use imageDescriptor instead')
const Image$json = {
  '1': 'Image',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'placeholder', '3': 2, '4': 1, '5': 9, '10': 'placeholder'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode(
    'CgVJbWFnZRIQCgN1cmwYASABKAlSA3VybBIgCgtwbGFjZWhvbGRlchgCIAEoCVILcGxhY2Vob2'
    'xkZXI=');

@$core.Deprecated('Use createPlaceRequestDescriptor instead')
const CreatePlaceRequest$json = {
  '1': 'CreatePlaceRequest',
  '2': [
    {
      '1': 'location',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.content.Point',
      '10': 'location'
    },
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreatePlaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPlaceRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVQbGFjZVJlcXVlc3QSKgoIbG9jYXRpb24YASABKAsyDi5jb250ZW50LlBvaW50Ug'
    'hsb2NhdGlvbhISCgRuYW1lGAIgASgJUgRuYW1lEhgKB2FkZHJlc3MYAyABKAlSB2FkZHJlc3MS'
    'IAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use createPlaceResponseDescriptor instead')
const CreatePlaceResponse$json = {
  '1': 'CreatePlaceResponse',
  '2': [
    {'1': 'place_id', '3': 1, '4': 1, '5': 9, '10': 'placeId'},
  ],
};

/// Descriptor for `CreatePlaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPlaceResponseDescriptor =
    $convert.base64Decode(
        'ChNDcmVhdGVQbGFjZVJlc3BvbnNlEhkKCHBsYWNlX2lkGAEgASgJUgdwbGFjZUlk');

@$core.Deprecated('Use uploadImageRequestDescriptor instead')
const UploadImageRequest$json = {
  '1': 'UploadImageRequest',
  '2': [
    {
      '1': 'place_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'placeId',
      '17': true
    },
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'content', '3': 3, '4': 1, '5': 12, '10': 'content'},
  ],
  '8': [
    {'1': '_place_id'},
  ],
};

/// Descriptor for `UploadImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadImageRequestDescriptor = $convert.base64Decode(
    'ChJVcGxvYWRJbWFnZVJlcXVlc3QSHgoIcGxhY2VfaWQYASABKAlIAFIHcGxhY2VJZIgBARIaCg'
    'hmaWxlbmFtZRgCIAEoCVIIZmlsZW5hbWUSGAoHY29udGVudBgDIAEoDFIHY29udGVudEILCglf'
    'cGxhY2VfaWQ=');

@$core.Deprecated('Use uploadImageResponseDescriptor instead')
const UploadImageResponse$json = {
  '1': 'UploadImageResponse',
  '2': [
    {
      '1': 'images',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.content.Image',
      '10': 'images'
    },
  ],
};

/// Descriptor for `UploadImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadImageResponseDescriptor = $convert.base64Decode(
    'ChNVcGxvYWRJbWFnZVJlc3BvbnNlEiYKBmltYWdlcxgBIAMoCzIOLmNvbnRlbnQuSW1hZ2VSBm'
    'ltYWdlcw==');

@$core.Deprecated('Use createRouteRequestDescriptor instead')
const CreateRouteRequest$json = {
  '1': 'CreateRouteRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'difficulty',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.content.DifficultyLevel',
      '10': 'difficulty'
    },
    {'1': 'distance_km', '3': 3, '4': 1, '5': 2, '10': 'distanceKm'},
    {
      '1': 'path_points',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.content.Point',
      '10': 'pathPoints'
    },
    {'1': 'place_ids', '3': 5, '4': 3, '5': 9, '10': 'placeIds'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `CreateRouteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRouteRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVSb3V0ZVJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRI4CgpkaWZmaWN1bHR5GA'
    'IgASgOMhguY29udGVudC5EaWZmaWN1bHR5TGV2ZWxSCmRpZmZpY3VsdHkSHwoLZGlzdGFuY2Vf'
    'a20YAyABKAJSCmRpc3RhbmNlS20SLwoLcGF0aF9wb2ludHMYBCADKAsyDi5jb250ZW50LlBvaW'
    '50UgpwYXRoUG9pbnRzEhsKCXBsYWNlX2lkcxgFIAMoCVIIcGxhY2VJZHMSIAoLZGVzY3JpcHRp'
    'b24YBiABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use createRouteResponseDescriptor instead')
const CreateRouteResponse$json = {
  '1': 'CreateRouteResponse',
  '2': [
    {'1': 'route_id', '3': 1, '4': 1, '5': 9, '10': 'routeId'},
  ],
};

/// Descriptor for `CreateRouteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRouteResponseDescriptor =
    $convert.base64Decode(
        'ChNDcmVhdGVSb3V0ZVJlc3BvbnNlEhkKCHJvdXRlX2lkGAEgASgJUgdyb3V0ZUlk');

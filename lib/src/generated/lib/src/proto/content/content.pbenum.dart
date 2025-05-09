//
//  Generated code. Do not modify.
//  source: lib/src/proto/content/content.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RouteTransportType extends $pb.ProtobufEnum {
  static const RouteTransportType WALKING = RouteTransportType._(0, _omitEnumNames ? '' : 'WALKING');
  static const RouteTransportType CYCLING = RouteTransportType._(1, _omitEnumNames ? '' : 'CYCLING');
  static const RouteTransportType DRIVING = RouteTransportType._(2, _omitEnumNames ? '' : 'DRIVING');
  static const RouteTransportType PUBLIC_TRANSPORT = RouteTransportType._(3, _omitEnumNames ? '' : 'PUBLIC_TRANSPORT');

  static const $core.List<RouteTransportType> values = <RouteTransportType> [
    WALKING,
    CYCLING,
    DRIVING,
    PUBLIC_TRANSPORT,
  ];

  static final $core.Map<$core.int, RouteTransportType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RouteTransportType? valueOf($core.int value) => _byValue[value];

  const RouteTransportType._(super.v, super.n);
}

class RouteTheme extends $pb.ProtobufEnum {
  static const RouteTheme URBAN = RouteTheme._(0, _omitEnumNames ? '' : 'URBAN');
  static const RouteTheme OUTDOOR = RouteTheme._(1, _omitEnumNames ? '' : 'OUTDOOR');
  static const RouteTheme ADVENTURE = RouteTheme._(2, _omitEnumNames ? '' : 'ADVENTURE');
  static const RouteTheme PHOTOGRAPHY = RouteTheme._(3, _omitEnumNames ? '' : 'PHOTOGRAPHY');
  static const RouteTheme ROAD_TRIP = RouteTheme._(4, _omitEnumNames ? '' : 'ROAD_TRIP');

  static const $core.List<RouteTheme> values = <RouteTheme> [
    URBAN,
    OUTDOOR,
    ADVENTURE,
    PHOTOGRAPHY,
    ROAD_TRIP,
  ];

  static final $core.Map<$core.int, RouteTheme> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RouteTheme? valueOf($core.int value) => _byValue[value];

  const RouteTheme._(super.v, super.n);
}

class DifficultyLevel extends $pb.ProtobufEnum {
  static const DifficultyLevel EASY = DifficultyLevel._(0, _omitEnumNames ? '' : 'EASY');
  static const DifficultyLevel MEDIUM = DifficultyLevel._(1, _omitEnumNames ? '' : 'MEDIUM');
  static const DifficultyLevel HARD = DifficultyLevel._(2, _omitEnumNames ? '' : 'HARD');

  static const $core.List<DifficultyLevel> values = <DifficultyLevel> [
    EASY,
    MEDIUM,
    HARD,
  ];

  static final $core.Map<$core.int, DifficultyLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DifficultyLevel? valueOf($core.int value) => _byValue[value];

  const DifficultyLevel._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

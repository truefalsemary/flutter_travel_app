//
//  Generated code. Do not modify.
//  source: lib/src/features/routes/data/proto/content.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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

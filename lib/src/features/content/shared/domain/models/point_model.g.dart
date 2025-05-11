// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PointModelCWProxy {
  PointModel lat(double lat);

  PointModel lon(double lon);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PointModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PointModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PointModel call({
    double lat,
    double lon,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPointModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPointModel.copyWith.fieldName(...)`
class _$PointModelCWProxyImpl implements _$PointModelCWProxy {
  const _$PointModelCWProxyImpl(this._value);

  final PointModel _value;

  @override
  PointModel lat(double lat) => this(lat: lat);

  @override
  PointModel lon(double lon) => this(lon: lon);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PointModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PointModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PointModel call({
    Object? lat = const $CopyWithPlaceholder(),
    Object? lon = const $CopyWithPlaceholder(),
  }) {
    return PointModel(
      lat: lat == const $CopyWithPlaceholder()
          ? _value.lat
          // ignore: cast_nullable_to_non_nullable
          : lat as double,
      lon: lon == const $CopyWithPlaceholder()
          ? _value.lon
          // ignore: cast_nullable_to_non_nullable
          : lon as double,
    );
  }
}

extension $PointModelCopyWith on PointModel {
  /// Returns a callable class that can be used as follows: `instanceOfPointModel.copyWith(...)` or like so:`instanceOfPointModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PointModelCWProxy get copyWith => _$PointModelCWProxyImpl(this);
}

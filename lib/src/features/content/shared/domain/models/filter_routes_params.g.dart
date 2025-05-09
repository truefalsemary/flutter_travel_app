// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_routes_params.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AvailableFilterRoutesParamsCWProxy {
  AvailableFilterRoutesParams distanceFilter(
      DistanceFilterModel? distanceFilter);

  AvailableFilterRoutesParams minDifficulty(DifficultyLevel minDifficulty);

  AvailableFilterRoutesParams maxDifficulty(DifficultyLevel maxDifficulty);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AvailableFilterRoutesParams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AvailableFilterRoutesParams(...).copyWith(id: 12, name: "My name")
  /// ````
  AvailableFilterRoutesParams call({
    DistanceFilterModel? distanceFilter,
    DifficultyLevel minDifficulty,
    DifficultyLevel maxDifficulty,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAvailableFilterRoutesParams.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAvailableFilterRoutesParams.copyWith.fieldName(...)`
class _$AvailableFilterRoutesParamsCWProxyImpl
    implements _$AvailableFilterRoutesParamsCWProxy {
  const _$AvailableFilterRoutesParamsCWProxyImpl(this._value);

  final AvailableFilterRoutesParams _value;

  @override
  AvailableFilterRoutesParams distanceFilter(
          DistanceFilterModel? distanceFilter) =>
      this(distanceFilter: distanceFilter);

  @override
  AvailableFilterRoutesParams minDifficulty(DifficultyLevel minDifficulty) =>
      this(minDifficulty: minDifficulty);

  @override
  AvailableFilterRoutesParams maxDifficulty(DifficultyLevel maxDifficulty) =>
      this(maxDifficulty: maxDifficulty);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AvailableFilterRoutesParams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AvailableFilterRoutesParams(...).copyWith(id: 12, name: "My name")
  /// ````
  AvailableFilterRoutesParams call({
    Object? distanceFilter = const $CopyWithPlaceholder(),
    Object? minDifficulty = const $CopyWithPlaceholder(),
    Object? maxDifficulty = const $CopyWithPlaceholder(),
  }) {
    return AvailableFilterRoutesParams(
      distanceFilter: distanceFilter == const $CopyWithPlaceholder()
          ? _value.distanceFilter
          // ignore: cast_nullable_to_non_nullable
          : distanceFilter as DistanceFilterModel?,
      minDifficulty: minDifficulty == const $CopyWithPlaceholder()
          ? _value.minDifficulty
          // ignore: cast_nullable_to_non_nullable
          : minDifficulty as DifficultyLevel,
      maxDifficulty: maxDifficulty == const $CopyWithPlaceholder()
          ? _value.maxDifficulty
          // ignore: cast_nullable_to_non_nullable
          : maxDifficulty as DifficultyLevel,
    );
  }
}

extension $AvailableFilterRoutesParamsCopyWith on AvailableFilterRoutesParams {
  /// Returns a callable class that can be used as follows: `instanceOfAvailableFilterRoutesParams.copyWith(...)` or like so:`instanceOfAvailableFilterRoutesParams.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AvailableFilterRoutesParamsCWProxy get copyWith =>
      _$AvailableFilterRoutesParamsCWProxyImpl(this);
}

abstract class _$DistanceFilterModelCWProxy {
  DistanceFilterModel minDistance(double minDistance);

  DistanceFilterModel maxDistance(double maxDistance);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DistanceFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DistanceFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  DistanceFilterModel call({
    double minDistance,
    double maxDistance,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDistanceFilterModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDistanceFilterModel.copyWith.fieldName(...)`
class _$DistanceFilterModelCWProxyImpl implements _$DistanceFilterModelCWProxy {
  const _$DistanceFilterModelCWProxyImpl(this._value);

  final DistanceFilterModel _value;

  @override
  DistanceFilterModel minDistance(double minDistance) =>
      this(minDistance: minDistance);

  @override
  DistanceFilterModel maxDistance(double maxDistance) =>
      this(maxDistance: maxDistance);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DistanceFilterModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DistanceFilterModel(...).copyWith(id: 12, name: "My name")
  /// ````
  DistanceFilterModel call({
    Object? minDistance = const $CopyWithPlaceholder(),
    Object? maxDistance = const $CopyWithPlaceholder(),
  }) {
    return DistanceFilterModel(
      minDistance: minDistance == const $CopyWithPlaceholder()
          ? _value.minDistance
          // ignore: cast_nullable_to_non_nullable
          : minDistance as double,
      maxDistance: maxDistance == const $CopyWithPlaceholder()
          ? _value.maxDistance
          // ignore: cast_nullable_to_non_nullable
          : maxDistance as double,
    );
  }
}

extension $DistanceFilterModelCopyWith on DistanceFilterModel {
  /// Returns a callable class that can be used as follows: `instanceOfDistanceFilterModel.copyWith(...)` or like so:`instanceOfDistanceFilterModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistanceFilterModelCWProxy get copyWith =>
      _$DistanceFilterModelCWProxyImpl(this);
}

abstract class _$UserFilterRoutesParamsCWProxy {
  UserFilterRoutesParams minDifficulty(DifficultyLevel? minDifficulty);

  UserFilterRoutesParams maxDifficulty(DifficultyLevel? maxDifficulty);

  UserFilterRoutesParams minDistance(double? minDistance);

  UserFilterRoutesParams maxDistance(double? maxDistance);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserFilterRoutesParams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserFilterRoutesParams(...).copyWith(id: 12, name: "My name")
  /// ````
  UserFilterRoutesParams call({
    DifficultyLevel? minDifficulty,
    DifficultyLevel? maxDifficulty,
    double? minDistance,
    double? maxDistance,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserFilterRoutesParams.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserFilterRoutesParams.copyWith.fieldName(...)`
class _$UserFilterRoutesParamsCWProxyImpl
    implements _$UserFilterRoutesParamsCWProxy {
  const _$UserFilterRoutesParamsCWProxyImpl(this._value);

  final UserFilterRoutesParams _value;

  @override
  UserFilterRoutesParams minDifficulty(DifficultyLevel? minDifficulty) =>
      this(minDifficulty: minDifficulty);

  @override
  UserFilterRoutesParams maxDifficulty(DifficultyLevel? maxDifficulty) =>
      this(maxDifficulty: maxDifficulty);

  @override
  UserFilterRoutesParams minDistance(double? minDistance) =>
      this(minDistance: minDistance);

  @override
  UserFilterRoutesParams maxDistance(double? maxDistance) =>
      this(maxDistance: maxDistance);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserFilterRoutesParams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserFilterRoutesParams(...).copyWith(id: 12, name: "My name")
  /// ````
  UserFilterRoutesParams call({
    Object? minDifficulty = const $CopyWithPlaceholder(),
    Object? maxDifficulty = const $CopyWithPlaceholder(),
    Object? minDistance = const $CopyWithPlaceholder(),
    Object? maxDistance = const $CopyWithPlaceholder(),
  }) {
    return UserFilterRoutesParams(
      minDifficulty: minDifficulty == const $CopyWithPlaceholder()
          ? _value.minDifficulty
          // ignore: cast_nullable_to_non_nullable
          : minDifficulty as DifficultyLevel?,
      maxDifficulty: maxDifficulty == const $CopyWithPlaceholder()
          ? _value.maxDifficulty
          // ignore: cast_nullable_to_non_nullable
          : maxDifficulty as DifficultyLevel?,
      minDistance: minDistance == const $CopyWithPlaceholder()
          ? _value.minDistance
          // ignore: cast_nullable_to_non_nullable
          : minDistance as double?,
      maxDistance: maxDistance == const $CopyWithPlaceholder()
          ? _value.maxDistance
          // ignore: cast_nullable_to_non_nullable
          : maxDistance as double?,
    );
  }
}

extension $UserFilterRoutesParamsCopyWith on UserFilterRoutesParams {
  /// Returns a callable class that can be used as follows: `instanceOfUserFilterRoutesParams.copyWith(...)` or like so:`instanceOfUserFilterRoutesParams.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserFilterRoutesParamsCWProxy get copyWith =>
      _$UserFilterRoutesParamsCWProxyImpl(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_route_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateRouteModelCWProxy {
  CreateRouteModel name(String name);

  CreateRouteModel description(String description);

  CreateRouteModel placeIds(Iterable<String> placeIds);

  CreateRouteModel transportType(RouteTransportType transportType);

  CreateRouteModel theme(RouteTheme theme);

  CreateRouteModel difficulty(DifficultyLevel difficulty);

  CreateRouteModel distanceKm(double distanceKm);

  CreateRouteModel pathPoints(Iterable<PointModel> pathPoints);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateRouteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateRouteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateRouteModel call({
    String name,
    String description,
    Iterable<String> placeIds,
    RouteTransportType transportType,
    RouteTheme theme,
    DifficultyLevel difficulty,
    double distanceKm,
    Iterable<PointModel> pathPoints,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateRouteModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateRouteModel.copyWith.fieldName(...)`
class _$CreateRouteModelCWProxyImpl implements _$CreateRouteModelCWProxy {
  const _$CreateRouteModelCWProxyImpl(this._value);

  final CreateRouteModel _value;

  @override
  CreateRouteModel name(String name) => this(name: name);

  @override
  CreateRouteModel description(String description) =>
      this(description: description);

  @override
  CreateRouteModel placeIds(Iterable<String> placeIds) =>
      this(placeIds: placeIds);

  @override
  CreateRouteModel transportType(RouteTransportType transportType) =>
      this(transportType: transportType);

  @override
  CreateRouteModel theme(RouteTheme theme) => this(theme: theme);

  @override
  CreateRouteModel difficulty(DifficultyLevel difficulty) =>
      this(difficulty: difficulty);

  @override
  CreateRouteModel distanceKm(double distanceKm) =>
      this(distanceKm: distanceKm);

  @override
  CreateRouteModel pathPoints(Iterable<PointModel> pathPoints) =>
      this(pathPoints: pathPoints);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateRouteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateRouteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateRouteModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? placeIds = const $CopyWithPlaceholder(),
    Object? transportType = const $CopyWithPlaceholder(),
    Object? theme = const $CopyWithPlaceholder(),
    Object? difficulty = const $CopyWithPlaceholder(),
    Object? distanceKm = const $CopyWithPlaceholder(),
    Object? pathPoints = const $CopyWithPlaceholder(),
  }) {
    return CreateRouteModel(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      placeIds: placeIds == const $CopyWithPlaceholder()
          ? _value.placeIds
          // ignore: cast_nullable_to_non_nullable
          : placeIds as Iterable<String>,
      transportType: transportType == const $CopyWithPlaceholder()
          ? _value.transportType
          // ignore: cast_nullable_to_non_nullable
          : transportType as RouteTransportType,
      theme: theme == const $CopyWithPlaceholder()
          ? _value.theme
          // ignore: cast_nullable_to_non_nullable
          : theme as RouteTheme,
      difficulty: difficulty == const $CopyWithPlaceholder()
          ? _value.difficulty
          // ignore: cast_nullable_to_non_nullable
          : difficulty as DifficultyLevel,
      distanceKm: distanceKm == const $CopyWithPlaceholder()
          ? _value.distanceKm
          // ignore: cast_nullable_to_non_nullable
          : distanceKm as double,
      pathPoints: pathPoints == const $CopyWithPlaceholder()
          ? _value.pathPoints
          // ignore: cast_nullable_to_non_nullable
          : pathPoints as Iterable<PointModel>,
    );
  }
}

extension $CreateRouteModelCopyWith on CreateRouteModel {
  /// Returns a callable class that can be used as follows: `instanceOfCreateRouteModel.copyWith(...)` or like so:`instanceOfCreateRouteModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateRouteModelCWProxy get copyWith => _$CreateRouteModelCWProxyImpl(this);
}

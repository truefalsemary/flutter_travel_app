// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RouteModelCWProxy {
  RouteModel name(String name);

  RouteModel description(String description);

  RouteModel distanceKm(double? distanceKm);

  RouteModel userId(String? userId);

  RouteModel routeId(String routeId);

  RouteModel difficultyLevel(DifficultyLevel? difficultyLevel);

  RouteModel pathPoints(Iterable<PointModel>? pathPoints);

  RouteModel places(Iterable<PlaceModel> places);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RouteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RouteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  RouteModel call({
    String name,
    String description,
    double? distanceKm,
    String? userId,
    String routeId,
    DifficultyLevel? difficultyLevel,
    Iterable<PointModel>? pathPoints,
    Iterable<PlaceModel> places,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRouteModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRouteModel.copyWith.fieldName(...)`
class _$RouteModelCWProxyImpl implements _$RouteModelCWProxy {
  const _$RouteModelCWProxyImpl(this._value);

  final RouteModel _value;

  @override
  RouteModel name(String name) => this(name: name);

  @override
  RouteModel description(String description) => this(description: description);

  @override
  RouteModel distanceKm(double? distanceKm) => this(distanceKm: distanceKm);

  @override
  RouteModel userId(String? userId) => this(userId: userId);

  @override
  RouteModel routeId(String routeId) => this(routeId: routeId);

  @override
  RouteModel difficultyLevel(DifficultyLevel? difficultyLevel) =>
      this(difficultyLevel: difficultyLevel);

  @override
  RouteModel pathPoints(Iterable<PointModel>? pathPoints) =>
      this(pathPoints: pathPoints);

  @override
  RouteModel places(Iterable<PlaceModel> places) => this(places: places);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RouteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RouteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  RouteModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? distanceKm = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? routeId = const $CopyWithPlaceholder(),
    Object? difficultyLevel = const $CopyWithPlaceholder(),
    Object? pathPoints = const $CopyWithPlaceholder(),
    Object? places = const $CopyWithPlaceholder(),
  }) {
    return RouteModel(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      distanceKm: distanceKm == const $CopyWithPlaceholder()
          ? _value.distanceKm
          // ignore: cast_nullable_to_non_nullable
          : distanceKm as double?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
      routeId: routeId == const $CopyWithPlaceholder()
          ? _value.routeId
          // ignore: cast_nullable_to_non_nullable
          : routeId as String,
      difficultyLevel: difficultyLevel == const $CopyWithPlaceholder()
          ? _value.difficultyLevel
          // ignore: cast_nullable_to_non_nullable
          : difficultyLevel as DifficultyLevel?,
      pathPoints: pathPoints == const $CopyWithPlaceholder()
          ? _value.pathPoints
          // ignore: cast_nullable_to_non_nullable
          : pathPoints as Iterable<PointModel>?,
      places: places == const $CopyWithPlaceholder()
          ? _value.places
          // ignore: cast_nullable_to_non_nullable
          : places as Iterable<PlaceModel>,
    );
  }
}

extension $RouteModelCopyWith on RouteModel {
  /// Returns a callable class that can be used as follows: `instanceOfRouteModel.copyWith(...)` or like so:`instanceOfRouteModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RouteModelCWProxy get copyWith => _$RouteModelCWProxyImpl(this);
}

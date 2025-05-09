// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlaceModelCWProxy {
  PlaceModel name(String name);

  PlaceModel address(String address);

  PlaceModel description(String description);

  PlaceModel location(PointModel location);

  PlaceModel images(Iterable<ImageModel> images);

  PlaceModel placeId(String placeId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlaceModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlaceModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PlaceModel call({
    String name,
    String address,
    String description,
    PointModel location,
    Iterable<ImageModel> images,
    String placeId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlaceModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlaceModel.copyWith.fieldName(...)`
class _$PlaceModelCWProxyImpl implements _$PlaceModelCWProxy {
  const _$PlaceModelCWProxyImpl(this._value);

  final PlaceModel _value;

  @override
  PlaceModel name(String name) => this(name: name);

  @override
  PlaceModel address(String address) => this(address: address);

  @override
  PlaceModel description(String description) => this(description: description);

  @override
  PlaceModel location(PointModel location) => this(location: location);

  @override
  PlaceModel images(Iterable<ImageModel> images) => this(images: images);

  @override
  PlaceModel placeId(String placeId) => this(placeId: placeId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlaceModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlaceModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PlaceModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
    Object? placeId = const $CopyWithPlaceholder(),
  }) {
    return PlaceModel(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as PointModel,
      images: images == const $CopyWithPlaceholder()
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as Iterable<ImageModel>,
      placeId: placeId == const $CopyWithPlaceholder()
          ? _value.placeId
          // ignore: cast_nullable_to_non_nullable
          : placeId as String,
    );
  }
}

extension $PlaceModelCopyWith on PlaceModel {
  /// Returns a callable class that can be used as follows: `instanceOfPlaceModel.copyWith(...)` or like so:`instanceOfPlaceModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlaceModelCWProxy get copyWith => _$PlaceModelCWProxyImpl(this);
}

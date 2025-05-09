// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_place_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreatePlaceModelCWProxy {
  CreatePlaceModel name(String name);

  CreatePlaceModel address(String address);

  CreatePlaceModel description(String description);

  CreatePlaceModel location(PointModel location);

  CreatePlaceModel images(Iterable<XFile> images);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePlaceModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePlaceModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePlaceModel call({
    String name,
    String address,
    String description,
    PointModel location,
    Iterable<XFile> images,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreatePlaceModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreatePlaceModel.copyWith.fieldName(...)`
class _$CreatePlaceModelCWProxyImpl implements _$CreatePlaceModelCWProxy {
  const _$CreatePlaceModelCWProxyImpl(this._value);

  final CreatePlaceModel _value;

  @override
  CreatePlaceModel name(String name) => this(name: name);

  @override
  CreatePlaceModel address(String address) => this(address: address);

  @override
  CreatePlaceModel description(String description) =>
      this(description: description);

  @override
  CreatePlaceModel location(PointModel location) => this(location: location);

  @override
  CreatePlaceModel images(Iterable<XFile> images) => this(images: images);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePlaceModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePlaceModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePlaceModel call({
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
  }) {
    return CreatePlaceModel(
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
          : images as Iterable<XFile>,
    );
  }
}

extension $CreatePlaceModelCopyWith on CreatePlaceModel {
  /// Returns a callable class that can be used as follows: `instanceOfCreatePlaceModel.copyWith(...)` or like so:`instanceOfCreatePlaceModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreatePlaceModelCWProxy get copyWith => _$CreatePlaceModelCWProxyImpl(this);
}

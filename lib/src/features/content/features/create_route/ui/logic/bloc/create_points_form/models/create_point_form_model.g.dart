// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_point_form_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreatePathPointFormModelCWProxy {
  CreatePathPointFormModel location(PointModel location);

  CreatePathPointFormModel address(String address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePathPointFormModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePathPointFormModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePathPointFormModel call({
    PointModel location,
    String address,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreatePathPointFormModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreatePathPointFormModel.copyWith.fieldName(...)`
class _$CreatePathPointFormModelCWProxyImpl
    implements _$CreatePathPointFormModelCWProxy {
  const _$CreatePathPointFormModelCWProxyImpl(this._value);

  final CreatePathPointFormModel _value;

  @override
  CreatePathPointFormModel location(PointModel location) =>
      this(location: location);

  @override
  CreatePathPointFormModel address(String address) => this(address: address);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePathPointFormModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePathPointFormModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePathPointFormModel call({
    Object? location = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return CreatePathPointFormModel(
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as PointModel,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
    );
  }
}

extension $CreatePathPointFormModelCopyWith on CreatePathPointFormModel {
  /// Returns a callable class that can be used as follows: `instanceOfCreatePathPointFormModel.copyWith(...)` or like so:`instanceOfCreatePathPointFormModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreatePathPointFormModelCWProxy get copyWith =>
      _$CreatePathPointFormModelCWProxyImpl(this);
}

abstract class _$CreatePlacePointFormModelCWProxy {
  CreatePlacePointFormModel location(PointModel location);

  CreatePlacePointFormModel address(String address);

  CreatePlacePointFormModel name(String name);

  CreatePlacePointFormModel description(String description);

  CreatePlacePointFormModel images(Iterable<XFile> images);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePlacePointFormModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePlacePointFormModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePlacePointFormModel call({
    PointModel location,
    String address,
    String name,
    String description,
    Iterable<XFile> images,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreatePlacePointFormModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreatePlacePointFormModel.copyWith.fieldName(...)`
class _$CreatePlacePointFormModelCWProxyImpl
    implements _$CreatePlacePointFormModelCWProxy {
  const _$CreatePlacePointFormModelCWProxyImpl(this._value);

  final CreatePlacePointFormModel _value;

  @override
  CreatePlacePointFormModel location(PointModel location) =>
      this(location: location);

  @override
  CreatePlacePointFormModel address(String address) => this(address: address);

  @override
  CreatePlacePointFormModel name(String name) => this(name: name);

  @override
  CreatePlacePointFormModel description(String description) =>
      this(description: description);

  @override
  CreatePlacePointFormModel images(Iterable<XFile> images) =>
      this(images: images);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreatePlacePointFormModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreatePlacePointFormModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CreatePlacePointFormModel call({
    Object? location = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
  }) {
    return CreatePlacePointFormModel(
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as PointModel,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      images: images == const $CopyWithPlaceholder()
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as Iterable<XFile>,
    );
  }
}

extension $CreatePlacePointFormModelCopyWith on CreatePlacePointFormModel {
  /// Returns a callable class that can be used as follows: `instanceOfCreatePlacePointFormModel.copyWith(...)` or like so:`instanceOfCreatePlacePointFormModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreatePlacePointFormModelCWProxy get copyWith =>
      _$CreatePlacePointFormModelCWProxyImpl(this);
}

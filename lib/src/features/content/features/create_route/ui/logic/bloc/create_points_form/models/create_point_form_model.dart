import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:image_picker/image_picker.dart';

part 'create_point_form_model.g.dart';

sealed class CreatePointFormModel with EquatableMixin {
  PointModel get location;
  String get address;
}

@CopyWith()
class CreatePathPointFormModel extends CreatePointFormModel {
  @override
  final PointModel location;

  @override
  final String address;

  CreatePathPointFormModel({
    required this.location,
    required this.address,
  });

  @override
  List<Object?> get props => [location, address];
}

@CopyWith()
class CreatePlacePointFormModel extends CreatePointFormModel {
  @override
  final String address;

  @override
  final PointModel location;

  final String name;

  final String description;

  final Iterable<XFile> images;

  CreatePlacePointFormModel({
    required this.location,
    required this.address,
    required this.name,
    required this.description,
    required this.images,
  });

  @override
  List<Object?> get props => [
        location,
        address,
        name,
        description,
        images,
      ];
}

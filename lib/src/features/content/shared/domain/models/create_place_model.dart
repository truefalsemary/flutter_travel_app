import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:image_picker/image_picker.dart';

part 'create_place_model.g.dart';

@CopyWith()
class CreatePlaceModel with EquatableMixin {
  final String name;
  final String address;
  final String description;
  final PointModel location;
  final Iterable<XFile> images;

  CreatePlaceModel({
    required this.name,
    required this.address,
    required this.description,
    required this.location,
    required this.images,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        description,
        location,
        images,
      ];
}

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/image_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';

part 'place_model.g.dart';

typedef PlaceModels = Iterable<PlaceModel>;

@CopyWith()
final class PlaceModel with EquatableMixin {
  final String name;
  final String address;
  final String description;
  final PointModel location;
  final ImageModels images;
  final String placeId;

  const PlaceModel({
    required this.name,
    required this.address,
    required this.description,
    required this.location,
    required this.images,
    required this.placeId,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        description,
        location,
        images,
        placeId,
      ];
}

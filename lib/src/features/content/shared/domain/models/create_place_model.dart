import 'package:flutter_travel_app/src/features/content/shared/domain/models/place_model.dart';
import 'package:image_picker/image_picker.dart';

class CreatePlaceModel {
  final PlaceModel place;
  final Iterable<XFile> images;

  CreatePlaceModel({
    required this.place,
    required this.images,
  });
}

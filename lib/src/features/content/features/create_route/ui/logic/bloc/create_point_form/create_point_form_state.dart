part of 'create_point_form_bloc.dart';

enum CreatePointFormType {
  place,
  path,
}

sealed class CreatePointEditedFormState extends Equatable {
  CreatePointFormModel? get filledForm;
  bool get isFilled;

  const CreatePointEditedFormState();
}

sealed class CreatePlacePointModelState extends CreatePointEditedFormState {
  String? get address;

  PointModel? get location;

  String? get name;

  String? get description;

  Iterable<XFile>? get images;

  const CreatePlacePointModelState();

  CreatePlacePointModelState copyWith({
    String? Function()? address,
    PointModel? Function()? location,
    String? Function()? name,
    String? Function()? description,
    Iterable<XFile>? Function()? images,
  });
}

sealed class CreatePathPointModelState extends CreatePointEditedFormState {
  String? get address;

  PointModel? get location;

  const CreatePathPointModelState();

  CreatePathPointModelState copyWith({
    String? Function()? address,
    PointModel? Function()? location,
  });
}

final class CreatePathPointEditedFormModel extends CreatePathPointModelState {
  @override
  final String? address;

  @override
  final PointModel? location;

  @override
  bool get isFilled => false;

  const CreatePathPointEditedFormModel({
    required this.address,
    required this.location,
  });

  factory CreatePathPointEditedFormModel.empty() =>
      CreatePathPointEditedFormModel(
        address: null,
        location: null,
      );

  @override
  List<Object?> get props => [address, location];

  @override
  CreatePointFormModel? get filledForm => null;

  @override
  CreatePathPointEditedFormModel copyWith({
    String? Function()? address,
    PointModel? Function()? location,
  }) =>
      CreatePathPointEditedFormModel(
        address: address != null ? address() : this.address,
        location: location != null ? location() : this.location,
      );
}

final class CreatePathPointFilledFormModel extends CreatePathPointModelState {
  @override
  final String address;

  @override
  final PointModel location;

  @override
  bool get isFilled => true;

  const CreatePathPointFilledFormModel({
    required this.address,
    required this.location,
  });

  @override
  CreatePointFormModel get filledForm => CreatePathPointFormModel(
        address: address,
        location: location,
      );

  @override
  List<Object?> get props => [address, location];

  @override
  CreatePathPointFilledFormModel copyWith({
    String? Function()? address,
    PointModel? Function()? location,
  }) =>
      CreatePathPointFilledFormModel(
        address: address != null ? address() ?? this.address : this.address,
        location:
            location != null ? location() ?? this.location : this.location,
      );
}

final class CreatePlacePointEditedFormModel extends CreatePlacePointModelState {
  @override
  final String? address;

  @override
  final PointModel? location;

  @override
  final String? name;

  @override
  final String? description;

  @override
  final Iterable<XFile>? images;

  @override
  bool get isFilled => false;

  const CreatePlacePointEditedFormModel({
    required this.address,
    required this.location,
    required this.name,
    required this.description,
    required this.images,
  });

  factory CreatePlacePointEditedFormModel.empty() =>
      CreatePlacePointEditedFormModel(
        address: null,
        location: null,
        name: null,
        description: null,
        images: null,
      );
  @override
  List<Object?> get props => [address, location, name, description, images];

  @override
  CreatePointFormModel? get filledForm => null;

  @override
  CreatePlacePointEditedFormModel copyWith({
    String? Function()? address,
    PointModel? Function()? location,
    String? Function()? name,
    String? Function()? description,
    Iterable<XFile>? Function()? images,
  }) =>
      CreatePlacePointEditedFormModel(
        address: address != null ? address() : this.address,
        location: location != null ? location() : this.location,
        name: name != null ? name() : this.name,
        description: description != null ? description() : this.description,
        images: images != null ? images() : this.images,
      );
}

final class CreatePlacePointFilledFormModel extends CreatePlacePointModelState {
  @override
  final String address;

  @override
  final PointModel location;

  @override
  final String name;

  @override
  final String description;

  @override
  final Iterable<XFile> images;

  @override
  bool get isFilled => true;

  const CreatePlacePointFilledFormModel({
    required this.address,
    required this.location,
    required this.name,
    required this.description,
    required this.images,
  });

  @override
  CreatePointFormModel get filledForm => CreatePlacePointFormModel(
        name: name,
        description: description,
        images: images,
        location: location,
        address: address,
      );

  @override
  List<Object?> get props => [address, location, name, description, images];

  @override
  CreatePlacePointModelState copyWith({
    String? Function()? address,
    PointModel? Function()? location,
    String? Function()? name,
    String? Function()? description,
    Iterable<XFile>? Function()? images,
  }) =>
      CreatePlacePointFilledFormModel(
        address: address != null ? address() ?? this.address : this.address,
        location:
            location != null ? location() ?? this.location : this.location,
        name: name != null ? name() ?? this.name : this.name,
        description: description != null
            ? description() ?? this.description
            : this.description,
        images: images != null ? images() ?? this.images : this.images,
      );
}

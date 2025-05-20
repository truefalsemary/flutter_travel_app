part of 'create_point_form_bloc.dart';

sealed class CreatePointFormEvent extends Equatable {
  const CreatePointFormEvent();
}
final class CreatePointFillPoint extends CreatePointFormEvent {
  final CreatePointFormModel pointFormModel;

  const CreatePointFillPoint({required this.pointFormModel});

  @override
  List<Object?> get props => [pointFormModel];

}

final class CreatePointFormReset extends CreatePointFormEvent {
  @override
  List<Object?> get props => [];
}

final class CreatePointFormUpdateName extends CreatePointFormEvent {
  final String name;

  const CreatePointFormUpdateName({required this.name});

  @override
  List<Object?> get props => [name];
}

final class CreatePointFormUpdateAddress extends CreatePointFormEvent {
  final String address;

  const CreatePointFormUpdateAddress({required this.address});

  @override
  List<Object?> get props => [address];
}

final class CreatePointFormUpdateLocation extends CreatePointFormEvent {
  final PointModel location;

  const CreatePointFormUpdateLocation({required this.location});

  @override
  List<Object?> get props => [location];
}

final class CreatePointFormUpdateDescription extends CreatePointFormEvent {
  final String description;

  const CreatePointFormUpdateDescription({required this.description});

  @override
  List<Object?> get props => [description];
}

final class CreatePointFormAddImage extends CreatePointFormEvent {
  const CreatePointFormAddImage();

  @override
  List<Object?> get props => [];
}

final class CreatePointFormRemoveImage extends CreatePointFormEvent {
  final int imageIndex;

  const CreatePointFormRemoveImage({required this.imageIndex});

  @override
  List<Object?> get props => [imageIndex];
}

final class CreatePointFormReorderImages extends CreatePointFormEvent {
  final int oldImageIndex;
  final int newImageIndex;

  const CreatePointFormReorderImages({
    required this.oldImageIndex,
    required this.newImageIndex,
  });

  @override
  List<Object?> get props => [oldImageIndex, newImageIndex];
}

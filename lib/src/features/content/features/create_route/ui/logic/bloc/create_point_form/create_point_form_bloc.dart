import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/models/create_point_form_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:image_picker/image_picker.dart';

part 'create_point_form_event.dart';
part 'create_point_form_state.dart';

class CreatePointFormBloc
    extends Bloc<CreatePointFormEvent, CreatePointEditedFormState> {
  final ImagePicker _imagePicker;

  CreatePointFormBloc({
    required CreatePointFormType type,
    required ImagePicker imagePicker,
  })  : _imagePicker = imagePicker,
        super(switch (type) {
          CreatePointFormType.path => CreatePathPointEditedFormModel.empty(),
          CreatePointFormType.place => CreatePlacePointEditedFormModel.empty(),
        }) {
    on<CreatePointFormUpdateName>(_onUpdateName);
    on<CreatePointFormUpdateAddress>(_onUpdateAddress);
    on<CreatePointFormUpdateLocation>(_onUpdateLocation);
    on<CreatePointFormUpdateDescription>(_onUpdateDescription);
    on<CreatePointFormAddImage>(_onAddImage);
    on<CreatePointFormRemoveImage>(_onRemoveImage);
    on<CreatePointFormReorderImages>(_onReorderImages);
    on<CreatePointFormReset>(_onReset);
  }

  void _emit(
    CreatePointEditedFormState state,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    // TODO(truefalsemary): добавить локацию как добавлю сдк карт
    switch (state) {
      case CreatePathPointModelState(
          :final address,
          :final location,
        ):
        if (address != null && location != null && address.isNotEmpty) {
          emit(
            CreatePathPointFilledFormModel(
              address: address,
              // location: location,
              location: PointModel(
                lat: 10,
                lon: 10,
              ),
            ),
          );
        } else {
          emit(
            CreatePathPointEditedFormModel(
              address: address,
              // location: location,
              location: PointModel(
                lat: 10,
                lon: 10,
              ),
            ),
          );
        }

      case CreatePlacePointModelState(
          :final address,
          :final location,
          :final name,
          :final description,
          :final images,
        ):
        if (address != null &&
            location != null &&
            name != null &&
            description != null &&
            images != null &&
            images.isNotEmpty) {
          emit(
            CreatePlacePointFilledFormModel(
              address: address,
              // location: location,
              name: name,
              description: description,
              images: images,
              location: PointModel(
                lat: 10,
                lon: 10,
              ),
            ),
          );
        } else {
          emit(
            CreatePlacePointEditedFormModel(
              address: address,
              // location: location,
              name: name,
              description: description,
              images: images,
              location: PointModel(
                lat: 10,
                lon: 10,
              ),
            ),
          );
        }
    }
  }

  Iterable<XFile>? _getImages(CreatePlacePointModelState state) {
    final images = state.images;
    if (images == null) {
      return null;
    }
    return images.toList();
  }

  void _onUpdateAddress(
    CreatePointFormUpdateAddress event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case final CreatePlacePointModelState placePoint:
        _emit(
          placePoint.copyWith(address: () => event.address),
          emit,
        );
      case final CreatePathPointModelState pathPoint:
        _emit(
          pathPoint.copyWith(address: () => event.address),
          emit,
        );
    }
  }

  void _onUpdateLocation(
    CreatePointFormUpdateLocation event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case final CreatePlacePointModelState placePoint:
        _emit(
          placePoint.copyWith(location: () => event.location),
          emit,
        );
      case final CreatePathPointModelState pathPoint:
        _emit(
          pathPoint.copyWith(location: () => event.location),
          emit,
        );
    }
  }

  void _onUpdateDescription(
    CreatePointFormUpdateDescription event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case final CreatePlacePointModelState placePoint:
        _emit(
          placePoint.copyWith(description: () => event.description),
          emit,
        );
      case CreatePathPointModelState():
        return;
    }
  }

  void _onUpdateName(
    CreatePointFormUpdateName event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case final CreatePlacePointModelState placePoint:
        _emit(
          placePoint.copyWith(name: () => event.name),
          emit,
        );
      case CreatePathPointModelState():
        return;
    }
  }

  Future<void> _onAddImage(
    CreatePointFormAddImage event,
    Emitter<CreatePointEditedFormState> emit,
  ) async {
    switch (state) {
      case final CreatePlacePointModelState placePoint:
        final images = _getImages(placePoint) ?? [];
        final image = await _imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          _emit(
            placePoint.copyWith(images: () => [...images, image]),
            emit,
          );
        }
      case CreatePathPointModelState():
        return;
    }
  }

  void _onRemoveImage(
    CreatePointFormRemoveImage event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case CreatePathPointModelState():
        break;
      case final CreatePlacePointModelState placePoint:
        final images = _getImages(placePoint);
        if (images == null) {
          return;
        }
        if (event.imageIndex >= images.length || event.imageIndex < 0) {
          return;
        }
        final newImages = List<XFile>.from(images);
        newImages.removeAt(event.imageIndex);
        emit(placePoint.copyWith(images: () => newImages));
    }
  }

  void _onReorderImages(
    CreatePointFormReorderImages event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case CreatePathPointModelState():
        break;
      case final CreatePlacePointModelState placePoint:
        final images = _getImages(placePoint);

        if (images == null ||
            images.isEmpty ||
            event.oldImageIndex >= images.length ||
            event.newImageIndex >= images.length ||
            event.oldImageIndex == event.newImageIndex ||
            event.oldImageIndex < 0 ||
            event.newImageIndex < 0) {
          return;
        }

        final newImages = List<XFile>.from(images);
        final image = newImages.removeAt(event.oldImageIndex);
        newImages.insert(event.newImageIndex, image);

        emit(placePoint.copyWith(images: () => newImages));
    }
  }

  void _onReset(
    CreatePointFormReset event,
    Emitter<CreatePointEditedFormState> emit,
  ) {
    switch (state) {
      case CreatePathPointModelState():
        emit(CreatePathPointEditedFormModel.empty());
      case CreatePlacePointModelState():
        emit(CreatePlacePointEditedFormModel.empty());
    }
  }
}

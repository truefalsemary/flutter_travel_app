import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/models/create_point_form_model.dart';

part 'create_points_form_event.dart';
part 'create_points_form_state.dart';

class CreatePointsFormBloc
    extends Bloc<CreatePointsFormEvent, CreatePointsFormState> {
  CreatePointsFormBloc() : super(CreatePointsFormState.empty()) {
    on<PlaceFormReorderPoints>(_onReorderPlaces);
    on<PlaceFormAddPoint>(_onAddPoint);
    on<PlaceFormUpdatePoint>(_onUpdatePoint);
    on<PlaceFormDeletePoint>(_onDeletePoint);
    on<PlaceFormReset>(_onReset);
  }

  void _onAddPoint(
    PlaceFormAddPoint event,
    Emitter<CreatePointsFormState> emit,
  ) {
    final points = List<CreatePointFormModel>.from(state.points);

    switch (event.point) {
      case final CreatePlacePointFormModel placePoint:
        points.add(
          CreatePlacePointFormModel(
            name: placePoint.name,
            description: placePoint.description,
            address: placePoint.address,
            location: placePoint.location,
            images: placePoint.images,
          ),
        );
      case final CreatePathPointFormModel pathPoint:
        points.add(
          CreatePathPointFormModel(
            address: pathPoint.address,
            location: pathPoint.location,
          ),
        );
    }

    emit(state.copyWith(points: points));
  }

  void _onUpdatePoint(
    PlaceFormUpdatePoint event,
    Emitter<CreatePointsFormState> emit,
  ) {
    final points = List<CreatePointFormModel>.from(state.points);
    points[event.pointIndex] = event.point;
  }

  void _onDeletePoint(
    PlaceFormDeletePoint event,
    Emitter<CreatePointsFormState> emit,
  ) {
    if (event.pointIndex >= state.points.length || event.pointIndex < 0) {
      return;
    }

    final points = List<CreatePointFormModel>.from(state.points)
      ..removeAt(event.pointIndex);

    emit(state.copyWith(points: points));
  }

  void _onReorderPlaces(
    PlaceFormReorderPoints event,
    Emitter<CreatePointsFormState> emit,
  ) {
    if (event.oldPointIndex >= state.points.length ||
        event.newPointIndex >= state.points.length ||
        event.oldPointIndex == event.newPointIndex ||
        event.oldPointIndex < 0 ||
        event.newPointIndex < 0) {
      return;
    }

    final points = List<CreatePointFormModel>.from(state.points);
    final point = points.removeAt(event.oldPointIndex);
    points.insert(event.newPointIndex, point);

    emit(state.copyWith(points: points));
  }

  void _onReset(
    PlaceFormReset event,
    Emitter<CreatePointsFormState> emit,
  ) {
    emit(state.copyWith(points: []));
  }
}

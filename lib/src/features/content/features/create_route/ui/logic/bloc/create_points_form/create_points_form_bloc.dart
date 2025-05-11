import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/create_points_form_state.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/models/create_point_form_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';

part 'create_points_form_event.dart';

class CreatePointsFormBloc
    extends HydratedBloc<CreatePointsFormEvent, CreatePointsFormState> {
  final Logger _logger;

  CreatePointsFormBloc({
    required Logger logger,
  })  : _logger = logger,
        super(CreatePointsFormState.empty()) {
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
    _logger.d('onAddPoint');
    final points = List<CreatePointFormModel>.from(state.points);

    switch (event.point) {
      case final CreatePlacePointFormModel placePoint:
        _logger.d('onAddPoint: placePoint');
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
        _logger.d('onAddPoint: pathPoint');
        points.add(
          CreatePathPointFormModel(
            address: pathPoint.address,
            location: pathPoint.location,
          ),
        );
    }
    _logger.d('onAddPoint: points: $points');

    emit(state.copyWith(points: points));
  }

  void _onUpdatePoint(
    PlaceFormUpdatePoint event,
    Emitter<CreatePointsFormState> emit,
  ) {
    _logger.d('onUpdatePoint');
    final points = List<CreatePointFormModel>.from(state.points);
    points[event.pointIndex] = event.point;
  }

  void _onDeletePoint(
    PlaceFormDeletePoint event,
    Emitter<CreatePointsFormState> emit,
  ) {
    _logger.d('onDeletePoint');
    if (event.pointIndex >= state.points.length || event.pointIndex < 0) {
      _logger.d('onDeletePoint: invalid index');
      return;
    }

    _logger.d('onDeletePoint: valid index');
    final points = List<CreatePointFormModel>.from(state.points)
      ..removeAt(event.pointIndex);

    emit(state.copyWith(points: points));
  }

  void _onReorderPlaces(
    PlaceFormReorderPoints event,
    Emitter<CreatePointsFormState> emit,
  ) {
    _logger.d('onReorderPlaces');
    if (event.oldPointIndex >= state.points.length ||
        event.newPointIndex >= state.points.length ||
        event.oldPointIndex == event.newPointIndex ||
        event.oldPointIndex < 0 ||
        event.newPointIndex < 0) {
      _logger.d('onReorderPlaces: invalid indices');
      return;
    }

    _logger.d('onReorderPlaces: valid indices');
    final points = List<CreatePointFormModel>.from(state.points);
    final point = points.removeAt(event.oldPointIndex);
    points.insert(event.newPointIndex, point);

    emit(state.copyWith(points: points));
  }

  void _onReset(
    PlaceFormReset event,
    Emitter<CreatePointsFormState> emit,
  ) {
    _logger.d('onReset');
    emit(state.copyWith(points: []));
  }

  @override
  CreatePointsFormState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(CreatePointsFormState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

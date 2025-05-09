part of 'create_points_form_bloc.dart';

sealed class CreatePointsFormEvent {
  const CreatePointsFormEvent();
}

class PlaceFormAddPoint extends CreatePointsFormEvent {
  final CreatePointFormModel point;

  const PlaceFormAddPoint(this.point);
}

class PlaceFormUpdatePoint extends CreatePointsFormEvent {
  final int pointIndex;
  final CreatePointFormModel point;

  const PlaceFormUpdatePoint({
    required this.pointIndex,
    required this.point,
  });
}

class PlaceFormDeletePoint extends CreatePointsFormEvent {
  final int pointIndex;

  const PlaceFormDeletePoint(this.pointIndex);
}

class PlaceFormReorderPoints extends CreatePointsFormEvent {
  final int oldPointIndex;
  final int newPointIndex;

  const PlaceFormReorderPoints({
    required this.oldPointIndex,
    required this.newPointIndex,
  });
}

class PlaceFormReset extends CreatePointsFormEvent {
  const PlaceFormReset();
}

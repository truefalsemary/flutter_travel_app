part of 'create_route_form_bloc.dart';

sealed class CreateRouteFormEvent with EquatableMixin {
  const CreateRouteFormEvent();
}

class CreateRouteFormUpdateName extends CreateRouteFormEvent {
  final String name;

  const CreateRouteFormUpdateName(this.name);

  @override
  List<Object?> get props => [name];
}

class CreateRouteFormUpdateDescription extends CreateRouteFormEvent {
  final String description;

  const CreateRouteFormUpdateDescription(this.description);

  @override
  List<Object?> get props => [description];
}

class CreateRouteFormUpdatePathPoints extends CreateRouteFormEvent {
  final List<PointModel> points;

  const CreateRouteFormUpdatePathPoints(this.points);

  @override
  List<Object?> get props => [points];
}

class CreateRouteFormUpdateTransportType extends CreateRouteFormEvent {
  final proto.RouteTransportType transportType;

  const CreateRouteFormUpdateTransportType(this.transportType);

  @override
  List<Object?> get props => [transportType];
}

class CreateRouteFormUpdateTheme extends CreateRouteFormEvent {
  final proto.RouteTheme theme;

  const CreateRouteFormUpdateTheme(this.theme);

  @override
  List<Object?> get props => [theme];
}

class CreateRouteFormUpdateDifficulty extends CreateRouteFormEvent {
  final proto.DifficultyLevel difficulty;

  const CreateRouteFormUpdateDifficulty(this.difficulty);

  @override
  List<Object?> get props => [difficulty];
}

class CreateRouteFormUpdateDistanceKm extends CreateRouteFormEvent {
  final double distanceKm;

  const CreateRouteFormUpdateDistanceKm(this.distanceKm);

  @override
  List<Object?> get props => [distanceKm];
}

class CreateRouteFormReset extends CreateRouteFormEvent {
  const CreateRouteFormReset();

  @override
  List<Object?> get props => [];
}

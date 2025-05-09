part of 'routes_bloc.dart';

sealed class RoutesState with EquatableMixin {
  const RoutesState();
}

final class RoutesLoadSuccess extends RoutesState {
  final RouteModels routes;
  final UserFilterRoutesParams? userFilterRoutesParams;

  const RoutesLoadSuccess({required this.routes, this.userFilterRoutesParams});

  @override
  List<Object?> get props => [routes, userFilterRoutesParams];
}

final class RoutesInitial extends RoutesState {
  @override
  List<Object?> get props => [];
}

final class RoutesLoadInProgress extends RoutesState {
  @override
  List<Object?> get props => [];
}

final class RoutesLoadFailure extends RoutesState {
  @override
  List<Object?> get props => [];
}

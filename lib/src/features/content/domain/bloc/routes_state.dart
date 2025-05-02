import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_params.dart';

sealed class RoutesState extends Equatable {
  const RoutesState();
}

final class RoutesLoadSuccess extends RoutesState {
  final RouteModels routes;
  final RouteParams? routeParams;

  const RoutesLoadSuccess({required this.routes, this.routeParams});

  @override
  List<Object?> get props => [routes, routeParams];
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

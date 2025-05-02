import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_params.dart';

sealed class RoutesEvent extends Equatable {
  const RoutesEvent();
}

final class RoutesFetched extends RoutesEvent {
  final RouteParams? routeParams;

  const RoutesFetched({
    this.routeParams,
  });

  @override
  List<Object?> get props => [routeParams];
}

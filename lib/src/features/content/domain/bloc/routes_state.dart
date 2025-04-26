import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/routes/data/proto/content.pbgrpc.dart';

sealed class RoutesState extends Equatable {
  const RoutesState();
}

final class RoutesLoadSuccess extends RoutesState {
  final List<Route> routes;

  const RoutesLoadSuccess({required this.routes});

  @override
  List<Object?> get props => [routes];
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

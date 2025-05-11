part of 'routes_bloc.dart';

sealed class RoutesEvent extends Equatable {
  const RoutesEvent();
}

final class RoutesFetched extends RoutesEvent {
  final UserFilterRoutesParams? userFilterRoutesParams;

  const RoutesFetched({
    this.userFilterRoutesParams,
  });

  @override
  List<Object?> get props => [userFilterRoutesParams];
}

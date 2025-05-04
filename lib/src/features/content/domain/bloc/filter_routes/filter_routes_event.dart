part of 'filter_routes_bloc.dart';

sealed class FilterRoutesEvent with EquatableMixin {}

final class AvailableFilterRoutesFetched extends FilterRoutesEvent {
  AvailableFilterRoutesFetched();

  @override
  List<Object?> get props => [];
}

final class UserFilterRoutesChanged extends FilterRoutesEvent {
  final UserFilterRoutesParams userFilterRoutesParams;

  UserFilterRoutesChanged({
    required this.userFilterRoutesParams,
  });

  @override
  List<Object?> get props => [
        userFilterRoutesParams,
      ];
}

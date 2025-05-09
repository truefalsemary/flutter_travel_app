part of 'filter_routes_bloc.dart';

sealed class FilterRoutesState with EquatableMixin {}

final class FilterRoutesInitial extends FilterRoutesState {
  @override
  List<Object?> get props => [];
}

final class FilterRoutesLoadInProgress extends FilterRoutesState {
  @override
  List<Object?> get props => [];
}

final class FilterRoutesLoadSuccess extends FilterRoutesState {
  final AvailableFilterRoutesParams availableFilterRoutesParams;
  final UserFilterRoutesParams? userFilterRoutesParams;

  FilterRoutesLoadSuccess({
    required this.availableFilterRoutesParams,
    required this.userFilterRoutesParams,
  });

  @override
  List<Object?> get props => [
        availableFilterRoutesParams,
        userFilterRoutesParams,
      ];
}

final class FilterRoutesLoadFailure extends FilterRoutesState {
  FilterRoutesLoadFailure();

  @override
  List<Object?> get props => [];
}

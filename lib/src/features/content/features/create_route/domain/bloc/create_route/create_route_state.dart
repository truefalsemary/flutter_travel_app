part of 'create_route_bloc.dart';

sealed class CreateRouteState {}

class CreateRouteInitial extends CreateRouteState {}

class CreateRouteLoading extends CreateRouteState {}

class CreateRouteSuccess extends CreateRouteState {}

class CreateRouteFailure extends CreateRouteState {}

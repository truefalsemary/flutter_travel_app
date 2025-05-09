// ignore_for_file: overridden_fields

import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart'
    as proto;

sealed class CreateRouteFormState {
  String? get name;
  String? get description;
  proto.RouteTransportType? get transportType;
  proto.RouteTheme? get theme;
  proto.DifficultyLevel? get difficulty;
  double? get distanceKm;

  const CreateRouteFormState();

  CreateRouteFormState copyWith({
    String Function()? name,
    String Function()? description,
    proto.RouteTransportType? Function()? transportType,
    proto.RouteTheme? Function()? theme,
    proto.DifficultyLevel? Function()? difficulty,
    double Function()? distanceKm,
  });
}

class CreateRouteFormEdited extends CreateRouteFormState with EquatableMixin {
  @override
  final String? name;

  @override
  final String? description;

  @override
  final proto.RouteTransportType? transportType;

  @override
  final proto.RouteTheme? theme;

  @override
  final proto.DifficultyLevel? difficulty;

  @override
  final double? distanceKm;

  const CreateRouteFormEdited({
    this.name,
    this.description,
    this.transportType,
    this.theme,
    this.difficulty,
    this.distanceKm,
  });

  factory CreateRouteFormEdited.empty() => CreateRouteFormEdited();

  @override
  List<Object?> get props => [
        name,
        description,
        transportType,
        theme,
        difficulty,
        distanceKm,
      ];

  @override
  CreateRouteFormEdited copyWith({
    String? Function()? name,
    String? Function()? description,
    proto.RouteTransportType? Function()? transportType,
    proto.RouteTheme? Function()? theme,
    proto.DifficultyLevel? Function()? difficulty,
    double Function()? distanceKm,
  }) =>
      CreateRouteFormEdited(
        name: name != null ? name() : this.name,
        description: description != null ? description() : this.description,
        transportType:
            transportType != null ? transportType() : this.transportType,
        theme: theme != null ? theme() : this.theme,
        difficulty: difficulty != null ? difficulty() : this.difficulty,
        distanceKm: distanceKm != null ? distanceKm() : this.distanceKm,
      );
}

final class CreateRouteFormFilled extends CreateRouteFormState
    with EquatableMixin {
  @override
  final String name;

  @override
  final String description;

  @override
  final proto.RouteTransportType transportType;

  @override
  final proto.RouteTheme theme;

  @override
  final proto.DifficultyLevel difficulty;

  @override
  final double distanceKm;

  const CreateRouteFormFilled({
    required this.name,
    required this.description,
    required this.transportType,
    required this.theme,
    required this.difficulty,
    required this.distanceKm,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        transportType,
        theme,
        difficulty,
        distanceKm,
      ];

  @override
  CreateRouteFormFilled copyWith({
    String? Function()? name,
    String? Function()? description,
    proto.RouteTransportType? Function()? transportType,
    proto.RouteTheme? Function()? theme,
    proto.DifficultyLevel? Function()? difficulty,
    double? Function()? distanceKm,
  }) =>
      CreateRouteFormFilled(
        name: name != null ? name() ?? this.name : this.name,
        description: description != null
            ? description() ?? this.description
            : this.description,
        transportType: transportType != null
            ? transportType() ?? this.transportType
            : this.transportType,
        theme: theme != null ? theme() ?? this.theme : this.theme,
        difficulty: difficulty != null
            ? difficulty() ?? this.difficulty
            : this.difficulty,
        distanceKm: distanceKm != null
            ? distanceKm() ?? this.distanceKm
            : this.distanceKm,
      );
}

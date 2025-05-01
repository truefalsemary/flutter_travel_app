import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/place_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pbgrpc.dart';

typedef RouteModels = Iterable<RouteModel>;

final class RouteModel with EquatableMixin {
  final String name;
  final double? distanceKm;
  final String? userId;
  final String routeId;
  final DifficultyLevel? difficultyLevel;
  final PointModels? pathPoints;
  final PlaceModels places;

  RouteModel({
    required this.name,
    required this.distanceKm,
    required this.userId,
    required this.routeId,
    required this.difficultyLevel,
    required this.pathPoints,
    required this.places,
  });

  @override
  List<Object?> get props => [
        name,
        distanceKm,
        userId,
        routeId,
        difficultyLevel,
        pathPoints,
        places,
      ];
}

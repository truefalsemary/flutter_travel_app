import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';

part 'create_route_model.g.dart';

@CopyWith()
class CreateRouteModel with EquatableMixin {
  final String name;
  final String description;
  final Iterable<String> placeIds;
  final RouteTransportType transportType;
  final RouteTheme theme;
  final DifficultyLevel difficulty;
  final double distanceKm;
  final Iterable<PointModel> pathPoints;

  CreateRouteModel({
    required this.name,
    required this.description,
    required this.placeIds,
    required this.transportType,
    required this.theme,
    required this.difficulty,
    required this.distanceKm,
    required this.pathPoints,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        placeIds,
        transportType,
        theme,
        difficulty,
        distanceKm,
        pathPoints,
      ];
}

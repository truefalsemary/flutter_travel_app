import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';

part 'filter_routes_params.g.dart';

@CopyWith()
class AvailableFilterRoutesParams with EquatableMixin {
  final DistanceFilterModel? distanceFilter;
  final DifficultyLevel minDifficulty;
  final DifficultyLevel maxDifficulty;

  AvailableFilterRoutesParams({
    required this.distanceFilter,
    required this.minDifficulty,
    required this.maxDifficulty,
  });

  @override
  List<Object?> get props => [
        distanceFilter,
        minDifficulty,
        maxDifficulty,
      ];
}

@CopyWith()
class DistanceFilterModel with EquatableMixin {
  final double minDistance;
  final double maxDistance;

  DistanceFilterModel({
    required this.minDistance,
    required this.maxDistance,
  });

  @override
  List<Object?> get props => [minDistance, maxDistance];
}

@CopyWith()
class UserFilterRoutesParams with EquatableMixin {
  final DifficultyLevel? minDifficulty;
  final DifficultyLevel? maxDifficulty;
  final double? minDistance;
  final double? maxDistance;

  UserFilterRoutesParams({
    this.minDifficulty,
    this.maxDifficulty,
    this.minDistance,
    this.maxDistance,
  });

  @override
  List<Object?> get props => [
        minDifficulty,
        maxDifficulty,
        minDistance,
        maxDistance,
      ];
}

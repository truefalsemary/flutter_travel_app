import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pbenum.dart';

sealed class RoutesEvent extends Equatable {
  const RoutesEvent();
}

final class RoutesFetched extends RoutesEvent {
  final DifficultyLevel? difficulty;
  final double? minDistance;
  final double? maxDistance;

  const RoutesFetched({
    this.difficulty,
    this.minDistance,
    this.maxDistance,
  });

  @override
  List<Object?> get props => [difficulty, minDistance, maxDistance];
}

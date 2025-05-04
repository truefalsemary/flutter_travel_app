import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/domain/constants/filter_constants.dart';
import 'package:flutter_travel_app/src/features/content/ui/filter_modal.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';

class RouteParams with EquatableMixin {
  final DifficultyLevel? minDifficulty;
  final DifficultyLevel? maxDifficulty;
  final double? minDistance;
  final double? maxDistance;

  RouteParams({
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

  FilterRoutesParams get toFilterRoutesParams => (
        minDistance:
            minDistance ?? RouteParamsFilterConstants.defaultMinDistance,
        maxDistance:
            maxDistance ?? RouteParamsFilterConstants.defaultMaxDistance,
        minDifficulty:
            minDifficulty ?? RouteParamsFilterConstants.defaultMinDifficulty,
        maxDifficulty:
            maxDifficulty ?? RouteParamsFilterConstants.defaultMaxDifficulty,
      );
}

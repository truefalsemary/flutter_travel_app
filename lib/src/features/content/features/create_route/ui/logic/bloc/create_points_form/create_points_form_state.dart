import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/models/create_point_form_model.dart';


class CreatePointsFormState with EquatableMixin {
  final Iterable<CreatePointFormModel> points;

  const CreatePointsFormState({
    required this.points,
  });

  factory CreatePointsFormState.empty() => CreatePointsFormState(
        points: [],
      );

  @override
  List<Object?> get props => [points];

  CreatePointsFormState copyWith({
    Iterable<CreatePointFormModel>? points,
  }) =>
      CreatePointsFormState(
        points: points ?? this.points,
      );
}

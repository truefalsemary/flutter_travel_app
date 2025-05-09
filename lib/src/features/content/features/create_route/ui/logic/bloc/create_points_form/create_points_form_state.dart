part of 'create_points_form_bloc.dart';

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

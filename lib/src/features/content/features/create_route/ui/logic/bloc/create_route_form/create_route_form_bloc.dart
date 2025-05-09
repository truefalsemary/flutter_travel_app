import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_route_form/create_route_form_state.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart'
    as proto;
import 'package:logger/logger.dart';

part 'create_route_form_event.dart';

class CreateRouteFormBloc
    extends Bloc<CreateRouteFormEvent, CreateRouteFormState> {
  final Logger _logger;

  CreateRouteFormBloc({required Logger logger})
      : _logger = logger,
        super(CreateRouteFormEdited.empty()) {
    on<CreateRouteFormUpdateName>(_onUpdateName);
    on<CreateRouteFormUpdateDescription>(_onUpdateDescription);
    on<CreateRouteFormUpdateTransportType>(_onUpdateTransportType);
    on<CreateRouteFormUpdateTheme>(_onUpdateTheme);
    on<CreateRouteFormUpdateDifficulty>(_onUpdateDifficulty);
    on<CreateRouteFormUpdateDistanceKm>(_onUpdateDistanceKm);
    on<CreateRouteFormReset>(_onReset);
  }

  void _emit({
    required CreateRouteFormState state,
    required Emitter<CreateRouteFormState> emit,
  }) {
    final name = state.name;
    final description = state.description;
    final transportType = state.transportType;
    final theme = state.theme;
    final difficulty = state.difficulty;
    final distanceKm = state.distanceKm;

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        transportType != null &&
        theme != null &&
        difficulty != null &&
        distanceKm != null) {
      _logger
        ..d('emit CreateRouteFormFilled')
        ..d('State: {name: $name, '
            'description: $description, '
            'transportType: $transportType, '
            'theme: $theme, '
            'difficulty: $difficulty, '
            'distanceKm: $distanceKm}');
      emit(
        CreateRouteFormFilled(
          name: name,
          description: description,
          transportType: transportType,
          theme: theme,
          difficulty: difficulty,
          distanceKm: distanceKm,
        ),
      );
    } else {
      _logger.d('emit CreateRouteFormEdited. '
          'State: {name: $name, '
          'description: $description, '
          'transportType: $transportType, '
          'theme: $theme, '
          'difficulty: $difficulty, '
          'distanceKm: $distanceKm}');
      emit(
        CreateRouteFormEdited(
          name: name,
          description: description,
          transportType: transportType,
          theme: theme,
          difficulty: difficulty,
          distanceKm: distanceKm,
        ),
      );
    }
  }

  void _onUpdateName(
    CreateRouteFormUpdateName event,
    Emitter<CreateRouteFormState> emit,
  ) =>
      _emit(
        emit: emit,
        state: state.copyWith(name: () => event.name),
      );

  void _onUpdateDescription(
    CreateRouteFormUpdateDescription event,
    Emitter<CreateRouteFormState> emit,
  ) {
    _emit(
      emit: emit,
      state: state.copyWith(description: () => event.description),
    );
  }

  void _onUpdateTransportType(
    CreateRouteFormUpdateTransportType event,
    Emitter<CreateRouteFormState> emit,
  ) =>
      _emit(
        emit: emit,
        state: state.copyWith(transportType: () => event.transportType),
      );

  void _onUpdateTheme(
    CreateRouteFormUpdateTheme event,
    Emitter<CreateRouteFormState> emit,
  ) =>
      _emit(
        emit: emit,
        state: state.copyWith(theme: () => event.theme),
      );

  void _onUpdateDifficulty(
    CreateRouteFormUpdateDifficulty event,
    Emitter<CreateRouteFormState> emit,
  ) =>
      _emit(
        emit: emit,
        state: state.copyWith(difficulty: () => event.difficulty),
      );

  void _onUpdateDistanceKm(
    CreateRouteFormUpdateDistanceKm event,
    Emitter<CreateRouteFormState> emit,
  ) =>
      _emit(
        emit: emit,
        state: state.copyWith(distanceKm: () => event.distanceKm),
      );

  void _onReset(
    CreateRouteFormReset event,
    Emitter<CreateRouteFormState> emit,
  ) =>
      _emit(
        emit: emit,
        state: CreateRouteFormEdited.empty(),
      );
}

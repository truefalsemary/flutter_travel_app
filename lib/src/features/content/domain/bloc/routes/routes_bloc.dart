import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/data/content_repository.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  final ContentRepository _contentRepository;
  final Logger _logger;

  RoutesBloc({
    required Logger logger,
    required ContentRepository contentRepository,
  })  : _logger = logger,
        _contentRepository = contentRepository,
        super(RoutesInitial()) {
    on<RoutesFetched>(_onGetRoutes);
  }

  Future<void> _onGetRoutes(
    RoutesFetched event,
    Emitter<RoutesState> emit,
  ) async {
    final previousState = state;

    emit(RoutesLoadInProgress());
    try {
      final routes = await _contentRepository.getRouteModels(
        event.userFilterRoutesParams,
      );
      if (routes != null &&
          _isStateChanged(
            previousState: previousState,
            event: event,
          )) {
        emit(
          RoutesLoadSuccess(
            routes: routes,
            userFilterRoutesParams: event.userFilterRoutesParams,
          ),
        );
      } else {
        emit(RoutesLoadFailure());
      }
    } on Exception catch (e, stackTrace) {
      _logger.e(e, stackTrace: stackTrace);
      emit(RoutesLoadFailure());
    }
  }

  bool _isStateChanged({
    required RoutesState previousState,
    required RoutesFetched event,
  }) {
    if (previousState is RoutesLoadSuccess) {
      return previousState.userFilterRoutesParams !=
          event.userFilterRoutesParams;
    }

    return true;
  }
}

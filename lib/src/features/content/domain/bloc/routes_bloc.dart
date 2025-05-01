import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_event.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_state.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_repository.dart';
import 'package:logger/logger.dart';

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
    emit(RoutesLoadInProgress());
    try {
      final routes = await _contentRepository.getRouteModels(
        (
          difficultyLevel: event.difficulty,
          minDistance: event.minDistance,
          maxDistance: event.maxDistance,
        ),
      );
      if (routes != null) {
        emit(RoutesLoadSuccess(routes: routes));
      } else {
        emit(RoutesLoadFailure());
      }
    } on Exception catch (e, stackTrace) {
      _logger.e(e, stackTrace: stackTrace);
      emit(RoutesLoadFailure());
    }
  }
}

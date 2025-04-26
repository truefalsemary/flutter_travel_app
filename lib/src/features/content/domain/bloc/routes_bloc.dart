import 'package:bloc/bloc.dart';
import 'package:flutter_travel_app/src/features/content/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_event.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_state.dart';
import 'package:logger/logger.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  final ContentApiClient _contentApiClient;
  final Logger _logger;

  RoutesBloc({
    required Logger logger,
    required ContentApiClient contentApiClient,
  })  : _logger = logger,
        _contentApiClient = contentApiClient,
        super(RoutesInitial()) {
    on<RoutesFetched>(_onGetRoutes);
  }

  void _onGetRoutes(
    RoutesFetched event,
    Emitter<RoutesState> emit,
  ) async {
    emit(RoutesLoadInProgress());
    try {
      final routes = await _contentApiClient.getRoutes(
        difficulty: event.difficulty,
        minDistance: event.minDistance,
        maxDistance: event.maxDistance,
      );
      emit(RoutesLoadSuccess(routes: routes));
    } on Exception catch (e, stackTrace) {
      _logger.e(e, stackTrace: stackTrace);
      emit(RoutesLoadFailure());
    }
  }
}

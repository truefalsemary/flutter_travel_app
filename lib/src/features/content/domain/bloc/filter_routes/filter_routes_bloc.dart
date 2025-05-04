import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_repository.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/filter_routes_params.dart';
import 'package:logger/logger.dart';

part 'filter_routes_event.dart';
part 'filter_routes_state.dart';

class FilterRoutesBloc extends Bloc<FilterRoutesEvent, FilterRoutesState> {
  final ContentRepository _contentRepository;
  final Logger _logger;

  FilterRoutesBloc({
    required Logger logger,
    required ContentRepository contentRepository,
  })  : _logger = logger,
        _contentRepository = contentRepository,
        super(FilterRoutesInitial()) {
    on<AvailableFilterRoutesFetched>(_onAvailableFilterRoutesFetched);
    on<UserFilterRoutesChanged>(_onUserFilterRoutesChanged);
  }

  Future<void> _onAvailableFilterRoutesFetched(
    AvailableFilterRoutesFetched event,
    Emitter<FilterRoutesState> emit,
  ) async {
    _logger.d('_onAvailableFilterRoutesFetched');

    final state = this.state;
    final userFilterRoutesParams =
        state is FilterRoutesLoadSuccess ? state.userFilterRoutesParams : null;

    emit(FilterRoutesLoadInProgress());
    try {
      final availableFilterRoutesParams =
          await _contentRepository.getAvailableFilterRoutesParams();

      emit(
        FilterRoutesLoadSuccess(
          availableFilterRoutesParams: availableFilterRoutesParams,
          userFilterRoutesParams: userFilterRoutesParams,
        ),
      );
    } on Exception catch (e, stackTrace) {
      _logger.e(
        // ignore: lines_longer_than_80_chars
        'Error fetching available filter routes params: $e, stackTrace: $stackTrace',
      );
      emit(FilterRoutesLoadFailure());
    }
  }

  Future<void> _onUserFilterRoutesChanged(
    UserFilterRoutesChanged event,
    Emitter<FilterRoutesState> emit,
  ) async {
    _logger.d('_onUserFilterRoutesChanged');

    final state = this.state;
    if (state is! FilterRoutesLoadSuccess) {
      return;
    }

    final availableFilterRoutesParams = state.availableFilterRoutesParams;
    final userFilterRoutesParams = event.userFilterRoutesParams;

    emit(
      FilterRoutesLoadSuccess(
        availableFilterRoutesParams: availableFilterRoutesParams,
        userFilterRoutesParams: userFilterRoutesParams,
      ),
    );
  }
}

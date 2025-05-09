import 'package:flutter_travel_app/src/common/utils/exceptions/grpc_exception.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/create_points_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/models/create_point_form_model.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_route_form/create_route_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_route_form/create_route_form_state.dart';
import 'package:flutter_travel_app/src/features/content/shared/data/content_repository.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/create_place_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/create_route_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:logger/logger.dart';

class CreateRouteInteractor {
  final ContentRepository _contentRepository;
  final CreateRouteFormBloc _routeFormBloc;
  final CreatePointsFormBloc _pointsFormBloc;
  final Logger _logger;

  CreateRouteInteractor({
    required CreateRouteFormBloc routeFormBloc,
    required CreatePointsFormBloc pointsFormBloc,
    required ContentRepository contentRepository,
    required Logger logger,
  })  : _routeFormBloc = routeFormBloc,
        _pointsFormBloc = pointsFormBloc,
        _contentRepository = contentRepository,
        _logger = logger;

  Future<void> createRoute() async {
    final routeFormState = _routeFormBloc.state;
    final pointsFormState = _pointsFormBloc.state;

    final placesIds = <PlaceId>[];
    final pathPoints = <PointModel>[];

    if (routeFormState is CreateRouteFormFilled) {
      try {
        for (final point in pointsFormState.points) {
          pathPoints.add(point.location);
          switch (point) {
            case final CreatePlacePointFormModel place:
              final placeId = await _contentRepository.createPlace(
                CreatePlaceModel(
                  name: place.name,
                  description: place.description,
                  location: place.location,
                  address: place.address,
                  images: place.images,
                ),
              );
              placesIds.add(placeId);
            case CreatePathPointFormModel():
          }
        }
        try {
          await _contentRepository.createRoute(
            CreateRouteModel(
              name: routeFormState.name,
              description: routeFormState.description,
              transportType: routeFormState.transportType,
              theme: routeFormState.theme,
              difficulty: routeFormState.difficulty,
              distanceKm: routeFormState.distanceKm,
              placeIds: placesIds,
              pathPoints: pathPoints,
            ),
          );
        } on BaseGrpcException catch (e, stackTrace) {
          _logger.e('Error creating place: $e', stackTrace: stackTrace);
        }
      } on BaseGrpcException catch (e, stackTrace) {
        _logger.e('Error creating route: $e', stackTrace: stackTrace);
      }
    }
  }
}

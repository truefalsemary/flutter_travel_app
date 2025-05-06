import 'package:flutter_travel_app/src/features/content/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_models_converter.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/already_exists_exception.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/internal_server_exception.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/invalid_arguments_exception.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/unknown_server_exception.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';
import 'package:logger/logger.dart';

abstract class ContentRepository {
  Future<RouteModels?> getRouteModels(
    UserFilterRoutesParams? userFilterRoutesParams,
  );
  Future<AvailableFilterRoutesParams> getAvailableFilterRoutesParams();
  Future<void> createRoute(RouteModel route);
}

final class ContentRepositoryImpl implements ContentRepository {
  final ContentApiClient _apiClient;
  final ContentModelsConverter _modelsConverter;
  final Logger _logger;

  const ContentRepositoryImpl({
    required ContentApiClient apiClient,
    required ContentModelsConverter modelsConverter,
    required Logger logger,
  })  : _apiClient = apiClient,
        _modelsConverter = modelsConverter,
        _logger = logger;

  @override
  Future<RouteModels?> getRouteModels(
    UserFilterRoutesParams? userFilterRoutesParams,
  ) async {
    _logger.i('try to get routes');
    final routes = await _apiClient.getRoutes(userFilterRoutesParams);
    return _modelsConverter.convertRoutesToRouteModels(routes);
  }

  @override
  Future<AvailableFilterRoutesParams> getAvailableFilterRoutesParams() async {
    _logger.i('try to get available filter routes params');
    final distanceFilter = await _apiClient.getDistanceFilter();
    return AvailableFilterRoutesParams(
      minDistance: distanceFilter.minKm,
      maxDistance: distanceFilter.maxKm,
      minDifficulty: DifficultyLevel.EASY,
      maxDifficulty: DifficultyLevel.HARD,
    );
  }

  @override
  Future<void> createRoute(RouteModel route) async {
    _logger.i('try to create route');
    final protoRoute = _modelsConverter.convertRouteModelToCreateRouteRequest(
      route,
    );
    try {
      await _apiClient.createRoute(protoRoute);
    } on AlreadyExistsException catch (e) {
      _logger.e('Route already exists: ${e.message}');
    } on InvalidArgumentException catch (e) {
      _logger.e('Invalid argument: ${e.message}');
    } on InternalServerException catch (e) {
      _logger.e('Internal server error: ${e.message}');
    } on UnknownServerException catch (e) {
      _logger.e('Unknown server error: ${e.message}');
    }
  }
}

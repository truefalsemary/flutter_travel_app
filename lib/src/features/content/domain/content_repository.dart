import 'package:flutter_travel_app/src/features/content/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_models_converter.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';
import 'package:logger/logger.dart';

abstract class ContentRepository {
  Future<RouteModels?> getRouteModels(
    UserFilterRoutesParams? userFilterRoutesParams,
  );
  Future<AvailableFilterRoutesParams> getAvailableFilterRoutesParams();
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
}

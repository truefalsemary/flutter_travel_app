import 'package:flutter_travel_app/src/features/content/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_models_converter.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_params.dart';
import 'package:logger/logger.dart';

abstract class ContentRepository {
  Future<RouteModels?> getRouteModels(RouteParams routeParams);
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
  Future<RouteModels?> getRouteModels(RouteParams routeParams) async {
    _logger.i('try to get routes');
    final routes = await _apiClient.getRoutes(routeParams);
    return _modelsConverter.convertRoutesToRouteModels(routes);
  }
}

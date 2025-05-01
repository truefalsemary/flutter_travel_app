import 'package:flutter_travel_app/src/features/content/domain/models/route_params.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

abstract class ContentApiClient {
  Future<Iterable<Route>> getRoutes(RouteParams routeParams);
}

class ContentApiClientImpl implements ContentApiClient {
  final ContentServiceClient _client;
  final Logger _logger;

  ContentApiClientImpl({
    required String host,
    required int port,
    required Logger logger,
  })  : _client = ContentServiceClient(
          ClientChannel(
            host,
            port: port,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ),
          ),
        ),
        _logger = logger;

  @override
  Future<Iterable<Route>> getRoutes(RouteParams routeParams) async {
    _logger.i('try to get routes');
    try {
      final request = GetRoutesRequest();
      final difficultyLevel = routeParams.difficultyLevel;
      final minDistance = routeParams.minDistance;
      final maxDistance = routeParams.maxDistance;

      if (difficultyLevel != null) {
        request.difficultyFilter = difficultyLevel;
      }

      if (minDistance != null || maxDistance != null) {
        request.distanceFilter = DistanceFilter();
        if (minDistance != null) request.distanceFilter.minKm = minDistance;
        if (maxDistance != null) request.distanceFilter.maxKm = maxDistance;
      }

      final response = await _client.getRoutes(request);
      return response.routes;
    } on Exception catch (error, stackTrace) {
      _logger.e('Error in getRoutes: $error', stackTrace: stackTrace);
      rethrow;
    }
  }
}

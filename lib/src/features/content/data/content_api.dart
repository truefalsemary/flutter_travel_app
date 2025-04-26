import 'package:flutter_travel_app/src/generated/lib/src/features/routes/data/proto/content.pbgrpc.dart';
import 'package:grpc/grpc.dart';

abstract class ContentApiClient {
  Future<List<Route>> getRoutes({
    DifficultyLevel? difficulty,
    double? minDistance,
    double? maxDistance,
  });
}

class ContentApiClientImpl implements ContentApiClient {
  final ContentServiceClient _client;

  ContentApiClientImpl({
    required String host,
    required int port,
  }) : _client = ContentServiceClient(
          ClientChannel(
            host,
            port: port,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ),
          ),
        );

  @override
  Future<List<Route>> getRoutes({
    DifficultyLevel? difficulty,
    double? minDistance,
    double? maxDistance,
  }) async {
    try {
      final request = GetRoutesRequest();

      if (difficulty != null) {
        request.difficultyFilter = difficulty;
      }

      if (minDistance != null || maxDistance != null) {
        request.distanceFilter = DistanceFilter();
        if (minDistance != null) request.distanceFilter.minKm = minDistance;
        if (maxDistance != null) request.distanceFilter.maxKm = maxDistance;
      }

      final response = await _client.getRoutes(request);
      return response.routes;
    } catch (e) {
      print('Error in getRoutes: $e');
      rethrow;
    }
  }
}

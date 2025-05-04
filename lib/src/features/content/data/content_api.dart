import 'package:flutter_travel_app/src/features/content/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pbgrpc.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

abstract class ContentApiClient {
  Future<Iterable<Route>> getRoutes(
    UserFilterRoutesParams? userFilterRoutesParams,
  );
  Future<DistanceFilter> getDistanceFilter();
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
  Future<DistanceFilter> getDistanceFilter() async {
    _logger.d('getDistanceFilter');
    final response = await _client.getRoutesFilterOptions(Empty());
    _logger.i(
      // ignore: lines_longer_than_80_chars
      'minKm: ${response.distanceBounds.minKm}, maxKm: ${response.distanceBounds.maxKm}',
    );
    return response.distanceBounds;
  }

  @override
  Future<Iterable<Route>> getRoutes(
    UserFilterRoutesParams? userFilterRoutesParams,
  ) async {
    _logger.i('try to get routes');
    try {
      final request = GetRoutesRequest();
      final minDifficulty = userFilterRoutesParams?.minDifficulty;
      final maxDifficulty = userFilterRoutesParams?.maxDifficulty;
      final minDistance = userFilterRoutesParams?.minDistance;
      final maxDistance = userFilterRoutesParams?.maxDistance;

      if (minDifficulty != null || maxDifficulty != null) {
        request.difficultyFilter = DifficultyFilter();
        if (minDifficulty != null) {
          request.difficultyFilter.minDifficulty = minDifficulty;
        }
        if (maxDifficulty != null) {
          request.difficultyFilter.maxDifficulty = maxDifficulty;
        }
      }

      if (minDistance != null || maxDistance != null) {
        request.distanceFilter = DistanceFilter();
        if (minDistance != null) request.distanceFilter.minKm = minDistance;
        if (maxDistance != null) request.distanceFilter.maxKm = maxDistance;
      }

      final response = await _client.getRoutes(request);
      // _logger.i('response: $response');
      _logger.i('successfully get routes');
      return response.routes;
    } on Exception catch (error, stackTrace) {
      _logger.e('Error in getRoutes: $error', stackTrace: stackTrace);
      rethrow;
    }
  }
}

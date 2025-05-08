import 'package:flutter_travel_app/src/features/content/shared/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/utils/exceptions/grpc_error_exception_parser.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pbgrpc.dart'
    as proto;
import 'package:flutter_travel_app/src/generated/lib/src/proto/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

abstract class ContentApiClient {
  Future<Iterable<proto.Route>> getRoutes(
    UserFilterRoutesParams? userFilterRoutesParams,
  );
  Future<proto.DistanceFilter> getDistanceFilter();
  Future<void> createRoute(proto.CreateRouteRequest request);
}

class ContentApiClientImpl implements ContentApiClient {
  final proto.ContentServiceClient _client;
  final Logger _logger;

  ContentApiClientImpl({
    required String host,
    required int port,
    required Logger logger,
  })  : _client = proto.ContentServiceClient(
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
  Future<proto.DistanceFilter> getDistanceFilter() async {
    _logger.d('getDistanceFilter');
    final response = await _client.getRoutesFilterOptions(Empty());
    _logger.i(
      // ignore: lines_longer_than_80_chars
      'minKm: ${response.distanceBounds.minKm}, maxKm: ${response.distanceBounds.maxKm}',
    );
    return response.distanceBounds;
  }

  @override
  Future<Iterable<proto.Route>> getRoutes(
    UserFilterRoutesParams? userFilterRoutesParams,
  ) async {
    _logger.i('try to get routes');
    try {
      final request = proto.GetRoutesRequest();
      final minDifficulty = userFilterRoutesParams?.minDifficulty;
      final maxDifficulty = userFilterRoutesParams?.maxDifficulty;
      final minDistance = userFilterRoutesParams?.minDistance;
      final maxDistance = userFilterRoutesParams?.maxDistance;

      if (minDifficulty != null || maxDifficulty != null) {
        request.difficultyFilter = proto.DifficultyFilter();
        if (minDifficulty != null) {
          request.difficultyFilter.minDifficulty = minDifficulty;
        }
        if (maxDifficulty != null) {
          request.difficultyFilter.maxDifficulty = maxDifficulty;
        }
      }

      if (minDistance != null || maxDistance != null) {
        request.distanceFilter = proto.DistanceFilter();
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

  @override
  Future<void> createRoute(proto.CreateRouteRequest request) async {
    _logger.i('try to create route');
    try {
      await _client.createRoute(request);
      _logger.i('successfully create route');
    } on GrpcError catch (error) {
      throw error.exception;
    }
  }
}

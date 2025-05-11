import 'package:flutter_travel_app/src/features/content/shared/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pbgrpc.dart'
    as proto;
import 'package:flutter_travel_app/src/generated/lib/src/proto/google/protobuf/empty.pb.dart';
import 'package:grpc/grpc.dart';

abstract class ContentApiClient {
  Future<Iterable<proto.Route>> getRoutes(
    UserFilterRoutesParams? userFilterRoutesParams,
  );

  Future<proto.GetRoutesFilterOptionsResponse> getRoutesFilter();

  Future<proto.UploadImageResponse> uploadImages(
    Stream<proto.UploadImageRequest> request,
  );

  Future<proto.CreatePlaceResponse> createPlace(
    proto.CreatePlaceRequest request,
  );

  Future<proto.CreateRouteResponse> createRoute(
    proto.CreateRouteRequest request,
  );
}

class ContentApiClientImpl implements ContentApiClient {
  final proto.ContentServiceClient _client;

  ContentApiClientImpl({
    required String host,
    required int port,
  }) : _client = proto.ContentServiceClient(
          ClientChannel(
            host,
            port: port,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ),
          ),
        );

  @override
  Future<proto.GetRoutesFilterOptionsResponse> getRoutesFilter() async {
    final response = await _client.getRoutesFilterOptions(Empty());
    return response;
  }

  @override
  Future<Iterable<proto.Route>> getRoutes(
    UserFilterRoutesParams? userFilterRoutesParams,
  ) async {
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
    return response.routes;
  }

  @override
  Future<proto.UploadImageResponse> uploadImages(
    Stream<proto.UploadImageRequest> request,
  ) async {
    final response = await _client.uploadImages(request);
    return response;
  }

  @override
  Future<proto.CreatePlaceResponse> createPlace(
    proto.CreatePlaceRequest request,
  ) async {
    final response = await _client.createPlace(request);
    return response;
  }

  @override
  Future<proto.CreateRouteResponse> createRoute(
    proto.CreateRouteRequest request,
  ) async {
    final response = await _client.createRoute(request);
    return response;
  }
}

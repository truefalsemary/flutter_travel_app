import 'package:flutter_travel_app/src/common/utils/exceptions/grpc_exception.dart';
import 'package:flutter_travel_app/src/features/content/shared/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/content_models_converter.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/create_place_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/create_route_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

typedef PlaceId = String;

abstract class ContentRepository {
  Future<RouteModels?> getRouteModels(
    UserFilterRoutesParams? userFilterRoutesParams,
  );
  Future<AvailableFilterRoutesParams> getAvailableFilterRoutesParams();

  Future<PlaceId> createPlace(CreatePlaceModel place);

  Future<CreateRouteResponse> createRoute(CreateRouteModel route);
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
    try {
      final routes = await _apiClient.getRoutes(userFilterRoutesParams);
      _logger.d(
        // ignore: lines_longer_than_80_chars
        'routes: ${routes.map((route) => route.places.map((place) => '\nLocation(lat: ${place.location.lat},  lon: ${place.location.lon}, \n name: ${place.name}, \n  address: ${place.address})'))}',
      );
      return _modelsConverter.convertRoutesToRouteModels(routes);
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(featureName: 'GetRoutes');
    }
  }

  @override
  Future<AvailableFilterRoutesParams> getAvailableFilterRoutesParams() async {
    _logger.i('try to get available filter routes params');

    try {
      final routesFilter = await _apiClient.getRoutesFilter();
      return _modelsConverter
          .convertGetRoutesFilterOptionsResponseToAvailableFilterRoutesParams(
        routesFilter,
      );
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(
        featureName: 'GetRouteFilterParams',
      );
    }
  }

  @override
  Future<PlaceId> createPlace(
    CreatePlaceModel createPlaceModel,
  ) async {
    try {
      final protoPlace =
          _modelsConverter.convertCreatePlaceModelToCreatePlaceRequest(
        createPlaceModel,
      );

      final response = await _apiClient.createPlace(protoPlace);
      final placeId = response.placeId;

      try {
        final imageUploadRequests = await Future.wait(
          createPlaceModel.images.map(
            (image) => _modelsConverter.convertXFileToUploadImageRequest(
              placeId,
              image,
            ),
          ),
        );
        await _apiClient.uploadImages(
          Stream.fromIterable(imageUploadRequests),
        );

        return placeId;
      } on GrpcError catch (error) {
        throw error.toCustomGrpcException(featureName: 'UploadImages');
      }
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(featureName: 'CreatePlace');
    }
  }

  @override
  Future<CreateRouteResponse> createRoute(CreateRouteModel route) async {
    _logger.d('try to create route');

    try {
      final protoRoute =
          _modelsConverter.convertCreateRouteModelToCreateRouteRequest(
        route,
      );

      final response = await _apiClient.createRoute(protoRoute);

      _logger.d('route created: $response');
      return response;
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(featureName: 'CreateRoute');
    }
  }
}

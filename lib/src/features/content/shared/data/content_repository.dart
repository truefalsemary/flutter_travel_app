import 'package:flutter_travel_app/src/common/utils/exceptions/grpc_exception.dart';
import 'package:flutter_travel_app/src/features/content/shared/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/content_models_converter.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/create_place_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

abstract class ContentRepository {
  Future<RouteModels?> getRouteModels(
    UserFilterRoutesParams? userFilterRoutesParams,
  );
  Future<AvailableFilterRoutesParams> getAvailableFilterRoutesParams();

  Future<void> createPlace(CreatePlaceModel place);

  Future<CreateRouteResponse> createRoute(RouteModel route);
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
  Future<void> createPlace(CreatePlaceModel createPlaceModel) async {
    final protoPlace = _modelsConverter.convertPlaceModelToCreatePlaceRequest(
      createPlaceModel.place,
    );

    try {
      await _apiClient.createPlace(protoPlace);
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(featureName: 'CreatePlace');
    }
    try {
      createPlaceModel.images.map(
        (image) async {
          final uploadImageRequest =
              await _modelsConverter.convertXFileToUploadImageRequest(
            image,
          );
          return _apiClient.uploadImages(Stream.value(uploadImageRequest));
        },
      );
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(featureName: 'UploadImages');
    }
  }

  @override
  Future<CreateRouteResponse> createRoute(RouteModel route) async {
    _logger.i('try to create route');
    final protoRoute = _modelsConverter.convertRouteModelToCreateRouteRequest(
      route,
    );
    try {
      final response = await _apiClient.createRoute(protoRoute);
      return response;
    } on GrpcError catch (error) {
      throw error.toCustomGrpcException(featureName: 'CreateRoute');
    }
  }
}

import 'package:flutter_travel_app/src/features/content/shared/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/image_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/place_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart'
    as proto;
import 'package:image_picker/image_picker.dart';

abstract class ContentModelsConverter {
  proto.Route converRouteModelToRoute(RouteModel routeModel);
  RouteModel convertRouteToRouteModel(proto.Route route);
  RouteModels convertRoutesToRouteModels(Iterable<proto.Route> routes);
  Iterable<proto.Route> converRouteModelsToRoutes(
      Iterable<RouteModel> routeModels);
  proto.CreateRouteRequest convertRouteModelToCreateRouteRequest(
    RouteModel routeModel,
  );

  AvailableFilterRoutesParams
      convertGetRoutesFilterOptionsResponseToAvailableFilterRoutesParams(
    proto.GetRoutesFilterOptionsResponse response,
  );

  proto.CreatePlaceRequest convertPlaceModelToCreatePlaceRequest(
    PlaceModel placeModel,
  );

  Future<proto.UploadImageRequest> convertXFileToUploadImageRequest(
    XFile xFile,
  );
}

final class ContentModelsConverterImpl implements ContentModelsConverter {
  @override
  proto.Route converRouteModelToRoute(RouteModel routeModel) => proto.Route(
        name: routeModel.name,
        description: routeModel.description,
        distanceKm: routeModel.distanceKm,
        userId: routeModel.userId,
        routeId: routeModel.routeId,
      );

  @override
  RouteModel convertRouteToRouteModel(proto.Route route) => RouteModel(
        name: route.name,
        description: route.description,
        distanceKm: route.distanceKm,
        userId: route.userId,
        routeId: route.routeId,
        difficultyLevel: route.difficulty,
        pathPoints: _convertPointsToPointsModel(route.pathPoints),
        places: _convertPlacesToPlaceModels(route.places),
      );

  @override
  Iterable<proto.Route> converRouteModelsToRoutes(
          Iterable<RouteModel> routeModels) =>
      routeModels.map(
        converRouteModelToRoute,
      );

  @override
  RouteModels convertRoutesToRouteModels(Iterable<proto.Route> routes) =>
      routes.map(
        convertRouteToRouteModel,
      );

  @override
  proto.CreateRouteRequest convertRouteModelToCreateRouteRequest(
    RouteModel routeModel,
  ) =>
      proto.CreateRouteRequest(
        name: routeModel.name,
        description: routeModel.description,
        difficulty: routeModel.difficultyLevel,
        distanceKm: routeModel.distanceKm,
        pathPoints: routeModel.pathPoints?.map(
          (point) => proto.Point(lat: point.lat, lon: point.lon),
        ),
        placeIds: routeModel.places.map((place) => place.placeId),
      );

  @override
  AvailableFilterRoutesParams
      convertGetRoutesFilterOptionsResponseToAvailableFilterRoutesParams(
    proto.GetRoutesFilterOptionsResponse response,
  ) {
    final empty = response.empty;

    return AvailableFilterRoutesParams(
      distanceFilter: empty
          ? null
          : DistanceFilterModel(
              minDistance: response.distanceBounds.minKm,
              maxDistance: response.distanceBounds.maxKm,
            ),
      minDifficulty: proto.DifficultyLevel.EASY,
      maxDifficulty: proto.DifficultyLevel.HARD,
    );
  }

  @override
  Future<proto.UploadImageRequest> convertXFileToUploadImageRequest(
    XFile xFile,
  ) async {
    return proto.UploadImageRequest(
      filename: xFile.name,
      content: await xFile.readAsBytes(),
    );
  }

  PointModel _convertPointToPointModel(proto.Point point) => PointModel(
        lat: point.lat,
        lon: point.lon,
      );

  PointModels _convertPointsToPointsModel(Iterable<proto.Point> points) =>
      points.map(
        (point) => PointModel(lat: point.lat, lon: point.lon),
      );

  ImageModel _convertImageToImageModel(proto.Image image) => ImageModel(
        url: image.url,
        placeholder: image.placeholder,
      );

  ImageModels _convertImagesToImageModels(Iterable<proto.Image> images) =>
      images.map(
        _convertImageToImageModel,
      );

  PlaceModel _convertPlaceToPlaceModel(proto.Place place) => PlaceModel(
        name: place.name,
        address: place.address,
        description: place.description,
        location: _convertPointToPointModel(place.location),
        images: _convertImagesToImageModels(place.images),
        placeId: place.placeId,
      );

  PlaceModels _convertPlacesToPlaceModels(Iterable<proto.Place> places) =>
      places.map(
        _convertPlaceToPlaceModel,
      );

  @override
  proto.CreatePlaceRequest convertPlaceModelToCreatePlaceRequest(
    PlaceModel placeModel,
  ) {
    return proto.CreatePlaceRequest(
      name: placeModel.name,
      address: placeModel.address,
      description: placeModel.description,
      location: proto.Point(
        lat: placeModel.location.lat,
        lon: placeModel.location.lon,
      ),
    );
  }
}

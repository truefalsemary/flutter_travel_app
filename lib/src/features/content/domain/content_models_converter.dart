import 'package:flutter_travel_app/src/features/content/domain/models/image_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/place_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';

abstract class ContentModelsConverter {
  Route converRouteModelToRoute(RouteModel routeModel);
  RouteModel convertRouteToRouteModel(Route route);
  RouteModels convertRoutesToRouteModels(Iterable<Route> routes);
  Iterable<Route> converRouteModelsToRoutes(Iterable<RouteModel> routeModels);
  CreateRouteRequest convertRouteModelToCreateRouteRequest(
    RouteModel routeModel,
  );
}

final class ContentModelsConverterImpl implements ContentModelsConverter {
  @override
  Route converRouteModelToRoute(RouteModel routeModel) => Route();

  @override
  RouteModel convertRouteToRouteModel(Route route) => RouteModel(
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
  Iterable<Route> converRouteModelsToRoutes(Iterable<RouteModel> routeModels) =>
      routeModels.map(
        converRouteModelToRoute,
      );

  @override
  RouteModels convertRoutesToRouteModels(Iterable<Route> routes) => routes.map(
        convertRouteToRouteModel,
      );

  @override
  CreateRouteRequest convertRouteModelToCreateRouteRequest(
    RouteModel routeModel,
  ) =>
      CreateRouteRequest(
        name: routeModel.name,
        description: routeModel.description,
        difficulty: routeModel.difficultyLevel,
        distanceKm: routeModel.distanceKm,
        pathPoints: routeModel.pathPoints?.map(
          (point) => Point(lat: point.lat, lon: point.lon),
        ),
        placeIds: routeModel.places.map((place) => place.placeId),
      );
  PointModel _convertPointToPointModel(Point point) => PointModel(
        lat: point.lat,
        lon: point.lon,
      );

  PointModels _convertPointsToPointsModel(Iterable<Point> points) => points.map(
        (point) => PointModel(lat: point.lat, lon: point.lon),
      );

  ImageModel _convertImageToImageModel(Image image) => ImageModel(
        url: image.url,
        placeholder: image.placeholder,
      );

  ImageModels _convertImagesToImageModels(Iterable<Image> images) => images.map(
        _convertImageToImageModel,
      );

  PlaceModel _convertPlaceToPlaceModel(Place place) => PlaceModel(
        name: place.name,
        address: place.address,
        description: place.description,
        location: _convertPointToPointModel(place.location),
        images: _convertImagesToImageModels(place.images),
        placeId: place.placeId,
      );

  PlaceModels _convertPlacesToPlaceModels(Iterable<Place> places) => places.map(
        _convertPlaceToPlaceModel,
      );
}

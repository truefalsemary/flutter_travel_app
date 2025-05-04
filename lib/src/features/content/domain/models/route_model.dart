import 'package:equatable/equatable.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/place_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/point_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';

typedef RouteModels = Iterable<RouteModel>;

final class RouteModel with EquatableMixin {
  final String name;
  final String description;
  final double? distanceKm;
  final String? userId;
  final String routeId;
  final DifficultyLevel? difficultyLevel;
  final PointModels? pathPoints;
  final PlaceModels places;

  RouteModel({
    required this.name,
    required this.description,
    required this.distanceKm,
    required this.userId,
    required this.routeId,
    required this.difficultyLevel,
    required this.pathPoints,
    required this.places,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        distanceKm,
        userId,
        routeId,
        difficultyLevel,
        pathPoints,
        places,
      ];

  // Пример ссылочки: https://yandex.ru/maps/?rtext=59.967870,30.242658~59.898495,30.299559&rtt=mt
  // Дока: https://yandex.ru/dev/yandex-apps-launch-maps/doc/ru/concepts/yandexmaps-web#buildroute
  // В доке обман, в яндекс картах сначала широта и только потом долгота
  String get yandexMapsUrl {
    final prefix = 'https://yandex.ru/maps/?rtext=';

    final points = places.map(
      (place) {
        final lon = place.location.lon.toStringAsFixed(6);
        final lat = place.location.lat.toStringAsFixed(6);
        return '$lat,$lon';
      },
    ).join('~');

    final suffix = '&rtt=pd';

    return '$prefix$points$suffix';
  }

  // Пример ссылочки:: https://2gis.ru/directions/tab/pedestrian/points/37.531542,55.736291;70000001063199639|37.665247,55.759725;4504127912651411
  // Дока: https://help.2gis.ru/question/razrabotchikam-zapusk-ideystviya-vmobilnom-prilozhenii-cherez-deeplink
  String get doubleGisUrl {
    final prefix = 'https://2gis.ru/directions/tab/pedestrian/points/';

    final points = places.map(
      (place) {
        final lon = place.location.lon.toStringAsFixed(6);
        final lat = place.location.lat.toStringAsFixed(6);
        return '$lon,$lat';
      },
    ).join('|');

    return '$prefix$points';
  }
}

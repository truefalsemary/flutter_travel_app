import 'package:flutter/material.dart';
import 'package:flutter_travel_app/resources/resources.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart'
    show Map, MapInputListener, Point;
// ignore: implementation_imports
import 'package:yandex_maps_mapkit_lite/src/bindings/image/image_provider.dart'
    as image_provider;

final class MapInputListenerImpl implements MapInputListener {
  final void Function(Point) onUpdatePoint;

  MapInputListenerImpl({
    required this.onUpdatePoint,
  });

  @override
  void onMapLongTap(Map map, Point point) {}

  @override
  void onMapTap(Map map, Point point) {
    map.mapObjects.clear();

    final image = ResizeImage(
      Image.asset(
        AppImages.marker,
      ).image,
      height: 96,
    );

    map.mapObjects.addPlacemark()
      ..geometry = point
      ..setIcon(image_provider.ImageProvider.fromImageProvider(image));

    onUpdatePoint(point);
  }
}

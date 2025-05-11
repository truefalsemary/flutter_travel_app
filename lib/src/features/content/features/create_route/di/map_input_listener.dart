import 'package:yandex_maps_mapkit_lite/mapkit.dart' show MapInputListener, Map, Point;

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
    map.mapObjects.addPlacemark()..geometry = point..setText('ы');
    onUpdatePoint(point);
  }
 
}

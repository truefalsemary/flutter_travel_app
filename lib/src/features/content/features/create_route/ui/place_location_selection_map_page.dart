import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/di/map_input_listener.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart' show CameraPosition, MapInputListener, MapWindow, Point;
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart' show mapkit;
// ignore: implementation_imports
import 'package:yandex_maps_mapkit_lite/src/mapkit/animation.dart'
    as mapkit_animation;
import 'package:yandex_maps_mapkit_lite/yandex_map.dart' show YandexMap;

class PlaceLocationSelectionMapPage extends StatelessWidget {
  final void Function(Point) onUpdatePoint;
  
  const PlaceLocationSelectionMapPage({required this.onUpdatePoint, super.key});

  @override
  Widget build(BuildContext context) {
    return _PlaceLocationSelectionMapPageContent(
              mapInputListener: MapInputListenerImpl(
                onUpdatePoint: onUpdatePoint,
                ),
            );

  }
}

class _PlaceLocationSelectionMapPageContent extends StatefulWidget {
  final MapInputListener mapInputListener;

  const _PlaceLocationSelectionMapPageContent(
    {required this.mapInputListener,}
  );

  @override
  // ignore: lines_longer_than_80_chars
  State<_PlaceLocationSelectionMapPageContent> createState() => __PlaceLocationSelectionMapPageContentState();
}

// ignore: lines_longer_than_80_chars
class __PlaceLocationSelectionMapPageContentState extends State<_PlaceLocationSelectionMapPageContent> {
  MapWindow? _mapWindow;

  @override
  void initState() {
    super.initState();
    mapkit.onStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);

          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Place Selection'),
      ),
        body: YandexMap(
          onMapCreated: (mapWindow) {
            _mapWindow = mapWindow;
            _mapWindow?.map.moveWithAnimation(
              CameraPosition(
                Point(latitude: 55.751225, longitude: 37.62954),
                zoom: 17,
                azimuth: 150,
                tilt: 30,
              ),
              mapkit_animation.Animation(
                mapkit_animation.AnimationType.Smooth,
                duration: 0.5,
              ),
              
            );
            _mapWindow?.map.addInputListener(widget.mapInputListener);
          },
          ),
      );
  }

  @override
  void dispose() {
    mapkit.onStop();
    super.dispose();
  }
}

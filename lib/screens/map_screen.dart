import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<YandexMapController> mapControllerCompleter =
      Completer<YandexMapController>();
  final PageController _pageController = PageController(viewportFraction: 0.6);
  final ScrollController _scrollController = ScrollController();

  bool _isExpanded = false;

  final List<Image> imageList = [
    Assets.images.element1.image(),
    Assets.images.element2.image(),
    Assets.images.element3.image(),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Карта
          YandexMap(
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
              _moveToInitialLocation(controller);
            },
          ),

          // Контейнер с PageView
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -1) {
                  // свайп вверх
                  setState(() => _isExpanded = true);
                } else if (details.primaryDelta! > 1) {
                  // свайп вниз
                  setState(() => _isExpanded = false);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _isExpanded ? screenHeight * 0.7 : screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, -2)),
                  ],
                ),
                child: _isExpanded
                    ? Listener(
                        onPointerMove: (event) {
                          if (_scrollController.hasClients &&
                              _scrollController.offset <= 0 &&
                              event.delta.dy > 8) {
                            setState(() {
                              _isExpanded = false;
                            });
                          }
                        },
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          physics: const ClampingScrollPhysics(),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 22, right: 30, top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Assets.images.mapScreenModal.image(),
                          ),
                        ),
                      )
                    : _buildCollapsedContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 22, right: 22),
          child: Text(
            "От Китай-города до Пятницкой улицы",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: PageView.builder(
            itemCount: imageList.length,
            controller: _pageController,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: imageList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _moveToInitialLocation(YandexMapController controller) {
    controller.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: Point(latitude: 55.7558, longitude: 37.6173),
          zoom: 15,
        ),
      ),
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 1),
    );
  }
}

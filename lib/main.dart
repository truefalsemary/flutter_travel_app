import 'package:flutter/material.dart';
import 'package:flutter_travel_app/router/router.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}

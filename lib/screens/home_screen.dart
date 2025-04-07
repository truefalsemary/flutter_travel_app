import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';
import 'package:flutter_travel_app/router/router.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: SingleChildScrollView(
        child: Container(
          height: 3000,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Assets.images.mainScreenTop.image(
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 12,
                right: 12,
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    context.pushNamed(AppRouter.searchName);
                  },
                  decoration: InputDecoration(
                    hintText: 'Поиск маршрутов',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(999),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Assets.images.mainScreenCenter.image(),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.mapName);
                        },
                        child: Assets.images.mainScreenBottom.image(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.mapName);
                        },
                        child: Assets.images.mainScreenBottom.image(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.mapName);
                        },
                        child: Assets.images.mainScreenBottom.image(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.mapName);
                        },
                        child: Assets.images.mainScreenBottom.image(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.mapName);
                        },
                        child: Assets.images.mainScreenBottom.image(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

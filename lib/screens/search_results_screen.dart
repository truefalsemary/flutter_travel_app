import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';
import 'package:flutter_travel_app/router/router.dart';
import 'package:go_router/go_router.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, required this.searchText});

  final String searchText;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFE9E9E9),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 40, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Поиск маршрутов',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color(0xFFEEEEEE),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: Colors.black),
                        onPressed: () {},
                        iconSize: 24,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.mapName);
                },
                child: Assets.images.mainScreenBottom.image(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.mapName);
                },
                child: Assets.images.mainScreenBottom.image(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.mapName);
                },
                child: Assets.images.mainScreenBottom.image(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.mapName);
                },
                child: Assets.images.mainScreenBottom.image(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.mapName);
                },
                child: Assets.images.mainScreenBottom.image(),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.mapName);
                },
                child: Assets.images.mainScreenBottom.image(),
              ),
            ],
          ),
        ),
      );
}

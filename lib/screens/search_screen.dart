import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';
import 'package:flutter_travel_app/router/router.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  // ✅ добавляем это
                  child: TextField(
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (text) {
                      context.pushNamed(AppRouter.searchResultsName, extra: text);
                    },
                    decoration: InputDecoration(
                      hintText: 'Поиск маршрутов',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFFEEEEEE),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 8), // немного отступа между полем и кнопкой
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.tune, color: Colors.black),
                    onPressed: () {
                      // действие по нажатию
                    },
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Assets.images.searchScreenContent.image(),
          ),
        ],
      ));
}

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index);
        },
        items: [
          _buildNavItem(Assets.icons.home, 0),
          _buildNavItem(Assets.icons.search, 1),
          _buildNavItem(Assets.icons.addCircle, 2),
          _buildNavItem(Assets.icons.favorite, 3),
          _buildNavItem(Assets.icons.profile, 4),
        ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(SvgGenImage icon, int index) {
    final isActive = navigationShell.currentIndex == index;
    return BottomNavigationBarItem(
      icon: icon.svg(
        height: 24,
        colorFilter: ColorFilter.mode(
          isActive ? const Color(0xFFDFA85E) : Colors.black,
          BlendMode.srcIn,
        ),
      ),
      label: '',
    );
  }
}

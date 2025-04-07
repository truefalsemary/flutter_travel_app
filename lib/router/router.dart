import 'package:flutter/material.dart';
import 'package:flutter_travel_app/router/root_screen.dart';
import 'package:flutter_travel_app/screens/create_route_2_screen.dart';
import 'package:flutter_travel_app/screens/create_route_screen.dart';
import 'package:flutter_travel_app/screens/home_screen.dart';
import 'package:flutter_travel_app/screens/map_screen.dart';
import 'package:flutter_travel_app/screens/profile_screen.dart';
import 'package:flutter_travel_app/screens/search_results_screen.dart';
import 'package:flutter_travel_app/screens/search_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  const AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static const searchName = 'search';
  static const searchPath = '/search';

  static const searchResultsName = 'search_results';
  static const searchResultsPath = '/search_results';

  static const mapName = 'map_screen';
  static const mapPath = '/map_screen';

  static const createRoute2Name = 'create_screen';
  static const createRoute2Path = '/create_screen';

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                name: searchName,
                path: searchPath,
                builder: (context, state) => const SearchScreen(),
                routes: [
                  GoRoute(
                      name: searchResultsName,
                      path: searchResultsPath,
                      builder: (context, state) => SearchResultsScreen(
                            searchText: state.extra as String,
                          ),
                      routes: [
                        GoRoute(
                          path: mapPath,
                          name: mapName,
                          builder: (context, state) => MapScreen(),
                        )
                      ])
                ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/create',
                builder: (context, state) => const CreateRouteScreen(),
                routes: [
                  GoRoute(
                    path: createRoute2Path,
                    name: createRoute2Name,
                    builder: (context, state) => const CreateRoute2Screen(),
                  )
                ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesScreen(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ]),
        ],
      ),
    ],
  );
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Favorites')));
}

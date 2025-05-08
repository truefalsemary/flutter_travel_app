import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/app/router/app_routes.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/features/content/features/route_details/route_details_page.dart';
import 'package:flutter_travel_app/src/features/content/features/routes_list/ui/content_page.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';
import 'package:go_router/go_router.dart';

abstract class AppGoRouter {
  static GoRouter getRouter(AppScope appScope) => GoRouter(
        observers: [],
        initialLocation: AppRoutes.root,
        routes: <RouteBase>[
          StatefulShellRoute.indexedStack(
            // builder: (context, state, child) => ContentPage(
            //   appScope: this,
            // ),
            builder: (context, state, navigationShell) {
              return Scaffold(
                body: navigationShell,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: navigationShell.currentIndex,
                  selectedIconTheme: IconThemeData().copyWith(
                    color: context.colors.selectedItemColor,
                  ),
                  backgroundColor: context.colors.mainBg,
                  unselectedIconTheme: IconThemeData().copyWith(
                    color: context.colors.unselectedItemColor,
                  ),
                  iconSize: 32,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    navigationShell.goBranch(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      //  SvgPicture.asset(AppVectors.home),
                      label: context.strings.homeTabName,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add),
                      // SvgPicture.asset(AppVectors.add),
                      label: context.strings.createRouteTabName,
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.person),
                    //   // SvgPicture.asset(AppVectors.person),
                    //   label: context.strings.profileTabName,
                    // ),
                  ],
                ),
              );
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.root,
                    builder: (context, state) => ContentPage(
                      appScope: appScope,
                    ),
                    routes: [
                      GoRoute(
                        path: AppRoutes.routeDetails,
                        builder: (context, state) => RouteDetailsPage(
                          route: state.extra! as RouteModel,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.createRoute,
                    builder: (context, state) => Scaffold(),
                  ),
                ],
              ),
              // StatefulShellBranch(
              //   routes: [
              //     GoRoute(
              //         path: AppRoutes.createRouteFirstPage,
              //         builder: (context, state) => CreateRouteStartPage(),
              //         routes: [
              //           GoRoute(
              //             path: AppRoutes.createRouteSecondPage,
              //             builder: (context, state) => Scaffold(),
              //           ),
              //         ]),
              //   ],
              // ),
            ],
          ),
        ],
      );
}

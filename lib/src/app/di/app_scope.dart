import 'package:flutter_travel_app/src/app/theme_mode_provider.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/ui/content_page.dart';
import 'package:flutter_travel_app/src/features/content/ui/route_page.dart';
import 'package:flutter_travel_app/src/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AppScope implements Scope {
  GoRouter get routerDelegate;

  ThemeModeProvider get themeModeProvider;
}

class AppScopeContainer extends ScopeContainer implements AppScope {
  AppScopeContainer();

  @override
  GoRouter get routerDelegate => _routerDelegateDep.get;

  @override
  ThemeModeProvider get themeModeProvider => _themeModeProviderDep.get;

  late final _routerDelegateDep = dep(
    () => GoRouter(
      observers: [],
      routes: [
        GoRoute(
          path: AppRoutes.root,
          name: AppRoutes.rootName,
          builder: (context, state) => ContentPage(
            appScope: this,
          ),
          routes: [
            GoRoute(
              path: AppRoutes.routePath,
              name: AppRoutes.routeName,
              builder: (context, state) => RoutePage(
                route: state.extra! as RouteModel,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  late final _themeModeProviderDep = dep(ThemeModeProvider.new);
}

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  @override
  AppScopeContainer createContainer() => AppScopeContainer();
}

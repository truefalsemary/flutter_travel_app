import 'package:flutter_travel_app/src/features/content/ui/content_page.dart';
import 'package:flutter_travel_app/src/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AppScope implements Scope {
  GoRouter get routerDelegate;
}

class AppScopeContainer extends ScopeContainer implements AppScope {
  @override
  GoRouter get routerDelegate => _routerDelegateDep.get;

  late final _routerDelegateDep = dep(
    () => GoRouter(
      observers: [],
      routes: [
        GoRoute(
          path: AppRoutes.root,
          builder: (context, state) => ContentPage(
            appScope: this,
          ),
        ),
      ],
    ),
  );
}

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  @override
  AppScopeContainer createContainer() => AppScopeContainer();
}

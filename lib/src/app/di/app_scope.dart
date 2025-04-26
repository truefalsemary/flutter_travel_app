import 'package:go_router/go_router.dart';
import 'package:yx_scope/yx_scope.dart';

import '../../features/content/ui/content_page.dart';
import '../../router/app_routes.dart';

abstract class AppScopeContainer extends ScopeContainer {
  GoRouter get routerDelegate;
}

class _AppScopeContainerImpl extends AppScopeContainer {
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
  AppScopeContainer createContainer() => _AppScopeContainerImpl();
}

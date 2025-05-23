import 'package:flutter_travel_app/src/app/router/app_go_router.dart';
import 'package:flutter_travel_app/src/app/theme_mode_provider.dart';
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
    () => AppGoRouter.getRouter(this),
  );

  late final _themeModeProviderDep = dep(ThemeModeProvider.new);
}

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  @override
  AppScopeContainer createContainer() => AppScopeContainer();
}

import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/features/content/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/data/content_api_constants.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_bloc.dart';
import 'package:logger/logger.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class ContentScopeContainer
    extends ChildScopeContainer<AppScopeContainer> {
  ContentScopeContainer({required super.parent});

  RoutesBloc get routesBloc;
}

class _ContentScopeContainerImpl extends ContentScopeContainer {
  _ContentScopeContainerImpl({required super.parent});

  @override
  RoutesBloc get routesBloc => _routesBlocDep.get;

  late final _contentApiDep = dep(
    () => ContentApiClientImpl(
      host: ContentApiConstants.host,
      port: ContentApiConstants.port,
    ),
  );

  late final _routesBlocDep = dep(
    () => RoutesBloc(
      contentApiClient: _contentApiDep.get,
      logger: Logger(),
    ),
  );
}

class ContentScopeHolder
    extends ChildScopeHolder<ContentScopeContainer, AppScopeContainer> {
  ContentScopeHolder(super.parent);

  @override
  ContentScopeContainer createContainer(AppScopeContainer parent) =>
      _ContentScopeContainerImpl(
        parent: parent,
      );
}

import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/common/data/api_constants.dart';
import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/features/content/shared/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/shared/data/content_repository.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/bloc/filter_routes/filter_routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/bloc/routes/routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/content_models_converter.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class ContentScope implements Scope {
  RoutesBloc get routesBloc;
  FilterRoutesBloc get filterRoutesBloc;
  ContentRepository get contentRepository;
  ContentModelsConverter get modelsConverter;
}

class ContentScopeContainer extends ChildScopeContainer<AppScope>
    implements ContentScope {
  ContentScopeContainer({required super.parent});

  @override
  RoutesBloc get routesBloc => _routesBlocDep.get;

  @override
  FilterRoutesBloc get filterRoutesBloc => _filterRoutesBlocDep.get;

  @override
  ContentRepository get contentRepository => _contentRepositoryDep.get;

  @override
  ContentModelsConverter get modelsConverter => _modelsConverterDep.get;

  late final _loggerFactory = dep(() => const NamedLoggerFactory());

  late final _contentApiDep = dep(
    () => ContentApiClientImpl(
      host: ApiConstants.host,
      port: ApiConstants.port,
    ),
  );

  late final _modelsConverterDep = dep(
    ContentModelsConverterImpl.new,
  );

  late final _contentRepositoryDep = dep(
    () => ContentRepositoryImpl(
      apiClient: _contentApiDep.get,
      modelsConverter: _modelsConverterDep.get,
      logger: _loggerFactory.get.getLogger(
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.repository,
      ),
    ),
  );

  late final _routesBlocDep = dep(
    () => RoutesBloc(
      contentRepository: _contentRepositoryDep.get,
      logger: _loggerFactory.get.getLogger(
        name: 'RoutesBloc',
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.bloc,
      ),
    ),
  );

  late final _filterRoutesBlocDep = dep(
    () => FilterRoutesBloc(
      contentRepository: _contentRepositoryDep.get,
      logger: _loggerFactory.get.getLogger(
        name: 'FilterRoutesBloc',
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.bloc,
      ),
    ),
  );
}

class ContentScopeHolder
    extends ChildScopeHolder<ContentScopeContainer, AppScope> {
  ContentScopeHolder(super.parent);

  @override
  ContentScopeContainer createContainer(AppScope parent) =>
      ContentScopeContainer(
        parent: parent,
      );
}

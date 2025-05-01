import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/common/named_logger_factory.dart';
import 'package:flutter_travel_app/src/features/content/data/content_api.dart';
import 'package:flutter_travel_app/src/features/content/data/content_api_constants.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_models_converter.dart';
import 'package:flutter_travel_app/src/features/content/domain/content_repository.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class ContentScope implements Scope {
  RoutesBloc get routesBloc;
}

class ContentScopeContainer extends ChildScopeContainer<AppScope>
    implements ContentScope {
  ContentScopeContainer({required super.parent});

  @override
  RoutesBloc get routesBloc => _routesBlocDep.get;

  late final _loggerFactory = dep(() => const NamedLoggerFactory());

  late final _contentApiDep = dep(
    () => ContentApiClientImpl(
      host: ContentApiConstants.host,
      port: ContentApiConstants.port,
      logger: _loggerFactory.get.getLogger(
        feature: LoggerFeature.content,
        layer: LoggerLayers.data,
        type: LoggerTypes.api,
      ),
    ),
  );

  late final _modelsConverter = dep(
    ContentModelsConverterImpl.new,
  );

  late final _contentRepository = dep(
    () => ContentRepositoryImpl(
      apiClient: _contentApiDep.get,
      modelsConverter: _modelsConverter.get,
      logger: _loggerFactory.get.getLogger(
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.repository,
      ),
    ),
  );

  late final _routesBlocDep = dep(
    () => RoutesBloc(
      contentRepository: _contentRepository.get,
      logger: _loggerFactory.get.getLogger(
        name: 'RoutesBloc',
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

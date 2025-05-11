import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_points_form/create_points_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/bloc/create_route_form/create_route_form_bloc.dart';
import 'package:flutter_travel_app/src/features/content/features/create_route/ui/logic/create_route_form_interactor.dart';
import 'package:flutter_travel_app/src/features/content/shared/di/content_scope.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class CreateRouteScope implements Scope {
  CreateRouteFormBloc get createRouteFormBloc;
  CreatePointsFormBloc get createPointsFormBloc;
  CreateRouteInteractor get createRouteInteractor;
}

class CreateRouteScopeContainer
    extends ChildScopeContainer<ContentScopeContainer>
    implements CreateRouteScope {
  CreateRouteScopeContainer({
    required super.parent,
  });

  @override
  CreatePointsFormBloc get createPointsFormBloc => _createPointsFormBlocDep.get;

  @override
  CreateRouteFormBloc get createRouteFormBloc => _createRouteFormBlocDep.get;

  @override
  CreateRouteInteractor get createRouteInteractor =>
      _createRouteInteractorDep.get;


  late final _loggerFactory = dep(() => const NamedLoggerFactory());

  late final _createPointsFormBlocDep = dep(
    () => CreatePointsFormBloc(
      logger: _loggerFactory.get.getLogger(
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.bloc,
      ),
    ),
  );

  late final _createRouteFormBlocDep = dep(
    () => CreateRouteFormBloc(
      logger: _loggerFactory.get.getLogger(
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.bloc,
      ),
    ),
  );

  late final _createRouteInteractorDep = dep(
    () => CreateRouteInteractor(
      routeFormBloc: _createRouteFormBlocDep.get,
      pointsFormBloc: _createPointsFormBlocDep.get,
      contentRepository: parent.contentRepository,
      logger: _loggerFactory.get.getLogger(
        feature: LoggerFeature.content,
        layer: LoggerLayers.domain,
        type: LoggerTypes.bloc,
      ),
    ),
  );
}

class CreateRouteScopeHolder
    extends ChildScopeHolder<CreateRouteScopeContainer, ContentScopeContainer> {
  CreateRouteScopeHolder(super.parent);

  @override
  CreateRouteScopeContainer createContainer(ContentScopeContainer parent) =>
      CreateRouteScopeContainer(
        parent: parent,
      );
}

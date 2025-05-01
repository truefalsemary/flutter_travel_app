import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/features/content/di/content_scope.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_event.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_state.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class ContentPage extends StatefulWidget {
  final AppScope appScope;

  const ContentPage({
    required this.appScope,
    super.key,
  });

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  late final ContentScopeHolder _contentScopeHolder;

  @override
  void initState() {
    super.initState();
    _contentScopeHolder = ContentScopeHolder(widget.appScope);
    _contentScopeHolder.create();
  }

  @override
  Widget build(BuildContext context) {
    return ScopeProvider(
      holder: _contentScopeHolder,
      child: ScopeBuilder<ContentScopeContainer>.withPlaceholder(
        builder: (context, scope) {
          final routesBloc = scope.routesBloc;

          return Scaffold(
            body: BlocProvider(
              create: (_) => routesBloc,
              child: BlocBuilder<RoutesBloc, RoutesState>(
                builder: (_, state) {
                  switch (state) {
                    case RoutesInitial():
                      routesBloc.add(RoutesFetched());
                      return const Center(child: CircularProgressIndicator());
                    case RoutesLoadInProgress():
                      return const Center(child: CircularProgressIndicator());
                    case RoutesLoadSuccess():
                      // TODO(truefalsemary): Лен, тут надо красивенько
                      // выводить список маршрутов
                      return ListView.builder(
                        itemCount: state.routes.length,
                        itemBuilder: (_, index) {
                          final route = state.routes.elementAt(index);
                          return Column(
                            children: [
                              Text(route.name),
                              Text(route.routeId),
                              Text(route.distanceKm.toString()),
                              ...route.places.map((place) => Text(place.name)),
                            ],
                          );
                        },
                      );
                    case RoutesLoadFailure():
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Center(
                              child: Text('Заебись. Чето полетело опять...'),
                            ),
                            ElevatedButton(
                              child: const Text('Пожалуйста, заработай!'),
                              onPressed: () => routesBloc.add(RoutesFetched()),
                            ),
                          ],
                        ),
                      );
                  }
                },
              ),
            ),
          );
        },
        placeholder: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    _contentScopeHolder.drop();
    super.dispose();
  }
}

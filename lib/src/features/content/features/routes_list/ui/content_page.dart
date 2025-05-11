import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/app/router/app_routes.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_range_slider_container.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/features/content/shared/di/content_scope.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/bloc/filter_routes/filter_routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/bloc/routes/routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/filter_routes_params.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/ui/export.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart'
    as proto;
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

part 'widgets/filter_modal.dart';
part 'widgets/route_card.dart';

class ContentPage extends StatelessWidget {
  final AppScope appScope;

  const ContentPage({
    required this.appScope,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      ScopeBuilder<ContentScopeContainer>.withPlaceholder(
        builder: (context, scope) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<FilterRoutesBloc>(
                create: (_) => scope.filterRoutesBloc
                  ..add(
                    AvailableFilterRoutesFetched(),
                  ),
              ),
              BlocProvider<RoutesBloc>(
                create: (_) => scope.routesBloc,
              ),
            ],
            child: Scaffold(
              backgroundColor: context.colors.separator,
              appBar: AppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                surfaceTintColor: context.colors.mainBg,
                shadowColor: context.colors.mainBg,
                backgroundColor: context.colors.mainBg,
                title: AppText(
                  context.strings.routesTitle,
                  colors: context.colors,
                  style: AppFonts.appBarTitle,
                ),
                actions: [
                  BlocBuilder<FilterRoutesBloc, FilterRoutesState>(
                    builder: (context, state) {
                      if (state is FilterRoutesLoadSuccess) {
                        return IconButton(
                          icon: Icon(
                            Icons.tune,
                            color: context.colors.mainText,
                          ),
                          onPressed: () => _showFilterModal(
                            context,
                            filterRoutesState: state,
                            filterRoutesBloc: scope.filterRoutesBloc,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.brightness_6,
                      color: context.colors.mainText,
                    ),
                    onPressed: () => appScope.themeModeProvider.toggleTheme(),
                  ),
                ],
              ),
              body: BlocBuilder<RoutesBloc, RoutesState>(
                builder: (_, state) {
                  return BlocListener<FilterRoutesBloc, FilterRoutesState>(
                    listenWhen: (previous, current) =>
                        previous is FilterRoutesLoadSuccess &&
                        current is FilterRoutesLoadSuccess &&
                        previous.userFilterRoutesParams !=
                            current.userFilterRoutesParams,
                    listener: (_, state) {
                      if (state is FilterRoutesLoadSuccess) {
                        scope.routesBloc.add(
                          RoutesFetched(
                            userFilterRoutesParams:
                                state.userFilterRoutesParams,
                          ),
                        );
                      }
                    },
                    child: Builder(
                      builder: (context) {
                        switch (state) {
                          case RoutesInitial():
                            scope.routesBloc.add(RoutesFetched());
                            return const Center(
                                child: CircularProgressIndicator());
                          case RoutesLoadInProgress():
                            return const Center(
                                child: CircularProgressIndicator());
                          case RoutesLoadSuccess():
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: ListView.builder(
                                itemCount: state.routes.length,
                                itemBuilder: (_, index) {
                                  final route = state.routes.elementAt(index);
                                  return _RouteCard(route: route);
                                },
                              ),
                            );
                          case RoutesLoadFailure():
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    context.strings.errorMessage,
                                    colors: context.colors,
                                  ),
                                  ElevatedButton(
                                    child: AppText(
                                      context.strings.retryButton,
                                      colors: context.colors,
                                    ),
                                    onPressed: () => scope.routesBloc.add(
                                      RoutesFetched(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
        placeholder: const Center(child: CircularProgressIndicator()),
      );

  void _showFilterModal(
    BuildContext context, {
    required FilterRoutesLoadSuccess filterRoutesState,
    required FilterRoutesBloc filterRoutesBloc,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _FilterModal(
          filterRoutesState: filterRoutesState,
          filterRoutesBloc: filterRoutesBloc,
        );
      },
    );
  }
}

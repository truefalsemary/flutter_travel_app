import 'package:blurhash_ffi/blurhashffi_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel_app/resources/resources.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/features/content/di/content_scope.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_event.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_state.dart';
import 'package:flutter_travel_app/src/features/content/domain/constants/filter_constants.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/image_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/ui/filter_modal.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pb.dart'
    as proto;
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

part 'widgets/image_model_carousel.dart';
part 'widgets/route_card.dart';
part 'widgets/route_deeplinks_buttons.dart';

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
                style: AppFonts.appBarTitle,
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: context.colors.mainText,
                  ),
                  onPressed: () => _showFilterModal(
                    context,
                    routesBloc: routesBloc,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.brightness_6,
                    color: context.colors.mainText,
                  ),
                  onPressed: () =>
                      widget.appScope.themeModeProvider.toggleTheme(),
                ),
              ],
            ),
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
                            AppText(context.strings.errorMessage),
                            ElevatedButton(
                              child: AppText(
                                context.strings.retryButton,
                              ),
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

  void _showFilterModal(
    BuildContext context, {
    required RoutesBloc routesBloc,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final routeBlocState = routesBloc.state;
        return FilterModal(
          routeParams: routeBlocState is RoutesLoadSuccess
              ? (routeBlocState.routeParams?.toFilterRoutesParams ??
                  (
                    minDistance: RouteParamsFilterConstants.defaultMinDistance,
                    maxDistance: RouteParamsFilterConstants.defaultMaxDistance,
                    minDifficulty:
                        RouteParamsFilterConstants.defaultMinDifficulty,
                    maxDifficulty:
                        RouteParamsFilterConstants.defaultMaxDifficulty,
                  ))
              : (
                  minDistance: RouteParamsFilterConstants.defaultMinDistance,
                  maxDistance: RouteParamsFilterConstants.defaultMaxDistance,
                  minDifficulty:
                      RouteParamsFilterConstants.defaultMinDifficulty,
                  maxDifficulty:
                      RouteParamsFilterConstants.defaultMaxDifficulty,
                ),
          onFilterRoutes: ({
            routeParams,
          }) {
            routesBloc.add(
              RoutesFetched(
                routeParams: routeParams,
              ),
            );
          },
        );
      },
    );
  }
}

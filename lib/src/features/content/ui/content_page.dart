import 'package:blurhash_ffi/blurhashffi_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pb.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';
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

class _RouteCard extends StatelessWidget {
  final RouteModel route;

  const _RouteCard({required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.cardBg,
      margin: const EdgeInsets.only(
        bottom: 11,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageModelsCarouselWidget(
              imageModels: route.places.expand(
                (place) => place.images,
              ),
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _CardBodyWidget(route: route),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardBodyWidget extends StatelessWidget {
  final RouteModel route;

  const _CardBodyWidget({required this.route});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardBodyTitleWidget(
              title: route.name,
              difficultyLevel: route.difficultyLevel,
              distanceKm: route.distanceKm,
            ),
            const SizedBox(height: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  context.strings.placesOnRoute,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                ...route.places.map(
                  (place) => Padding(
                    padding: place != route.places.last
                        ? const EdgeInsets.only(bottom: 8)
                        : EdgeInsets.zero,
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppText(
                            place.name,
                            color: context.colors.cardText,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class _CardBodyTitleWidget extends StatelessWidget {
  final String title;
  final DifficultyLevel? difficultyLevel;
  final double? distanceKm;

  const _CardBodyTitleWidget({
    required this.title,
    required this.difficultyLevel,
    required this.distanceKm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          title,
          color: context.colors.cardText,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Icon(Icons.house, size: 16),
            const SizedBox(width: 7),
            AppText(
              '${distanceKm?.toStringAsFixed(1) ?? 0} км',
              color: context.colors.cardText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 10),
            AppText(
              _getDifficultyText(context, difficultyLevel),
              color: context.colors.minorText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  String _getDifficultyText(
    BuildContext context,
    DifficultyLevel? difficulty,
  ) =>
      switch (difficulty) {
        DifficultyLevel.EASY => context.strings.easyDifficulty,
        DifficultyLevel.MEDIUM => context.strings.mediumDifficulty,
        DifficultyLevel.HARD => context.strings.hardDifficulty,
        _ => context.strings.unknownDifficulty
      };
}

class _ImageModelsCarouselWidget extends StatelessWidget {
  final ImageModels imageModels;
  final double height;

  const _ImageModelsCarouselWidget({
    required this.imageModels,
    required this.height,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: PageView.builder(
          itemCount: imageModels.length,
          itemBuilder: (context, index) {
            final image = imageModels.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CachedNetworkImage(
                imageUrl: image.url,
                imageBuilder: (context, imageProvider) => DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                placeholder: (_, __) => DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: BlurhashFfiImage(image.placeholder),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}

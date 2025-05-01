import 'package:blurhash_ffi/blurhashffi_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/src/app/di/app_scope.dart';
import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/features/content/di/content_scope.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_bloc.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_event.dart';
import 'package:flutter_travel_app/src/features/content/domain/bloc/routes_state.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/image_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pbenum.dart';
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
            backgroundColor: Color(0xFFEEEEEE),
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
                          return _RouteCard(route: route);
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

class _RouteCard extends StatelessWidget {
  final RouteModel route;

  const _RouteCard({required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(
        bottom: 11,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel of photos from all places
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
            // Places list
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Места на маршруте:',
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
                          child: Text(
                            place.name,
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
        // Route name
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 2),
        // Distance and difficulty
        Row(
          children: [
            Icon(Icons.house, size: 16),
            const SizedBox(width: 7),
            Text(
              '${distanceKm?.toStringAsFixed(1) ?? 0} км',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 10),
            Text(
              _getDifficultyText(difficultyLevel),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Color(0xFF949494),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  String _getDifficultyText(DifficultyLevel? difficulty) {
    switch (difficulty) {
      case DifficultyLevel.EASY:
        return 'простой';
      case DifficultyLevel.MEDIUM:
        return 'средний';
      case DifficultyLevel.HARD:
        return 'сложный';
      default:
        return 'Не указано';
    }
  }
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
                      )),
            );
          },
        ),
      );
}

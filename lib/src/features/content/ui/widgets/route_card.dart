part of '../content_page.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: AppText(
                route.description,
                color: context.colors.minorText,
              ),
            ),
            _RouteDeeplinksButtons(
              route: route,
            ),
          ],
        ),
      );
}

class _CardBodyTitleWidget extends StatelessWidget {
  final String title;
  final proto.DifficultyLevel? difficultyLevel;
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
    proto.DifficultyLevel? difficulty,
  ) =>
      switch (difficulty) {
        proto.DifficultyLevel.EASY => context.strings.easyDifficulty,
        proto.DifficultyLevel.MEDIUM => context.strings.mediumDifficulty,
        proto.DifficultyLevel.HARD => context.strings.hardDifficulty,
        _ => context.strings.unknownDifficulty
      };
}

part of '../content_page.dart';

class _RouteCard extends StatelessWidget {
  final RouteModel route;

  const _RouteCard({required this.route});

  @override
  Widget build(BuildContext context) {
    final String? tempAvatarUrl = null;
    return GestureDetector(
      onTap: () => context.go(AppRoutes.routeDetails, extra: route),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.cardBg,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PostHeader(
                  username: 'alina_ivanova',
                  createdAt:
                      DateTime.now().subtract(const Duration(minutes: 10)),
                  avatarUrl: tempAvatarUrl,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ImageModelsCarouselWidget(
                imageModels: route.places.expand(
                  (place) => place.images,
                ),
                height: 200,
                padding: 16,
              ),
              _CardBodyWidget(route: route),
            ],
          ),
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
            const SizedBox(height: 10),
            ExpandableDescriptionText(
              text: route.description,
            ),
            const SizedBox(
              height: 12,
            ),
            RouteDeeplinksButtons(
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
          colors: context.colors,
          color: context.colors.cardText,
          style: AppFonts.title,
        ),
        const SizedBox(height: 5),
        RouteParametersSection(
          difficultyLevel: difficultyLevel,
          distanceKm: distanceKm,
        ),
      ],
    );
  }
}

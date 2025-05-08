import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/place_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/shared/ui/export.dart';
import 'package:flutter_travel_app/src/features/content/shared/ui/widgets/route_timeline.dart';

class RouteDetailsPage extends StatelessWidget {
  const RouteDetailsPage({required this.route, super.key});

  final RouteModel route;

  @override
  Widget build(BuildContext context) {
    final String? tempAvatarUrl = null;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          route.name,
          colors: context.colors,
          style: AppFonts.largeTitle,
        ),
        backgroundColor: context.colors.mainBg,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
      ),
      backgroundColor: context.colors.mainBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PostHeader(
                  username: 'alina_ivanova',
                  createdAt:
                      DateTime.now().subtract(const Duration(minutes: 10)),
                  avatarUrl: tempAvatarUrl,
                ),
                AppElevatedButton.main(
                    child: Text('Подписаться'), onPressed: () {}),
              ],
            ),
            SizedBox(height: 20),
            RouteParametersSection(
              difficultyLevel: route.difficultyLevel,
              distanceKm: route.distanceKm,
            ),
            SizedBox(height: 4),
            AppText(
              route.description,
              style: AppFonts.regularText,
              colors: context.colors,
            ),
            const SizedBox(height: 24),
            _RouteTimeline(places: route.places),
          ],
        ),
      ),
    );
  }
}

class _RouteTimeline extends StatelessWidget {
  final Iterable<PlaceModel> places;

  const _RouteTimeline({required this.places});

  @override
  Widget build(BuildContext context) => // В RouteDetailsPage
      RouteTimeline(
        itemCount: places.length,
        itemBuilder: (
          context, {
          required index,
          required itemCount,
          required isFirst,
          required isLast,
        }) {
          final place = places.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    place.name,
                    style: AppFonts.largeTitle,
                    colors: context.colors,
                  ),
                  AppText(
                    itemCount,
                    style: AppFonts.largeTitle,
                    color: context.colors.minorText,
                    colors: context.colors,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ImageModelsCarouselWidget(
                imageModels: place.images,
                height: 170,
              ),
              const SizedBox(height: 12),
              ExpandableDescriptionText(
                text: place.description,
                maxLines: 2,
              ),
            ],
          );
        },
        itemWrapper: (child) => child, // или любая другая обертка
      );
}

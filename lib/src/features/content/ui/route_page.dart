import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/place_model.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_model.dart';
import 'package:flutter_travel_app/src/features/content/ui/widgets/description_text.dart';
import 'package:flutter_travel_app/src/features/content/ui/widgets/image_model_carousel.dart';
import 'package:flutter_travel_app/src/features/content/ui/widgets/post_header.dart';
import 'package:flutter_travel_app/src/features/content/ui/widgets/route_deeplinks_buttons.dart';
import 'package:flutter_travel_app/src/features/content/ui/widgets/route_parameters.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({required this.route, super.key});

  final RouteModel route;

  @override
  Widget build(BuildContext context) {
    final String? tempAvatarUrl = null;

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          route.name,
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
            SizedBox(
              height: 20,
            ),
            RouteParameters(
              difficultyLevel: route.difficultyLevel,
              distanceKm: route.distanceKm,
            ),
            SizedBox(
              height: 4,
            ),
            AppText(
              route.description,
              style: AppFonts.regularText,
            ),
            const SizedBox(height: 24),
            ...route.places.toList().asMap().entries.map(
              (entry) {
                final index = entry.key;
                return _PlaceTile(
                    isFirst: index == 0,
                    isLast: index == route.places.length - 1,
                    place: entry.value,
                    placeCount: '${index + 1}/${route.places.length}');
              },
            ),
            SizedBox(
              height: 24,
            ),
            RouteDeeplinksButtons(
              route: route,
            )
          ],
        ),
      ),
    );
  }
}

class _PlaceTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final PlaceModel place;
  final String placeCount;

  const _PlaceTile({
    required this.isFirst,
    required this.isLast,
    required this.place,
    required this.placeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16,
          top: 0,
          bottom: 0,
          child: CustomPaint(
            painter: _RouteLinePainter(
                isFirst: isFirst,
                isLast: isLast,
                color: context.colors.mainIconColor),
          ),
        ),
        _PlaceContainer(
          place: place,
          placeCount: placeCount,
        ),
      ],
    );
  }
}

class _PlaceContainer extends StatelessWidget {
  const _PlaceContainer({required this.place, required this.placeCount});

  final PlaceModel place;
  final String placeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 46, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  place.name,
                  style: AppFonts.largeTitle,
                ),
                AppText(
                  placeCount,
                  style: AppFonts.largeTitle,
                  color: context.colors.minorText,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: AppText(
              place.address,
              style: AppFonts.smallText,
              color: context.colors.minorText,
            ),
          ),
          const SizedBox(height: 16),
          ImageModelsCarouselWidget(
            imageModels: place.images,
            height: 170,
            padding: 6,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: DescriptionText(
              text: place.description,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteLinePainter extends CustomPainter {
  final bool isFirst;
  final bool isLast;
  final Color color;

  _RouteLinePainter({
    required this.isFirst,
    required this.isLast,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const topOffset = 4;
    const double radius = 8;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 3;

    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    const circleY = radius + topOffset; // точка смещена вниз
    final lineTop = circleY - radius; // линия будет на 4 пикселя выше точки

    // Линия для первой точки
    if (!isFirst) {
      canvas.drawLine(
        Offset(centerX, 0),
        Offset(centerX, lineTop),
        linePaint,
      );
    }

    // Линия для последней точки
    if (!isLast) {
      canvas.drawLine(
        Offset(centerX, circleY + radius),
        Offset(centerX, size.height),
        linePaint,
      );
    }

    // Точка (круг)
    canvas.drawCircle(Offset(centerX, circleY), radius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

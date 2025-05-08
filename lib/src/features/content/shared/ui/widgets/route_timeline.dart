// lib/src/features/content/shared/ui/widgets/route_timeline.dart

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';

class RouteTimeline extends StatelessWidget {
  final int itemCount;
  final Widget Function(
    BuildContext context, {
    required int index,
    required String itemCount,
    required bool isFirst,
    required bool isLast,
  }) itemBuilder;
  final Widget Function(Widget child) itemWrapper;

  const RouteTimeline({
    required this.itemCount,
    required this.itemBuilder,
    required this.itemWrapper,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ...List.generate(
            itemCount,
            (index) => _TimelineItem(
              isFirst: index == 0,
              isLast: index == itemCount - 1,
              index: index,
              itemCount: '${index + 1}/$itemCount',
              itemBuilder: itemBuilder,
              itemWrapper: itemWrapper,
            ),
          ),
        ],
      );
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.isFirst,
    required this.isLast,
    required this.index,
    required this.itemCount,
    required this.itemBuilder,
    required this.itemWrapper,
  });

  final bool isFirst;
  final bool isLast;
  final int index;
  final String itemCount;
  final Widget Function(
    BuildContext context, {
    required int index,
    required String itemCount,
    required bool isFirst,
    required bool isLast,
  }) itemBuilder;
  final Widget Function(Widget child) itemWrapper;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: CustomPaint(
              painter: _RouteLinePainter(
                isFirst: isFirst,
                isLast: isLast,
                color: context.colors.mainIconColor,
              ),
            ),
          ),
          itemWrapper(
            Padding(
              padding: const EdgeInsets.only(
                left: 52,
                right: 6,
                bottom: 30,
              ),
              child: itemBuilder(
                context,
                index: index,
                itemCount: itemCount,
                isFirst: isFirst,
                isLast: isLast,
              ),
            ),
          ),
        ],
      );
}

class _RouteLinePainter extends CustomPainter {
  const _RouteLinePainter({
    required this.isFirst,
    required this.isLast,
    required this.color,
  });

  final bool isFirst;
  final bool isLast;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const topOffset = 4;
    const radius = 8.0;

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 3;

    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    const circleY = radius + topOffset;
    final lineTop = circleY - radius;

    if (!isFirst) {
      canvas.drawLine(
        Offset(centerX, 0),
        Offset(centerX, lineTop),
        linePaint,
      );
    }

    if (!isLast) {
      canvas.drawLine(
        Offset(centerX, circleY + radius),
        Offset(centerX, size.height),
        linePaint,
      );
    }

    canvas.drawCircle(Offset(centerX, circleY), radius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

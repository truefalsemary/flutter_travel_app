import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pb.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';

class RouteParameters extends StatelessWidget {
  const RouteParameters(
      {required this.difficultyLevel, required this.distanceKm, super.key});

  final DifficultyLevel? difficultyLevel;
  final double? distanceKm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.house,
          size: 18,
          color: context.colors.mainIconColor,
        ),
        const SizedBox(width: 10),
        AppText(
          '${distanceKm?.toStringAsFixed(1) ?? 0} ${context.strings.km}',
          color: context.colors.cardText,
          style: AppFonts.subtitle,
        ),
        const SizedBox(width: 10),
        AppText(
          _getDifficultyText(context, difficultyLevel),
          color: context.colors.minorText,
          style: AppFonts.subtitle,
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
        _ => context.strings.unknownDifficulty,
      };
}

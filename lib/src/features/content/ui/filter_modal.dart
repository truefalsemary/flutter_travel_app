import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_range_slider_container.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pbenum.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';

typedef OnFilterRoutes = Function({
  double? minDistance,
  double? maxDistance,
  DifficultyLevel? minDifficulty,
  DifficultyLevel? maxDifficulty,
});

class FilterModal extends StatefulWidget {
  // TODO(truefalsemary): Лен, тут надо запросик к беку делать после фильтрацию
  final OnFilterRoutes onFilterRoutes;

  const FilterModal({
    required this.onFilterRoutes,
    super.key,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  // TODO(truefalsemary): Лен, тут надо сделать нормальные значения,
  // пока захардкожены
  double _minDistance = 0;
  double _maxDistance = 50;
  int _minDifficultyIndex = 0;
  int _maxDifficultyIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.mainBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                context.strings.filtersTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              AppText(
                context.strings.distanceKm,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  AppRangeSliderContainer(
                    valuePrefix: context.strings.from,
                    value: _minDistance.toStringAsFixed(1),
                  ),
                  const SizedBox(width: 8),
                  AppRangeSliderContainer(
                    valuePrefix: context.strings.to,
                    value: _maxDistance.toStringAsFixed(1),
                  ),
                ],
              ),
              RangeSlider(
                values: RangeValues(_minDistance, _maxDistance),
                max: 100,
                divisions: 100,
                onChanged: (values) => setState(
                  () {
                    _minDistance = values.start;
                    _maxDistance = values.end;
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  AppText(
                    context.strings.difficulty,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 8),
                  AppText(
                    _getDifficultyRangeText(context),
                    style: AppFonts.boldText,
                  ),
                ],
              ),
              RangeSlider(
                values: RangeValues(_minDifficultyIndex.toDouble(),
                    _maxDifficultyIndex.toDouble()),
                max: 2,
                divisions: 2,
                onChanged: (values) => setState(
                  () {
                    _minDifficultyIndex = values.start.round();
                    _maxDifficultyIndex = values.end.round();
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: AppElevatedButton.minor(
                      onPressed: () => setState(
                        () {
                          _minDistance = 0;
                          _maxDistance = 50;
                          _minDifficultyIndex = 0;
                          _maxDifficultyIndex = 2;
                        },
                      ),
                      text: context.strings.clear,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppElevatedButton.main(
                      onPressed: () {
                        widget.onFilterRoutes(
                          minDistance: _minDistance,
                          maxDistance: _maxDistance,
                          minDifficulty: _indexToDifficulty(
                            _minDifficultyIndex,
                          ),
                          maxDifficulty: _indexToDifficulty(
                            _maxDifficultyIndex,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      text: context.strings.apply,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DifficultyLevel _indexToDifficulty(int index) => switch (index) {
        0 => DifficultyLevel.EASY,
        1 => DifficultyLevel.MEDIUM,
        2 => DifficultyLevel.HARD,
        _ => DifficultyLevel.EASY,
      };

  String _getDifficultyRangeText(BuildContext context) {
    final minDifficulty = _getDifficultyText(
      context,
      _indexToDifficulty(_minDifficultyIndex),
    ).toLowerCase();
    final maxDifficulty = _getDifficultyText(
      context,
      _indexToDifficulty(_maxDifficultyIndex),
    ).toLowerCase();
    return '$minDifficulty - $maxDifficulty';
  }

  String _getDifficultyText(BuildContext context, DifficultyLevel difficulty) =>
      switch (difficulty) {
        DifficultyLevel.EASY => context.strings.easyDifficulty,
        DifficultyLevel.MEDIUM => context.strings.mediumDifficulty,
        DifficultyLevel.HARD => context.strings.hardDifficulty,
        _ => context.strings.unknownDifficulty,
      };
}

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_range_slider_container.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';
import 'package:flutter_travel_app/src/features/content/domain/models/route_params.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pbenum.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';

typedef FilterRoutesParams = ({
  double minDistance,
  double maxDistance,
  DifficultyLevel minDifficulty,
  DifficultyLevel maxDifficulty,
});

typedef OnFilterRoutes = Function({
  RouteParams? routeParams,
});

class FilterModal extends StatefulWidget {
  // TODO(truefalsemary): Лен, тут надо запросик к беку делать после фильтрацию
  final OnFilterRoutes onFilterRoutes;
  final FilterRoutesParams routeParams;

  const FilterModal({
    required this.onFilterRoutes,
    required this.routeParams,
    super.key,
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late FilterRoutesParams _currentParams;
  late final FilterRoutesParams _defaultParams;

  @override
  void initState() {
    super.initState();
    _currentParams = widget.routeParams;
    _defaultParams = widget.routeParams;
  }

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
              _DistanceFilter(
                currentParams: _currentParams,
                onChanged: (params) => setState(() => _currentParams = params),
              ),
              const SizedBox(height: 24),
              _DifficultyFilter(
                currentParams: _currentParams,
                onChanged: (params) => setState(() => _currentParams = params),
              ),
              const SizedBox(height: 24),
              _ActionButtons(
                currentParams: _currentParams,
                defaultParams: _defaultParams,
                onClear: () => setState(() => _currentParams = _defaultParams),
                onApply: () {
                  if (_currentParams != _defaultParams) {
                    widget.onFilterRoutes(
                      routeParams: _toRouteParams(_currentParams),
                    );
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  RouteParams _toRouteParams(FilterRoutesParams params) => RouteParams(
        minDistance: params.minDistance,
        maxDistance: params.maxDistance,
        minDifficulty: params.minDifficulty,
        maxDifficulty: params.maxDifficulty,
      );
}

class _FilterSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _FilterSection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _DistanceFilter extends StatelessWidget {
  final FilterRoutesParams currentParams;
  final void Function(FilterRoutesParams) onChanged;

  const _DistanceFilter({
    required this.currentParams,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _FilterSection(
      title: context.strings.distanceKm,
      child: Column(
        children: [
          _RangeValuesDisplay(
            minValue: currentParams.minDistance.toStringAsFixed(1),
            maxValue: currentParams.maxDistance.toStringAsFixed(1),
          ),
          RangeSlider(
            values: RangeValues(
              currentParams.minDistance,
              currentParams.maxDistance,
            ),
            max: 100,
            divisions: 100,
            onChanged: (values) => onChanged(
              (
                minDistance: values.start,
                maxDistance: values.end,
                minDifficulty: currentParams.minDifficulty,
                maxDifficulty: currentParams.maxDifficulty,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RangeValuesDisplay extends StatelessWidget {
  final String minValue;
  final String maxValue;

  const _RangeValuesDisplay({
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppRangeSliderContainer(
          valuePrefix: context.strings.from,
          value: minValue,
        ),
        const SizedBox(width: 8),
        AppRangeSliderContainer(
          valuePrefix: context.strings.to,
          value: maxValue,
        ),
      ],
    );
  }
}

class _DifficultyFilter extends StatelessWidget {
  final FilterRoutesParams currentParams;
  final void Function(FilterRoutesParams) onChanged;

  const _DifficultyFilter({
    required this.currentParams,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _FilterSection(
      title: context.strings.difficulty,
      child: Column(
        children: [
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
            values: RangeValues(
              _difficultyToIndex(currentParams.minDifficulty).toDouble(),
              _difficultyToIndex(currentParams.maxDifficulty).toDouble(),
            ),
            max: 2,
            divisions: 2,
            onChanged: (values) => onChanged(
              (
                minDistance: currentParams.minDistance,
                maxDistance: currentParams.maxDistance,
                minDifficulty: _indexToDifficulty(values.start.round()),
                maxDifficulty: _indexToDifficulty(values.end.round()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DifficultyLevel _indexToDifficulty(int index) => switch (index) {
        0 => DifficultyLevel.EASY,
        1 => DifficultyLevel.MEDIUM,
        2 => DifficultyLevel.HARD,
        _ => DifficultyLevel.EASY,
      };

  int _difficultyToIndex(DifficultyLevel difficulty) => switch (difficulty) {
        DifficultyLevel.EASY => 0,
        DifficultyLevel.MEDIUM => 1,
        DifficultyLevel.HARD => 2,
        _ => 0,
      };

  String _getDifficultyRangeText(BuildContext context) {
    final minDifficulty = _getDifficultyText(
      context,
      currentParams.minDifficulty,
    ).toLowerCase();
    final maxDifficulty = _getDifficultyText(
      context,
      currentParams.maxDifficulty,
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

class _ActionButtons extends StatelessWidget {
  final FilterRoutesParams currentParams;
  final FilterRoutesParams defaultParams;
  final VoidCallback onClear;
  final VoidCallback onApply;

  const _ActionButtons({
    required this.currentParams,
    required this.defaultParams,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppElevatedButton.minor(
            onPressed: onClear,
            child: Text(context.strings.clear),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppElevatedButton.main(
            onPressed: onApply,
            child: Text(
              context.strings.apply,
            ),
          ),
        ),
      ],
    );
  }
}

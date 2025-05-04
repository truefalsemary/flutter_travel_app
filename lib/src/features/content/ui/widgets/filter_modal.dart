part of '../content_page.dart';

typedef OnFilterRoutes = Function({
  RouteParams? routeParams,
});

class FilterModal extends StatefulWidget {
  final FilterRoutesParams routeParams;
  final OnFilterRoutes onFilterRoutes;

  const FilterModal({
    required this.routeParams,
    required this.onFilterRoutes,
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
              _FilterActionButtons(
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
  final String? value;
  final Widget child;

  const _FilterSection({
    required this.title,
    required this.child,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final value = this.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText(
              title,
              style: AppFonts.largeTitle,
            ),
            if (value != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  AppText(
                    value,
                    style: AppFonts.boldText,
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RangeValuesDisplay(
            minValue: currentParams.minDistance.toStringAsFixed(1),
            maxValue: currentParams.maxDistance.toStringAsFixed(1),
          ),
          const SizedBox(height: 12),
          RangeSlider(
            values: RangeValues(
              currentParams.minDistance,
              currentParams.maxDistance,
            ),
            max: 50,
            divisions: 50,
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
      value: _getDifficultyRangeText(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

  proto.DifficultyLevel _indexToDifficulty(int index) => switch (index) {
        0 => proto.DifficultyLevel.EASY,
        1 => proto.DifficultyLevel.MEDIUM,
        2 => proto.DifficultyLevel.HARD,
        _ => proto.DifficultyLevel.EASY,
      };

  int _difficultyToIndex(proto.DifficultyLevel difficulty) =>
      switch (difficulty) {
        proto.DifficultyLevel.EASY => 0,
        proto.DifficultyLevel.MEDIUM => 1,
        proto.DifficultyLevel.HARD => 2,
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

  String _getDifficultyText(
    BuildContext context,
    proto.DifficultyLevel difficulty,
  ) =>
      switch (difficulty) {
        proto.DifficultyLevel.EASY => context.strings.easyDifficulty,
        proto.DifficultyLevel.MEDIUM => context.strings.mediumDifficulty,
        proto.DifficultyLevel.HARD => context.strings.hardDifficulty,
        _ => context.strings.unknownDifficulty,
      };
}

class _FilterActionButtons extends StatelessWidget {
  final FilterRoutesParams currentParams;
  final FilterRoutesParams defaultParams;
  final VoidCallback onClear;
  final VoidCallback onApply;

  const _FilterActionButtons({
    required this.currentParams,
    required this.defaultParams,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppElevatedButton.minor(
            onPressed: onClear,
            child: AppText(
              context.strings.clear,
              color: context.colors.minorElevatedButtonText,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppElevatedButton.main(
            onPressed: onApply,
            child: AppText(
              context.strings.apply,
              color: context.colors.mainElevatedButtonText,
            ),
          ),
        ),
      ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
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

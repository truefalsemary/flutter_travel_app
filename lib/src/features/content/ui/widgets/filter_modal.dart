part of '../content_page.dart';

typedef FilterModalRoutesParams = ({
  double minDistance,
  double maxDistance,
  proto.DifficultyLevel minDifficulty,
  proto.DifficultyLevel maxDifficulty,
});

typedef OnDistanceFilterChanged = void Function(
  ({
    double minDistance,
    double maxDistance,
  }),
);
typedef OnDifficultyFilterChanged = void Function(
  ({
    proto.DifficultyLevel minDifficulty,
    proto.DifficultyLevel maxDifficulty,
  }),
);

class _FilterModal extends StatelessWidget {
  final FilterRoutesLoadSuccess filterRoutesState;
  final FilterRoutesBloc filterRoutesBloc;

  const _FilterModal({
    required this.filterRoutesState,
    required this.filterRoutesBloc,
  });

  @override
  Widget build(BuildContext context) => _FilterModelContent(
        filterRoutesState: filterRoutesState,
        filterRoutesBloc: filterRoutesBloc,
        userFilterRoutesParams: filterRoutesState.userFilterRoutesParams,
      );
}

class _FilterModelContent extends StatefulWidget {
  final FilterRoutesLoadSuccess filterRoutesState;
  final FilterRoutesBloc filterRoutesBloc;
  final UserFilterRoutesParams? userFilterRoutesParams;

  const _FilterModelContent({
    required this.filterRoutesState,
    required this.filterRoutesBloc,
    required this.userFilterRoutesParams,
  });

  @override
  State<_FilterModelContent> createState() => __FilterModelContentState();
}

class __FilterModelContentState extends State<_FilterModelContent> {
  late UserFilterRoutesParams _userFilterRoutesParams;

  @override
  void initState() {
    super.initState();
    _userFilterRoutesParams =
        widget.userFilterRoutesParams ?? UserFilterRoutesParams();
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
                availableMaxDistance: widget
                    .filterRoutesState.availableFilterRoutesParams.maxDistance,
                availableMinDistance: widget
                    .filterRoutesState.availableFilterRoutesParams.minDistance,
                userMaxDistance: _userFilterRoutesParams.maxDistance,
                userMinDistance: _userFilterRoutesParams.minDistance,
                onChanged: (params) => setState(() {
                  _userFilterRoutesParams = _userFilterRoutesParams.copyWith(
                    minDistance: params.minDistance,
                    maxDistance: params.maxDistance,
                  );
                }),
              ),
              const SizedBox(height: 24),
              _DifficultyFilter(
                availableMinDifficulty: widget.filterRoutesState
                    .availableFilterRoutesParams.minDifficulty,
                availableMaxDifficulty: widget.filterRoutesState
                    .availableFilterRoutesParams.maxDifficulty,
                userMinDifficulty: _userFilterRoutesParams.minDifficulty,
                userMaxDifficulty: _userFilterRoutesParams.maxDifficulty,
                onChanged: (params) => setState(
                  () {
                    _userFilterRoutesParams = _userFilterRoutesParams.copyWith(
                      minDifficulty: params.minDifficulty,
                      maxDifficulty: params.maxDifficulty,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              _FilterActionButtons(
                onClear: () => setState(
                  () => _userFilterRoutesParams = UserFilterRoutesParams(),
                ),
                onApply: () {
                  widget.filterRoutesBloc.add(
                    UserFilterRoutesChanged(
                      userFilterRoutesParams: _userFilterRoutesParams,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
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
              colors: context.colors,
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
                    colors: context.colors,
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
  final double availableMinDistance;
  final double availableMaxDistance;
  final double? userMinDistance;
  final double? userMaxDistance;
  final OnDistanceFilterChanged onChanged;

  const _DistanceFilter({
    required this.availableMinDistance,
    required this.availableMaxDistance,
    required this.onChanged,
    this.userMinDistance,
    this.userMaxDistance,
  });

  @override
  Widget build(BuildContext context) {
    final minDistance = userMinDistance ?? availableMinDistance;
    final maxDistance = userMaxDistance ?? availableMaxDistance;

    return _FilterSection(
      title: context.strings.distanceKm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RangeValuesDisplay(
            minValue: minDistance.toStringAsFixed(1),
            maxValue: maxDistance.toStringAsFixed(1),
          ),
          const SizedBox(height: 12),
          RangeSlider(
            values: RangeValues(
              minDistance,
              maxDistance,
            ),
            max: availableMaxDistance,
            divisions: (availableMaxDistance - availableMinDistance).toInt(),
            onChanged: (values) => onChanged(
              (
                minDistance: values.start,
                maxDistance: values.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DifficultyFilter extends StatelessWidget {
  final proto.DifficultyLevel availableMinDifficulty;
  final proto.DifficultyLevel availableMaxDifficulty;
  final proto.DifficultyLevel? userMinDifficulty;
  final proto.DifficultyLevel? userMaxDifficulty;

  final OnDifficultyFilterChanged onChanged;

  const _DifficultyFilter({
    required this.availableMinDifficulty,
    required this.availableMaxDifficulty,
    required this.onChanged,
    this.userMinDifficulty,
    this.userMaxDifficulty,
  });

  @override
  Widget build(BuildContext context) {
    final minDifficulty = userMinDifficulty ?? availableMinDifficulty;
    final maxDifficulty = userMaxDifficulty ?? availableMaxDifficulty;

    return _FilterSection(
      title: context.strings.difficulty,
      value: _getDifficultyRangeText(
        context,
        minDifficulty: minDifficulty,
        maxDifficulty: maxDifficulty,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RangeSlider(
            values: RangeValues(
              _difficultyToIndex(minDifficulty).toDouble(),
              _difficultyToIndex(maxDifficulty).toDouble(),
            ),
            max: 2,
            divisions: 2,
            onChanged: (values) => onChanged(
              (
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

  String _getDifficultyRangeText(
    BuildContext context, {
    required proto.DifficultyLevel minDifficulty,
    required proto.DifficultyLevel maxDifficulty,
  }) {
    final minDifficultyText = _getDifficultyText(
      context,
      minDifficulty,
    ).toLowerCase();
    final maxDifficultyText = _getDifficultyText(
      context,
      maxDifficulty,
    ).toLowerCase();
    return '$minDifficultyText - $maxDifficultyText';
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
  final VoidCallback onClear;
  final VoidCallback onApply;

  const _FilterActionButtons({
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
              colors: context.colors,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AppElevatedButton.main(
            onPressed: onApply,
            child: AppText(
              context.strings.apply,
              colors: context.colors,
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

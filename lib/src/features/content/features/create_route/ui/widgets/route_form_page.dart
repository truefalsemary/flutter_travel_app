part of '../create_route_page.dart';

class _RouteFormPage extends StatelessWidget {
  final OnNextPagePressed onNextPagePressed;

  const _RouteFormPage({
    required this.onNextPagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRouteFormBloc, CreateRouteFormState>(
      builder: (context, state) {
        final routeFormBloc = context.read<CreateRouteFormBloc>();

        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: context.colors.mainBg,
            backgroundColor: context.colors.mainBg,
            title: const Text('Создание маршрута'),
          ),
          backgroundColor: context.colors.mainBg,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      hintText: 'Название маршрута',
                      onChanged: (value) =>
                          context.read<CreateRouteFormBloc>().add(
                            CreateRouteFormUpdateName(value),
                          ),
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      hintText: 'Описание маршрута',
                      maxLines: 3,
                      onChanged: (value) => routeFormBloc.add(
                        CreateRouteFormUpdateDescription(value),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Длина маршрута (км)'),
                    const SizedBox(height: 8),
                    BlocBuilder<CreateRouteFormBloc, CreateRouteFormState>(
                      builder: (context, state) {
                        return _DistanceSlider(
                          selectedDistance: state.distanceKm ?? 0,
                          onDistanceChanged: (distance) {
                            routeFormBloc.add(
                              CreateRouteFormUpdateDistanceKm(distance),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text('Категория маршрута'),
                    const SizedBox(height: 8),
                    _ThemeSelector(
                      selectedTheme: state.theme,
                      onThemeSelected: (theme) => routeFormBloc.add(
                        CreateRouteFormUpdateTheme(theme),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Тип транспорта'),
                    const SizedBox(height: 8),
                    _TransportTypeSelector(
                      selectedType: state.transportType,
                      onTypeSelected: (type) => routeFormBloc.add(
                        CreateRouteFormUpdateTransportType(type),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Сложность маршрута'),
                    const SizedBox(height: 8),
                    _DifficultySlider(
                      selectedDifficulty: state.difficulty,
                      onDifficultyChanged: (difficulty) => routeFormBloc.add(
                        CreateRouteFormUpdateDifficulty(difficulty),
                      ),
                    ),
                    const SizedBox(height: 80), // Добавляем отступ для кнопки
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: AppElevatedButton.main(
              onPressed: state is CreateRouteFormFilled
                  ? onNextPagePressed
                  : null,
              child: const Text('Далее'),
            ),
          ),
        );
      },
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  final proto.RouteTheme? selectedTheme;
  final ValueChanged<proto.RouteTheme> onThemeSelected;

  const _ThemeSelector({
    required this.selectedTheme,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: proto.RouteTheme.values.map((theme) {
        return GestureDetector(
          onTap: () => onThemeSelected(theme),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                _getThemeIcon(theme),
                colorFilter: selectedTheme == theme
                    ? ColorFilter.mode(
                        context.colors.mainIconColor, BlendMode.srcIn)
                    : null,
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 70, // фиксированная ширина
                child: Text(
                  _getThemeText(theme),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _getThemeIcon(proto.RouteTheme theme) {
    switch (theme) {
      case proto.RouteTheme.URBAN:
        return AppVectors.urban;
      case proto.RouteTheme.OUTDOOR:
        return AppVectors.outdoor;
      case proto.RouteTheme.ADVENTURE:
        return AppVectors.adventure;
      case proto.RouteTheme.PHOTOGRAPHY:
        return AppVectors.photography;
      case proto.RouteTheme.ROAD_TRIP:
        return AppVectors.roadTrip;
      default:
        return AppVectors.urban;
    }
  }

  String _getThemeText(proto.RouteTheme theme) {
    switch (theme) {
      case proto.RouteTheme.URBAN:
        return 'Город';
      case proto.RouteTheme.OUTDOOR:
        return 'Активный отдых';
      case proto.RouteTheme.ADVENTURE:
        return 'Природа';
      case proto.RouteTheme.PHOTOGRAPHY:
        return 'Фото туризм';
      case proto.RouteTheme.ROAD_TRIP:
        return 'Поездка';
      default:
        return '-';
    }
  }
}

class _TransportTypeSelector extends StatelessWidget {
  final proto.RouteTransportType? selectedType;
  final ValueChanged<proto.RouteTransportType> onTypeSelected;

  const _TransportTypeSelector({
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: proto.RouteTransportType.values.map((type) {
        return GestureDetector(
          onTap: () => onTypeSelected(type),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                _getTransportIcon(type),
                colorFilter: selectedType == type
                    ? ColorFilter.mode(
                        context.colors.mainIconColor, BlendMode.srcIn)
                    : null,
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 70, // фиксированная ширина
                child: Text(
                  _getTypeText(type),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _getTransportIcon(proto.RouteTransportType type) {
    switch (type) {
      case proto.RouteTransportType.WALKING:
        return AppVectors.walk;
      case proto.RouteTransportType.CYCLING:
        return AppVectors.outdoor;
      case proto.RouteTransportType.DRIVING:
        return AppVectors.roadTrip;
      case proto.RouteTransportType.PUBLIC_TRANSPORT:
        return AppVectors.bus;
      default:
        return AppVectors.walk;
    }
  }

  String _getTypeText(proto.RouteTransportType type) {
    switch (type) {
      case proto.RouteTransportType.WALKING:
        return 'Пешком';
      case proto.RouteTransportType.CYCLING:
        return 'На велосипеде';
      case proto.RouteTransportType.DRIVING:
        return 'На машине';
      case proto.RouteTransportType.PUBLIC_TRANSPORT:
        return 'На автобусе';
      default:
        return '-';
    }
  }
}

class _DistanceSlider extends StatelessWidget {
  final double selectedDistance;
  final ValueChanged<double> onDistanceChanged;

  const _DistanceSlider({
    required this.selectedDistance,
    required this.onDistanceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${selectedDistance.toStringAsFixed(1)} км',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Slider(
          value: selectedDistance,
          max: 100,
          divisions: 100,
          onChanged: onDistanceChanged,
        ),
      ],
    );
  }
}

class _DifficultySlider extends StatelessWidget {
  final proto.DifficultyLevel? selectedDifficulty;
  final ValueChanged<proto.DifficultyLevel> onDifficultyChanged;

  const _DifficultySlider({
    required this.selectedDifficulty,
    required this.onDifficultyChanged,
  });

  @override
  Widget build(BuildContext context) {
    final difficulties = proto.DifficultyLevel.values;
    final currentIndex = selectedDifficulty != null
        ? difficulties.indexOf(selectedDifficulty!)
        : 0;

    return Column(
      children: [
        Text(
          selectedDifficulty?.name ?? 'EASY',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Slider(
          value: currentIndex.toDouble(),
          max: difficulties.length - 1,
          divisions: difficulties.length - 1,
          onChanged: (value) {
            onDifficultyChanged(difficulties[value.toInt()]);
          },
        ),
      ],
    );
  }
}

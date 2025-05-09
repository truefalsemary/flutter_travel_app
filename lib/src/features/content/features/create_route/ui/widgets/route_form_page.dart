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

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Название маршрута',
                  ),
                  onChanged: (value) => context.read<CreateRouteFormBloc>().add(
                        CreateRouteFormUpdateName(value),
                      ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Описание маршрута',
                  ),
                  onChanged: (value) => routeFormBloc.add(
                    CreateRouteFormUpdateDescription(value),
                  ),
                ),
                const SizedBox(height: 24),
                Text('Длина маршрута (км)'),
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
                Text('Категория маршрута'),
                const SizedBox(height: 8),
                _ThemeSelector(
                  selectedTheme: state.theme,
                  onThemeSelected: (theme) => routeFormBloc.add(
                    CreateRouteFormUpdateTheme(theme),
                  ),
                ),
                const SizedBox(height: 24),
                Text('Тип транспорта'),
                const SizedBox(height: 8),
                _TransportTypeSelector(
                  selectedType: state.transportType,
                  onTypeSelected: (type) => routeFormBloc.add(
                    CreateRouteFormUpdateTransportType(type),
                  ),
                ),
                const SizedBox(height: 24),
                Text('Сложность маршрута'),
                const SizedBox(height: 8),
                _DifficultySlider(
                  selectedDifficulty: state.difficulty,
                  onDifficultyChanged: (difficulty) => routeFormBloc.add(
                    CreateRouteFormUpdateDifficulty(difficulty),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed:
                      state is CreateRouteFormFilled ? onNextPagePressed : null,
                  child: const Text('Далее'),
                ),
              ],
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
      children: proto.RouteTheme.values.map((theme) {
        return IconButton(
          icon: Icon(
            _getThemeIcon(theme),
            color:
                selectedTheme == theme ? Theme.of(context).primaryColor : null,
          ),
          onPressed: () => onThemeSelected(theme),
        );
      }).toList(),
    );
  }

  IconData _getThemeIcon(proto.RouteTheme theme) {
    switch (theme) {
      case proto.RouteTheme.URBAN:
        return Icons.location_city;
      case proto.RouteTheme.OUTDOOR:
        return Icons.landscape;
      case proto.RouteTheme.ADVENTURE:
        return Icons.fireplace;
      case proto.RouteTheme.PHOTOGRAPHY:
        return Icons.photo;
      case proto.RouteTheme.ROAD_TRIP:
        return Icons.directions_car;
      default:
        return Icons.help;
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
      children: proto.RouteTransportType.values.map((type) {
        return IconButton(
          icon: Icon(
            _getTransportIcon(type),
            color: selectedType == type ? Theme.of(context).primaryColor : null,
          ),
          onPressed: () => onTypeSelected(type),
        );
      }).toList(),
    );
  }

  IconData _getTransportIcon(proto.RouteTransportType type) {
    switch (type) {
      case proto.RouteTransportType.WALKING:
        return Icons.directions_walk;
      case proto.RouteTransportType.CYCLING:
        return Icons.directions_bike;
      case proto.RouteTransportType.DRIVING:
        return Icons.directions_car;
      case proto.RouteTransportType.PUBLIC_TRANSPORT:
        return Icons.directions_bus;
      default:
        return Icons.help;
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

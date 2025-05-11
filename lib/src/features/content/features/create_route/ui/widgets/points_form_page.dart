part of '../create_route_page.dart';

class _PointsFormPage extends StatefulWidget {
  final VoidCallback onBackPressed;

  const _PointsFormPage({required this.onBackPressed});

  @override
  State<_PointsFormPage> createState() => _PointsFormPageState();
}

class _PointsFormPageState extends State<_PointsFormPage> {
  late final ImagePicker _imagePicker;
  late final Logger _logger = NamedLoggerFactory().getLogger(
    feature: LoggerFeature.content,
    layer: LoggerLayers.ui,
    type: LoggerTypes.notifier,
    name: 'PointsFormPage',
  );

  final _dotPadding = const EdgeInsets.only(top: 16);

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePointsFormBloc, CreatePointsFormState>(
      builder: (context, state) {
        return ChangeNotifierProvider<PointsItemHeightNotifier>(
          create: (context) => PointsItemHeightNotifier(),
          child: Scaffold(
            backgroundColor: context.colors.mainBg,
            appBar: AppBar(
              surfaceTintColor: context.colors.mainBg,
              shadowColor: context.colors.mainBg,
              backgroundColor: context.colors.mainBg,
              leading: IconButton(
                onPressed: widget.onBackPressed,
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text('Точки маршрута'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        // Vertical line
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Stack(
                            children: [
                              // Vertical line
                              Consumer<PointsItemHeightNotifier>(
                                builder: (context, notifier, _) {
                                  _logger.d(
                                      'All items height: ${notifier.allItemsHeight}');
                                  _logger.d(
                                      'Last item height: ${notifier.lastItemHeight}');
                                  _logger.d(
                                      'Line height: ${notifier.allItemsHeight - notifier.lastItemHeight}');

                                  return Positioned(
                                    left: 4,
                                    top: _dotPadding.top,
                                    height: notifier.allItemsHeight -
                                        notifier.lastItemHeight,
                                    child: Container(
                                      width: 3,
                                      height: notifier.allItemsHeight -
                                          notifier.lastItemHeight,
                                      color: context.colors.mainElevatedButtonBg
                                          .withOpacity(0.8),
                                    ),
                                  );
                                },
                              ),
                              // ListView
                              ReorderableListView.builder(
                                itemCount: state.points.length,
                                onReorder: (oldIndex, newIndex) {
                                  context.read<CreatePointsFormBloc>().add(
                                        PlaceFormReorderPoints(
                                          oldPointIndex: oldIndex,
                                          newPointIndex: newIndex,
                                        ),
                                      );
                                },
                                itemBuilder: (context, index) {
                                  final point = state.points.elementAt(index);
                                  return _PointItemWithDot(
                                    key: ValueKey(point),
                                    point: point,
                                    onTap: () => _navigateToEditPoint(
                                        context, point, index),
                                    onDelete: () {
                                      final notifier =
                                          Provider.of<PointsItemHeightNotifier>(
                                        context,
                                        listen: false,
                                      );
                                      notifier.removeItemHeight(index);
                                      context.read<CreatePointsFormBloc>().add(
                                            PlaceFormDeletePoint(index),
                                          );
                                    },
                                    dotPadding: const EdgeInsets.only(top: 16),
                                    onLayout: (size) {
                                      final notifier =
                                          Provider.of<PointsItemHeightNotifier>(
                                        context,
                                        listen: false,
                                      );

                                      if (index == state.points.length - 1) {
                                        notifier.setLastItemHeight(size.height);
                                      }

                                      notifier.addItemHeight(
                                        index,
                                        size.height,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.points.isEmpty)
                    const Center(
                      child: Text('Пока нет добавленных точек'),
                    ),
                  const SizedBox(height: 24),
                  FloatingActionButton.extended(
                    onPressed: () => _showAddPointDialog(context),
                    backgroundColor: context.colors.mainElevatedButtonBg,
                    foregroundColor: context.colors.mainElevatedButtonText,
                    label: const Text('Добавить точку'),
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(height: 24),
                  ScopeBuilder<CreateRouteScopeContainer>(
                    builder: (_, scope) {
                      final interactor = scope?.createRouteInteractor;

                      return FractionallySizedBox(
                        widthFactor: 1,
                        child: AppElevatedButton.main(
                          onPressed:
                              state.points.isNotEmpty && interactor != null
                                  ? interactor.createRoute
                                  : null,
                          child: const Text('Отправить маршрут'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: AppElevatedButton.minor(
                      onPressed: () {
                        // Reset both forms and navigate to first page
                        context
                            .read<CreateRouteFormBloc>()
                            .add(CreateRouteFormReset());
                        context
                            .read<CreatePointsFormBloc>()
                            .add(PlaceFormReset());
                        if (context.mounted) {
                          final pageController = context
                              .findAncestorStateOfType<
                                  _CreateRoutePageViewState>()
                              ?._pageViewController;
                          pageController?.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: const Text('Сбросить маршрут'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _navigateToEditPoint(
    BuildContext context,
    CreatePointFormModel point,
    int index,
  ) async {
    final result = await Navigator.of(context).push<CreatePointEditedFormState>(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CreatePointFormBloc(
            imagePicker: _imagePicker,
            type: point is CreatePlacePointFormModel
                ? CreatePointFormType.place
                : CreatePointFormType.path,
          ),
          child: const AddPointPage(),
        ),
      ),
    );

    if (result != null && context.mounted) {
      final filledForm = result.filledForm;
      if (filledForm != null) {
        context.read<CreatePointsFormBloc>().add(
              PlaceFormUpdatePoint(
                pointIndex: index,
                point: filledForm,
              ),
            );
      }
    }
  }

  Future<void> _showAddPointDialog(BuildContext context) async {
    final result = await showDialog<CreatePointFormType>(
      context: context,
      builder: (context) => const _AddPointTypeDialog(),
    );

    if (result != null && context.mounted) {
      final pointResult =
          await Navigator.of(context).push<CreatePointEditedFormState>(
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CreatePointFormBloc(
              type: result,
              imagePicker: _imagePicker,
            ),
            child: const AddPointPage(),
          ),
        ),
      );
      final filledForm = pointResult?.filledForm;

      if (filledForm != null && context.mounted) {
        context.read<CreatePointsFormBloc>().add(
              PlaceFormAddPoint(filledForm),
            );
      }
    }
  }
}

class _PointItem extends StatelessWidget {
  final CreatePointFormModel point;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _PointItem({
    required Key key,
    required this.point,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = switch (point) {
      final CreatePlacePointFormModel placePoint => placePoint.images,
      _ => null,
    };

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            switch (point) {
              final CreatePlacePointFormModel placePoint
                  when images != null && images.isNotEmpty =>
                Column(
                  children: [
                    ImageXFileCarouselWidget(
                      images: images,
                      height: 200,
                      padding: const EdgeInsets.all(8),
                    ),
                    ListTile(
                      title: Text(placePoint.name),
                      subtitle: Text(
                        // ignore: lines_longer_than_80_chars
                        'Location: ${point.location.lat}, ${point.location.lon}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: onDelete,
                      ),
                    ),
                  ],
                ),
              _ => SizedBox.shrink(),
            },
          ],
        ),
      ),
    );
  }
}

class _PointItemWithDot extends StatelessWidget {
  final CreatePointFormModel point;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final void Function(Size size) onLayout;
  final EdgeInsets dotPadding;

  const _PointItemWithDot({
    required Key key,
    required this.point,
    required this.onTap,
    required this.onDelete,
    required this.onLayout,
    required this.dotPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: dotPadding,
              child: SizedBox(
                width: 12,
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.mainElevatedButtonBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colors.mainBg,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: LayoutNotifier(
                (offset, size) => onLayout(size),
                child: _PointItem(
                  key: ValueKey(point),
                  point: point,
                  onTap: onTap,
                  onDelete: onDelete,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

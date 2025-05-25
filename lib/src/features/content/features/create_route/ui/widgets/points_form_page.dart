part of '../create_route_page.dart';

class _PointsFormPage extends StatefulWidget {
  final VoidCallback onBackPressed;

  const _PointsFormPage({required this.onBackPressed});

  @override
  State<_PointsFormPage> createState() => _PointsFormPageState();
}

class _PointsFormPageState extends State<_PointsFormPage> {
  late final ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePointsFormBloc, CreatePointsFormState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.mainBg,
          appBar: AppBar(
            surfaceTintColor: context.colors.mainBg,
            backgroundColor: context.colors.mainBg,
            leading: IconButton(
              onPressed: widget.onBackPressed,
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text('Точки маршрута'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: state.points.isEmpty
                      ? const Center(child: Text('Пока нет добавленных точек'))
                      : ReorderableListView.builder(
                          itemCount: state.points.length,
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            context.read<CreatePointsFormBloc>().add(
                                  PlaceFormReorderPoints(
                                    oldPointIndex: oldIndex,
                                    newPointIndex: newIndex,
                                  ),
                                );
                          },
                          buildDefaultDragHandles: false,
                          proxyDecorator: (child, index, animation) {
                            return AnimatedBuilder(
                              animation: animation,
                              builder: (context, child) {
                                return Material(
                                  color: Colors.transparent,
                                  child: child,
                                );
                              },
                              child: child,
                            );
                          },
                          itemBuilder: (context, index) {
                            final point = state.points.elementAt(index);
                            return _TimelinePointItem(
                              key: ValueKey(point),
                              point: point,
                              index: index,
                              isFirst: index == 0,
                              isLast: index == state.points.length - 1,
                              itemCount: '${index + 1}/${state.points.length}',
                              onTap: () => _navigateToEditPoint(
                                context,
                                point,
                                index,
                              ),
                              onDelete: () =>
                                  context.read<CreatePointsFormBloc>().add(
                                        PlaceFormDeletePoint(
                                          index,
                                        ),
                                      ),
                            );
                          },
                        ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppElevatedButton.main(
                      onPressed: () => _showAddPointDialog(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Добавить точку'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: AppElevatedButton.minor(
                            onPressed: () {
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
                            child: const Text('Сбросить'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ScopeBuilder<CreateRouteScopeContainer>(
                            builder: (_, scope) {
                              final interactor = scope?.createRouteInteractor;
                              return AppElevatedButton.main(
                                onPressed: state.points.isNotEmpty &&
                                        interactor != null
                                    ? interactor.createRoute
                                    : null,
                                child: const Text('Отправить'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
            pointFormModel: point.toEditedFormState(),
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

class _TimelinePointItem extends StatelessWidget {
  final CreatePointFormModel point;
  final int index;
  final bool isFirst;
  final bool isLast;
  final String itemCount;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _TimelinePointItem({
    required Key key,
    required this.point,
    required this.index,
    required this.isFirst,
    required this.isLast,
    required this.itemCount,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = switch (point) {
      final CreatePlacePointFormModel placePoint => placePoint.images,
      _ => null,
    };

    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
              Padding(
                padding: const EdgeInsets.only(left: 52, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Заголовок с номером точки
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          point is CreatePlacePointFormModel
                              ? point.address
                              : 'Точка пути ${index + 1}',
                          style: AppFonts.largeTitle.copyWith(
                            color: context.colors.mainText,
                          ),
                        ),
                        Text(
                          itemCount,
                          style: AppFonts.largeTitle.copyWith(
                            color: context.colors.minorText,
                          ),
                        ),
                      ],
                    ),

                    // Галерея изображений (если есть)
                    if (images != null && images.isNotEmpty)
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ImageXFileCarouselWidget(
                            images: images,
                            height: 130,
                            padding: const EdgeInsets.only(right: 6),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Координаты: ${point.location.lat.
                          toStringAsFixed(4)}, '
                          '${point.location.lon.toStringAsFixed(4)}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: context.colors.minorText,
                                  ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete_outline),
                              onPressed: onDelete,
                            ),
                            ReorderableDragStartListener(
                              index: index,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  Icons.drag_handle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
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

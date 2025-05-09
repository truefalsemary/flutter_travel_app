part of '../create_route_page.dart';

class _PointsFormPage extends StatefulWidget {
  const _PointsFormPage();

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
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Точки маршрута',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                if (state.points.isEmpty)
                  const Center(
                    child: Text('Пока нет добавленных точек'),
                  )
                else
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                          child: RouteTimeline(
                            itemCount: state.points.length,
                            itemBuilder: (
                              context, {
                              required index,
                              required itemCount,
                              required isFirst,
                              required isLast,
                            }) {
                              return const SizedBox.shrink();
                            },
                            itemWrapper: (child) => child,
                          ),
                        ),
                        Expanded(
                          child: ReorderableListView.builder(
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
                              return _PointItem(
                                key: ValueKey(point),
                                point: point,
                                onTap: () =>
                                    _navigateToEditPoint(context, point, index),
                                onDelete: () {
                                  context.read<CreatePointsFormBloc>().add(
                                        PlaceFormDeletePoint(index),
                                      );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                FloatingActionButton.extended(
                  onPressed: () => _showAddPointDialog(context),
                  label: const Text('Добавить точку'),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(height: 24),
                ScopeBuilder<CreateRouteScopeContainer>(
                  builder: (_, scope) {
                    final interactor = scope?.createRouteInteractor;

                    return AppElevatedButton.main(
                      onPressed: state.points.isNotEmpty && interactor != null
                          ? interactor.createRoute
                          : null,
                      child: const Text('Отправить маршрут'),
                    );
                  },
                ),
                const SizedBox(height: 16),
                AppElevatedButton.minor(
                  onPressed: () {
                    // Reset both forms and navigate to first page
                    context
                        .read<CreateRouteFormBloc>()
                        .add(CreateRouteFormReset());
                    context.read<CreatePointsFormBloc>().add(PlaceFormReset());
                    if (context.mounted) {
                      final pageController = context
                          .findAncestorStateOfType<_CreateRoutePageViewState>()
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
                const SizedBox(height: 24),
              ],
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

class _AddPointTypeDialog extends StatelessWidget {
  const _AddPointTypeDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выберите тип точки'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Место'),
            onTap: () => Navigator.of(context).pop(CreatePointFormType.place),
          ),
          ListTile(
            leading: const Icon(Icons.route),
            title: const Text('Точка маршрута'),
            onTap: () => Navigator.of(context).pop(CreatePointFormType.path),
          ),
        ],
      ),
    );
  }
}

class AddPointPage extends StatelessWidget {
  const AddPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить точку'),
      ),
      body: BlocBuilder<CreatePointFormBloc, CreatePointEditedFormState>(
        builder: (context, state) {
          final createPointFormBloc = context.read<CreatePointFormBloc>();
          final images = switch (state) {
            final CreatePlacePointModelState placePoint => placePoint.images,
            _ => null,
          };
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is CreatePlacePointModelState) ...[
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Название места',
                      ),
                      onChanged: (value) => createPointFormBloc.add(
                        CreatePointFormUpdateName(
                          name: value,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Описание места',
                      ),
                      maxLines: 3,
                      onChanged: (value) => createPointFormBloc.add(
                        CreatePointFormUpdateDescription(
                          description: value,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (images != null && images.isNotEmpty)
                      ImageXFileCarouselWidget(
                        images: images,
                        height: 200,
                        padding: const EdgeInsets.all(8),
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => createPointFormBloc.add(
                        CreatePointFormAddImage(),
                      ),
                      icon: const Icon(Icons.add_photo_alternate),
                      label: const Text('Добавить фотографии'),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Адрес',
                    ),
                    onChanged: (value) =>
                        context.read<CreatePointFormBloc>().add(
                              CreatePointFormUpdateAddress(
                                address: value,
                              ),
                            ),
                  ),
                  const SizedBox(height: 16),
                  // TODO(truefalsemary): Add map location picker
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: state is CreatePlacePointFilledFormModel ||
                                  state is CreatePathPointFilledFormModel
                              ? () {
                                  Navigator.of(context).pop(state);
                                }
                              : null,
                          child: const Text('Сохранить'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Отмена'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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

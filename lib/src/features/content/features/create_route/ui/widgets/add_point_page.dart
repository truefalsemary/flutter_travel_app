part of '../create_route_page.dart';

class _AddPointTypeDialog extends StatelessWidget {
  const _AddPointTypeDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выберите тип точки'),
      backgroundColor: context.colors.mainBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
  const AddPointPage({
    super.key,
  });

  String _coordinates(double? lat, double? lon) {
    if (lat == null || lon == null) {
      return 'Координаты не выбраны';
    }
    return 'Координаты: ${lat.toStringAsFixed(4)}, ${lon.toStringAsFixed(4)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.mainBg,
      appBar: AppBar(
        backgroundColor: context.colors.mainBg,
        surfaceTintColor: context.colors.mainBg,
        shadowColor: context.colors.mainBg,
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
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (state is CreatePlacePointModelState) ...[
                            AppTextField(
                              initialValue: state.name,
                              hintText: 'Название места',
                              onChanged: (value) => createPointFormBloc.add(
                                CreatePointFormUpdateName(name: value),
                              ),
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              hintText: 'Описание места',
                              maxLines: 3,
                              onChanged: (value) => createPointFormBloc.add(
                                CreatePointFormUpdateDescription(
                                    description: value),
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
                            AppElevatedButton.main(
                              onPressed: () => createPointFormBloc.add(
                                CreatePointFormAddImage(),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate,
                                    color:
                                        context.colors.mainElevatedButtonText,
                                    size: 32,
                                  ),
                                  const SizedBox(width: 8),
                                  AppText('Добавить фотографии',
                                      colors: context.colors,
                                      color: context
                                          .colors.mainElevatedButtonText),
                                ],
                              ),
                            ),
                          ],
                          const SizedBox(height: 16),
                          AppTextField(
                            hintText: 'Адрес',
                            onChanged: (value) => createPointFormBloc.add(
                              CreatePointFormUpdateAddress(address: value),
                            ),
                          ),
                          switch (state) {
                            final CreatePlacePointModelState placePoint => Text(
                                _coordinates(placePoint.location?.lat,
                                    placePoint.location?.lon)),
                            final CreatePathPointModelState pathPoint => Text(
                                _coordinates(pathPoint.location?.lat,
                                    pathPoint.location?.lon)),
                          },
                          const SizedBox(height: 16),
                          AppElevatedButton.main(
                            onPressed: () async {
                              await Navigator.of(context).push<PointModel>(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PlaceLocationSelectionMapPage(
                                    onUpdatePoint: (point) {
                                      createPointFormBloc.add(
                                        CreatePointFormUpdateLocation(
                                          location: PointModel(
                                            lat: point.latitude,
                                            lon: point.longitude,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: context.colors.mainElevatedButtonText,
                                  size: 32,
                                ),
                                const SizedBox(width: 8),
                                AppText('Добавить местоположение',
                                    colors: context.colors,
                                    color:
                                        context.colors.mainElevatedButtonText),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: AppElevatedButton.main(
                          onPressed: state is CreatePlacePointFilledFormModel ||
                                  state is CreatePathPointFilledFormModel
                              ? () {
                                  Navigator.of(context).pop(state);
                                }
                              : null,
                          child: AppText('Сохранить',
                              colors: context.colors,
                              color: context.colors.mainElevatedButtonText),
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

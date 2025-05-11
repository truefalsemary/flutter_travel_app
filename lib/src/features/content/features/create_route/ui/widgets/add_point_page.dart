part of '../create_route_page.dart';

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
                    AppElevatedButton.minor(
                      onPressed: () => createPointFormBloc.add(
                        CreatePointFormAddImage(),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_photo_alternate,
                            color: context.colors.minorElevatedButtonText,
                            size: 32,
                          ),
                          const SizedBox(width: 8),
                          AppText(
                            'Добавить фотографии',
                            colors: context.colors,
                          ),
                        ],
                      ),
                    ),
                    // ),
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
                          child: AppText(
                            'Сохранить',
                            colors: context.colors,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: AppElevatedButton.minor(
                          onPressed: () => Navigator.of(context).pop(),
                          child: AppText(
                            'Отмена',
                            colors: context.colors,
                          ),
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

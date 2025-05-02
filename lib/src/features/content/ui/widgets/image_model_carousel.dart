part of '../content_page.dart';

class _ImageModelsCarouselWidget extends StatelessWidget {
  final ImageModels imageModels;
  final double height;

  const _ImageModelsCarouselWidget({
    required this.imageModels,
    required this.height,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: PageView.builder(
          itemCount: imageModels.length,
          itemBuilder: (context, index) {
            final image = imageModels.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CachedNetworkImage(
                imageUrl: image.url,
                imageBuilder: (context, imageProvider) => DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                placeholder: (_, __) => DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: BlurhashFfiImage(image.placeholder),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}

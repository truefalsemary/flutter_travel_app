import 'package:blurhash_ffi/blurhashffi_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/features/content/shared/domain/models/image_model.dart';

class ImageModelsCarouselWidget extends StatelessWidget {
  final ImageModels imageModels;
  final double height;
  final double padding;

  const ImageModelsCarouselWidget({
    required this.imageModels,
    required this.height,
    this.padding = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: PageView.builder(
          itemCount: imageModels.length,
          itemBuilder: (context, index) {
            final image = imageModels.elementAt(index);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
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

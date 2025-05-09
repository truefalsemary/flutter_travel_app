import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageXFileCarouselWidget extends StatelessWidget {
  final Iterable<XFile> images;
  final double height;
  final EdgeInsets padding;

  const ImageXFileCarouselWidget({
    required this.images,
    required this.height,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final file = images.elementAt(index);
            return Padding(
              padding: padding,
              child: FutureBuilder<String>(
                future: file.readAsBytes().then((bytes) => file.path),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(File(snapshot.data!)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          },
        ),
      );
}

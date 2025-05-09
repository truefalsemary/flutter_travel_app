import 'package:equatable/equatable.dart';

typedef ImageModels = Iterable<ImageModel>;

final class ImageModel with EquatableMixin {
  final String url;
  final String placeholder;

  const ImageModel({required this.url, required this.placeholder});

  @override
  List<Object?> get props => [url, placeholder];
}

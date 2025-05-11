import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'point_model.g.dart';

typedef PointModels = Iterable<PointModel>;

@CopyWith()
final class PointModel with EquatableMixin {
  final double lat;
  final double lon;

  const PointModel({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}

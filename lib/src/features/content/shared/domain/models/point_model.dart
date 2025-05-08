import 'package:equatable/equatable.dart';

typedef PointModels = Iterable<PointModel>;

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

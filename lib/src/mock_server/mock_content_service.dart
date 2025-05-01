import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/generated/lib/src/features/content/data/proto/content.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class MockRoutesContentService extends ContentServiceBase {
  final List<Route> _mockRoutes = [];
  late final _logger = NamedLoggerFactory().getLogger(
    feature: LoggerFeature.content,
    layer: LoggerLayers.data,
    type: LoggerTypes.server,
    name: 'MockRoutesContentService',
  );

  bool shouldThrowError = false;
  Duration responseDelay = const Duration(milliseconds: 500);

  MockRoutesContentService() {
    _generateMockData();
  }

  void _generateMockData() {
    _mockRoutes.addAll([
      _createMockRoute(
        name: 'Горный трек',
        difficulty: DifficultyLevel.HARD,
        distance: 15.5,
        points: [
          Point(lat: 43.585472, lon: 39.723099),
          Point(lat: 43.563217, lon: 39.808642),
        ],
        places: [
          Place()
            ..name = 'Пик Горный'
            ..address = 'Горный хребет'
            ..description = 'Самая высокая точка маршрута с панорамным видом'
            ..images.addAll([
              Image()
                ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                ..url =
                    'https://images.unsplash.com/photo-1745666606096-9776c7e71bf6?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ])
            ..location = Point(lat: 43.585472, lon: 39.723099),
          Place()
            ..name = 'Лесная поляна'
            ..address = 'Средняя часть маршрута'
            ..description = 'Место для отдыха среди вековых сосен'
            ..images.addAll([
              Image()
                ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                ..url =
                    'https://images.unsplash.com/photo-1744479357124-ef43ab9d6a9f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDMwfEZ6bzN6dU9ITjZ3fHxlbnwwfHx8fHw%3D',
            ])
            ..location = Point(lat: 43.578901, lon: 39.745612),
          Place()
            ..name = 'Водопад Скрытый'
            ..address = 'Северный склон'
            ..description = 'Живописный каскадный водопад высотой 15 метров'
            ..images.addAll([
              Image()
                ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                ..url =
                    'https://plus.unsplash.com/premium_photo-1661883809211-eb59f508b3d9?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ])
            ..location = Point(lat: 43.563217, lon: 39.808642),
        ],
      ),
      _createMockRoute(
        name: 'Прогулка по центру',
        difficulty: DifficultyLevel.EASY,
        distance: 5.2,
        points: [
          Point(lat: 43.585472, lon: 39.723099),
          Point(lat: 43.579536, lon: 39.724925),
        ],
        places: [
          Place()
            ..name = 'Главная площадь'
            ..address = 'ул. Центральная, 1'
            ..description = 'Исторический центр города с фонтанами'
            ..images.addAll([
              Image()
                ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                ..url =
                    'https://images.unsplash.com/photo-1725291004626-28db152bdddb?q=80&w=2666&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ])
            ..location = Point(lat: 43.585472, lon: 39.723099),
          Place()
            ..name = 'Художественный музей'
            ..address = 'пр. Культуры, 15'
            ..description = 'Коллекция современного искусства'
            ..images.addAll([
              Image()
                ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                ..url =
                    'https://images.unsplash.com/photo-1554907984-15263bfd63bd?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ])
            ..location = Point(lat: 43.582341, lon: 39.725678),
          Place()
            ..name = "Кафе 'Старый город'"
            ..address = 'пер. Кофейный, 5'
            ..description = 'Атмосферное кафе с домашней выпечкой'
            ..images.addAll([
              Image()
                ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                ..url =
                    'https://images.unsplash.com/photo-1483695028939-5bb13f8648b0?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ])
            ..location = Point(lat: 43.579536, lon: 39.724925),
        ],
      ),
    ]);
  }

  Route _createMockRoute({
    required String name,
    required DifficultyLevel difficulty,
    required double distance,
    required List<Point> points,
    required List<Place> places,
  }) {
    return Route()
      ..name = name
      ..difficulty = difficulty
      ..distanceKm = distance
      ..pathPoints.addAll(points)
      ..places.addAll(places)
      ..userId = '00000000-0000-0000-0000-000000000000';
  }

  @override
  Future<GetRoutesResponse> getRoutes(
    ServiceCall call,
    GetRoutesRequest request,
  ) async {
    if (shouldThrowError) {
      throw GrpcError.unauthenticated('Mock authentication error');
    }

    // Имитация задержки сети
    await Future.delayed(responseDelay);

    // Фильтрация данных
    final filteredRoutes = _mockRoutes.where((route) {
      final difficultyMatch = !request.hasDifficultyFilter() ||
          route.difficulty == request.difficultyFilter;

      final distanceMatch = !request.hasDistanceFilter() ||
          _checkDistance(route.distanceKm, request.distanceFilter);

      return difficultyMatch && distanceMatch;
    }).toList();

    _logger.i('filteredRoutes: $filteredRoutes');

    return GetRoutesResponse()..routes.addAll(filteredRoutes);
  }

  bool _checkDistance(double distance, DistanceFilter filter) {
    final min = filter.hasMinKm() ? filter.minKm : 0;
    final max = filter.hasMaxKm() ? filter.maxKm : double.infinity;
    return distance >= min && distance <= max;
  }

  // Методы для управления моковым сервисом в тестах
  void addTestRoute(Route route) => _mockRoutes.add(route);
  void clearRoutes() => _mockRoutes.clear();
  void setErrorState({required bool state}) => shouldThrowError = state;
  void setResponseDelay(Duration delay) => responseDelay = delay;
}

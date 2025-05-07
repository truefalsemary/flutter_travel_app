// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_travel_app/src/common/utils/named_logger_factory.dart';
import 'package:flutter_travel_app/src/generated/lib/src/proto/content/content.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class MockRoutesContentService extends ContentServiceBase {
  final List<Route> _mockRoutes = [];
  final DistanceFilter _mockDistanceFilters = DistanceFilter()
    ..minKm = 0
    ..maxKm = 100;

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
    _mockRoutes.addAll(
      _repeatRoutes(
        routes: [
          _createMockRoute(
            name: 'Горный трек',
            difficulty: DifficultyLevel.HARD,
            distance: 15.5,
            points: [
              Point(lat: 43.585472, lon: 39.723099),
              Point(lat: 43.563217, lon: 39.808642),
            ],
            description:
                'Самый сложный маршрут в городе, с высокими горами и водопадами. Вы будуете вымотаны еще в середине пути, но зато станете сильнее и сможете потом тащить самые сложные таски. Вы можете потеряться в горах, но мы вас найдем, потому что вы арендовали наше оборудование.',
            places: [
              Place()
                ..name = 'Пик Горный'
                ..address = 'Горный хребет'
                ..description =
                    'Самая высокая точка маршрута с панорамным видом. Самая высокая точка маршрута с панорамным видом. Сюда побольше текста чтобы посмотреть как же клево отрезаются две строки и еще развернуть и свернуть можно прикол да'
                ..images.addAll([
                  Image()
                    ..placeholder = 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4'
                    ..url =
                        'https://images.unsplash.com/photo-1745666606096-9776c7e71bf6?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
            description:
                'Самый простой маршрут в городе, с красивыми фонтанами и музеями. Вы кайфанете и увидите много красивых мест. Вас обольет машина из лужи, но вы не утонете. Вас обгонит ближайший трамвай, но вы не Наташа.',
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
        ],
      ),
    );
  }

  List<Route> _repeatRoutes({required List<Route> routes, int count = 3}) {
    final repeatedRoutes = <Route>[];
    for (var i = 0; i < count; i++) {
      // ignore: prefer_foreach
      for (final route in routes) {
        repeatedRoutes.add(route);
      }
    }
    return repeatedRoutes;
  }

  Route _createMockRoute({
    required String name,
    required String description,
    required DifficultyLevel difficulty,
    required double distance,
    required List<Point> points,
    required List<Place> places,
  }) {
    return Route()
      ..name = name
      ..description = description
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
          (route.difficulty.value >=
                  request.difficultyFilter.minDifficulty.value &&
              route.difficulty.value <=
                  request.difficultyFilter.maxDifficulty.value);

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

  @override
  Future<CreatePlaceResponse> createPlace(
    ServiceCall call,
    CreatePlaceRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<CreateRouteResponse> createRoute(
    ServiceCall call,
    CreateRouteRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<UploadImageResponse> uploadImages(
    ServiceCall call,
    Stream<UploadImageRequest> request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<GetRoutesFilterOptionsResponse> getRoutesFilterOptions(
    ServiceCall call,
    // ignore: type_annotate_public_apis
    request,
  ) async {
    await Future.delayed(responseDelay);
    return GetRoutesFilterOptionsResponse()
      ..distanceBounds = _mockDistanceFilters;
  }
}

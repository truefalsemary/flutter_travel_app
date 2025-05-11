part of '../create_route_page.dart';

class PointsItemHeightNotifier extends ChangeNotifier {
  late final Logger _logger = NamedLoggerFactory().getLogger(
    feature: LoggerFeature.content,
    layer: LoggerLayers.ui,
    type: LoggerTypes.notifier,
  );
  final Map<int, double> _itemHeights = {};
  double _lastItemHeight = 0;

  double get allItemsHeight {
    final height = _itemHeights.values.fold(0.0, (sum, height) => sum + height);
    _logger.d('Calculated allItemsHeight: $height');
    return height;
  }

  double get lastItemHeight {
    _logger.d('Calculated lastItemHeight: $_lastItemHeight');
    return _lastItemHeight;
  }

  void addItemHeight(int index, double height) {
    _logger.d('Adding height for index $index: $height');
    _itemHeights[index] = height;
    notifyListeners();
  }

  void setLastItemHeight(double height) {
    _logger.d('Setting last item height: $height');
    _lastItemHeight = height;
    notifyListeners();
  }

  void removeItemHeight(int index) {
    _logger.d('Removing height for index $index');
    _itemHeights.remove(index);

    // Пересчитываем индексы для всех элементов после удаленного
    final newHeights = <int, double>{};
    _itemHeights.forEach((oldIndex, height) {
      if (oldIndex > index) {
        newHeights[oldIndex - 1] = height;
      } else {
        newHeights[oldIndex] = height;
      }
    });

    _itemHeights.clear();
    _itemHeights.addAll(newHeights);

    notifyListeners();
  }

  void clear() {
    _itemHeights.clear();
    _lastItemHeight = 0;
    notifyListeners();
  }
}

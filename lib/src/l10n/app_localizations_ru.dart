// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get routesTitle => 'Маршруты';

  @override
  String get errorMessage => 'Не удалось загрузить маршруты';

  @override
  String get retryButton => 'Повторить';

  @override
  String get placesOnRoute => 'Места на маршруте';

  @override
  String get easyDifficulty => 'Простой';

  @override
  String get mediumDifficulty => 'Средний';

  @override
  String get hardDifficulty => 'Сложный';

  @override
  String get unknownDifficulty => 'Неизвестно';

  @override
  String get filtersTitle => 'Фильтры';

  @override
  String get distanceKm => 'Расстояние, км:';

  @override
  String get from => 'от';

  @override
  String get to => 'до';

  @override
  String get difficulty => 'Сложность:';

  @override
  String get easy => 'Простой';

  @override
  String get medium => 'Средний';

  @override
  String get hard => 'Сложный';

  @override
  String get clear => 'Очистить';

  @override
  String get apply => 'Применить';

  @override
  String get doubleGisOpenButton => 'Открыть в 2Gis';

  @override
  String get yMapOpenButton => 'Открыть в Яндекс.Картах';

  @override
  String get km => 'км';

  @override
  String get more => 'Еще';

  @override
  String get less => 'Скрыть';

  @override
  String get profileTabName => 'Профиль';

  @override
  String get searchTabName => 'Поиск';

  @override
  String get createRouteTabName => 'Создать';

  @override
  String get homeTabName => 'Главная';

  @override
  String get createRouteFirstPageAppBarName => 'Создать маршрут';

  @override
  String get createRouteFirstPageTextFieldHint => 'Название маршрута';
}

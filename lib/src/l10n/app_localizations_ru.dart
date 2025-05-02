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
}

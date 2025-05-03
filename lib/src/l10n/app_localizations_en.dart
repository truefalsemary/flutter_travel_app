import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get routesTitle => 'Routes';

  @override
  String get errorMessage => 'Failed to load routes';

  @override
  String get retryButton => 'Retry';

  @override
  String get placesOnRoute => 'Places on route';

  @override
  String get easyDifficulty => 'Easy';

  @override
  String get mediumDifficulty => 'Medium';

  @override
  String get hardDifficulty => 'Hard';

  @override
  String get unknownDifficulty => 'Unknown';

  @override
  String get filtersTitle => 'Filters';

  @override
  String get distanceKm => 'Distance, km:';

  @override
  String get from => 'from';

  @override
  String get to => 'to';

  @override
  String get difficulty => 'Difficulty:';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get hard => 'Hard';

  @override
  String get clear => 'Clear';

  @override
  String get apply => 'Apply';

  @override
  String get doubleGisOpenButton => 'Open route in 2Gis';

  @override
  String get yMapOpenButton => 'Open route in Yandex Map';
}

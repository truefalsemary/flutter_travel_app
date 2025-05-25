import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @routesTitle.
  ///
  /// In en, this message translates to:
  /// **'Routes'**
  String get routesTitle;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load routes'**
  String get errorMessage;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// No description provided for @placesOnRoute.
  ///
  /// In en, this message translates to:
  /// **'Places on route'**
  String get placesOnRoute;

  /// No description provided for @easyDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easyDifficulty;

  /// No description provided for @mediumDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get mediumDifficulty;

  /// No description provided for @hardDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hardDifficulty;

  /// No description provided for @unknownDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownDifficulty;

  /// No description provided for @filtersTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersTitle;

  /// No description provided for @distanceKm.
  ///
  /// In en, this message translates to:
  /// **'Distance, km:'**
  String get distanceKm;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'from'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty:'**
  String get difficulty;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @doubleGisOpenButton.
  ///
  /// In en, this message translates to:
  /// **'Open route in 2Gis'**
  String get doubleGisOpenButton;

  /// No description provided for @yMapOpenButton.
  ///
  /// In en, this message translates to:
  /// **'Open route in Yandex Map'**
  String get yMapOpenButton;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get km;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get more;

  /// No description provided for @less.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get less;

  /// No description provided for @profileTabName.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTabName;

  /// No description provided for @searchTabName.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTabName;

  /// No description provided for @createRouteTabName.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createRouteTabName;

  /// No description provided for @homeTabName.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTabName;

  /// No description provided for @createRouteFirstPageAppBarName.
  ///
  /// In en, this message translates to:
  /// **'Create route'**
  String get createRouteFirstPageAppBarName;

  /// No description provided for @createRouteFirstPageTextFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Route name'**
  String get createRouteFirstPageTextFieldHint;

  /// No description provided for @onFoot.
  ///
  /// In en, this message translates to:
  /// **'On foot'**
  String get onFoot;

  /// No description provided for @byBicycle.
  ///
  /// In en, this message translates to:
  /// **'By bicycle'**
  String get byBicycle;

  /// No description provided for @byCar.
  ///
  /// In en, this message translates to:
  /// **'By car'**
  String get byCar;

  /// No description provided for @byBus.
  ///
  /// In en, this message translates to:
  /// **'By bus'**
  String get byBus;

  /// No description provided for @urban.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get urban;

  /// No description provided for @outdoor.
  ///
  /// In en, this message translates to:
  /// **'Outdoor activities'**
  String get outdoor;

  /// No description provided for @nature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get nature;

  /// No description provided for @photoTourism.
  ///
  /// In en, this message translates to:
  /// **'Photo tourism'**
  String get photoTourism;

  /// No description provided for @roadTrip.
  ///
  /// In en, this message translates to:
  /// **'Road trip'**
  String get roadTrip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @routeLength.
  ///
  /// In en, this message translates to:
  /// **'Route length (km)'**
  String get routeLength;

  /// No description provided for @routeDescription.
  ///
  /// In en, this message translates to:
  /// **'Route description'**
  String get routeDescription;

  /// No description provided for @routeName.
  ///
  /// In en, this message translates to:
  /// **'Route name'**
  String get routeName;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @addLocation.
  ///
  /// In en, this message translates to:
  /// **'Add location'**
  String get addLocation;

  /// No description provided for @addPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add photos'**
  String get addPhotos;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @choosePointType.
  ///
  /// In en, this message translates to:
  /// **'Choose point type'**
  String get choosePointType;

  /// No description provided for @routeCreation.
  ///
  /// In en, this message translates to:
  /// **'Route creation'**
  String get routeCreation;

  /// No description provided for @routeCategory.
  ///
  /// In en, this message translates to:
  /// **'Route category'**
  String get routeCategory;

  /// No description provided for @transportType.
  ///
  /// In en, this message translates to:
  /// **'Transport type'**
  String get transportType;

  /// No description provided for @routeDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Route difficulty'**
  String get routeDifficulty;

  /// No description provided for @place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get place;

  /// No description provided for @routePoint.
  ///
  /// In en, this message translates to:
  /// **'Route point'**
  String get routePoint;

  /// No description provided for @addPoint.
  ///
  /// In en, this message translates to:
  /// **'Add point'**
  String get addPoint;

  /// No description provided for @placeName.
  ///
  /// In en, this message translates to:
  /// **'Place name'**
  String get placeName;

  /// No description provided for @placeDescription.
  ///
  /// In en, this message translates to:
  /// **'Place description'**
  String get placeDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

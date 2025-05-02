import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/l10n/app_localizations.dart';

extension LocalizedStrings on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}

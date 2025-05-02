import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_colors.g.theme.dart';

@immutable
@themeExtensions
class AppColorsTheme extends ThemeExtension<AppColorsTheme>
    with _$ThemeExtensionMixin {
  final Color mainBg;
  final Color mainText;
  final Color minorText;
  final Color cardBg;
  final Color cardText;
  final Color separator;
  final Color mainElevatedButtonBg;
  final Color mainElevatedButtonText;
  final Color minorElevatedButtonBg;
  final Color minorElevatedButtonText;

  const AppColorsTheme({
    required this.mainBg,
    required this.mainText,
    required this.minorText,
    required this.cardBg,
    required this.cardText,
    required this.separator,
    required this.mainElevatedButtonBg,
    required this.mainElevatedButtonText,
    required this.minorElevatedButtonBg,
    required this.minorElevatedButtonText,
  });

  factory AppColorsTheme.light() => const AppColorsTheme(
        mainBg: AppColors.trueWhite,
        mainText: AppColors.trueBlack,
        minorText: AppColors.lightGrey,
        cardBg: AppColors.trueWhite,
        cardText: AppColors.trueBlack,
        separator: AppColors.veryLightGrey,
        mainElevatedButtonBg: AppColors.gold,
        mainElevatedButtonText: AppColors.trueWhite,
        minorElevatedButtonBg: AppColors.veryLightGrey,
        minorElevatedButtonText: AppColors.lightGrey,
      );

  factory AppColorsTheme.dark() => const AppColorsTheme(
        mainBg: AppColors.wetAsphaltGrey,
        mainText: AppColors.veryLightGrey,
        minorText: AppColors.silverGrey,
        cardBg: AppColors.wetAsphaltGrey,
        cardText: AppColors.veryLightGrey,
        separator: AppColors.trueGrey,
        mainElevatedButtonBg: AppColors.gold,
        mainElevatedButtonText: AppColors.veryLightGrey,
        minorElevatedButtonBg: AppColors.trueGrey,
        minorElevatedButtonText: AppColors.lightGrey,
      );
}

class AppColors {
  static const trueWhite = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFF949494);
  static const gold = Color(0xFFDFA85E);
  static const veryLightGrey = Color(0xFFE9E9E9);

  static const trueBlack = Color(0xFF000000);
  static const darkCardBg = Color(0xFF000000);
  static const trueGrey = Color(0xFF808080);
  static const wetAsphaltGrey = Color(0xFF505050);
  static const silverGrey = Color(0xFFc0c0c0);

  AppColors._();
}

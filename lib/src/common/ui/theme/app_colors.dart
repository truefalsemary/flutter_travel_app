import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_colors.g.theme.dart';

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
  final Color disabledButtonBg;
  final Color disabledButtonText;

  final Color sliderSelected;
  final Color sliderUnselected;
  final Color mainIconColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

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
    required this.disabledButtonBg,
    required this.disabledButtonText,
    required this.sliderSelected,
    required this.sliderUnselected,
    required this.mainIconColor,
    required this.selectedItemColor,
    required this.unselectedItemColor,
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
        minorElevatedButtonText: AppColors.darkerGrey,
        disabledButtonBg: AppColors.mediumGrey,
        disabledButtonText: AppColors.mediumGreyDarkGrey,
        sliderSelected: AppColors.gold,
        sliderUnselected: AppColors.veryLightGrey,
        mainIconColor: AppColors.gold,
        selectedItemColor: AppColors.darkGrey,
        unselectedItemColor: AppColors.lightGrey,
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
        // TODO(truefalsemary): нужно поправить цвета для темной темы
        disabledButtonBg: AppColors.lightGrey,
        disabledButtonText: AppColors.darkGrey,
        sliderSelected: AppColors.gold,
        sliderUnselected: AppColors.veryLightGrey,
        mainIconColor: AppColors.gold,
        selectedItemColor: AppColors.darkGrey,
        unselectedItemColor: AppColors.lightGrey,
      );
}

class AppColors {
  static const trueWhite = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFF949494);
  static const gold = Color(0xFFDFA85E);
  static const veryLightGrey = Color(0xFFE9E9E9);

  static const mediumGrey = Color(0xffcccccc);
  static const mediumGreyDarkGrey = Color(0xff666666);

  static const trueBlack = Color(0xFF000000);
  static const darkCardBg = Color(0xFF000000);
  static const darkerGrey = Color(0xFF767474);
  static const trueGrey = Color(0xFF808080);
  static const wetAsphaltGrey = Color(0xFF505050);
  static const silverGrey = Color(0xFFc0c0c0);

  static const darkGrey = Color(0xFF33492A);

  AppColors._();
}

extension AppColorsThemeBuildContextExtension on BuildContext {
  AppColorsTheme get colors => Theme.of(this).extension<AppColorsTheme>()!;
}

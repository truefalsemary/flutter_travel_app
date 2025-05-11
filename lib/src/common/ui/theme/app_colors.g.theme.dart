// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<AppColorsTheme> {
  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? mainBg,
    Color? mainText,
    Color? minorText,
    Color? cardBg,
    Color? cardText,
    Color? separator,
    Color? mainElevatedButtonBg,
    Color? mainElevatedButtonText,
    Color? minorElevatedButtonBg,
    Color? minorElevatedButtonText,
    Color? disabledButtonBg,
    Color? disabledButtonText,
    Color? sliderSelected,
    Color? sliderUnselected,
    Color? mainIconColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
  }) {
    final object = this as AppColorsTheme;

    return AppColorsTheme(
      mainBg: mainBg ?? object.mainBg,
      mainText: mainText ?? object.mainText,
      minorText: minorText ?? object.minorText,
      cardBg: cardBg ?? object.cardBg,
      cardText: cardText ?? object.cardText,
      separator: separator ?? object.separator,
      mainElevatedButtonBg: mainElevatedButtonBg ?? object.mainElevatedButtonBg,
      mainElevatedButtonText:
          mainElevatedButtonText ?? object.mainElevatedButtonText,
      minorElevatedButtonBg:
          minorElevatedButtonBg ?? object.minorElevatedButtonBg,
      minorElevatedButtonText:
          minorElevatedButtonText ?? object.minorElevatedButtonText,
      disabledButtonBg: disabledButtonBg ?? object.disabledButtonBg,
      disabledButtonText: disabledButtonText ?? object.disabledButtonText,
      sliderSelected: sliderSelected ?? object.sliderSelected,
      sliderUnselected: sliderUnselected ?? object.sliderUnselected,
      mainIconColor: mainIconColor ?? object.mainIconColor,
      selectedItemColor: selectedItemColor ?? object.selectedItemColor,
      unselectedItemColor: unselectedItemColor ?? object.unselectedItemColor,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! AppColorsTheme) {
      return this;
    }

    final value = this as AppColorsTheme;

    return AppColorsTheme(
      mainBg: Color.lerp(
        value.mainBg,
        otherValue.mainBg,
        t,
      )!,
      mainText: Color.lerp(
        value.mainText,
        otherValue.mainText,
        t,
      )!,
      minorText: Color.lerp(
        value.minorText,
        otherValue.minorText,
        t,
      )!,
      cardBg: Color.lerp(
        value.cardBg,
        otherValue.cardBg,
        t,
      )!,
      cardText: Color.lerp(
        value.cardText,
        otherValue.cardText,
        t,
      )!,
      separator: Color.lerp(
        value.separator,
        otherValue.separator,
        t,
      )!,
      mainElevatedButtonBg: Color.lerp(
        value.mainElevatedButtonBg,
        otherValue.mainElevatedButtonBg,
        t,
      )!,
      mainElevatedButtonText: Color.lerp(
        value.mainElevatedButtonText,
        otherValue.mainElevatedButtonText,
        t,
      )!,
      minorElevatedButtonBg: Color.lerp(
        value.minorElevatedButtonBg,
        otherValue.minorElevatedButtonBg,
        t,
      )!,
      minorElevatedButtonText: Color.lerp(
        value.minorElevatedButtonText,
        otherValue.minorElevatedButtonText,
        t,
      )!,
      disabledButtonBg: Color.lerp(
        value.disabledButtonBg,
        otherValue.disabledButtonBg,
        t,
      )!,
      disabledButtonText: Color.lerp(
        value.disabledButtonText,
        otherValue.disabledButtonText,
        t,
      )!,
      sliderSelected: Color.lerp(
        value.sliderSelected,
        otherValue.sliderSelected,
        t,
      )!,
      sliderUnselected: Color.lerp(
        value.sliderUnselected,
        otherValue.sliderUnselected,
        t,
      )!,
      mainIconColor: Color.lerp(
        value.mainIconColor,
        otherValue.mainIconColor,
        t,
      )!,
      selectedItemColor: Color.lerp(
        value.selectedItemColor,
        otherValue.selectedItemColor,
        t,
      )!,
      unselectedItemColor: Color.lerp(
        value.unselectedItemColor,
        otherValue.unselectedItemColor,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as AppColorsTheme;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColorsTheme &&
            identical(value.mainBg, other.mainBg) &&
            identical(value.mainText, other.mainText) &&
            identical(value.minorText, other.minorText) &&
            identical(value.cardBg, other.cardBg) &&
            identical(value.cardText, other.cardText) &&
            identical(value.separator, other.separator) &&
            identical(value.mainElevatedButtonBg, other.mainElevatedButtonBg) &&
            identical(
                value.mainElevatedButtonText, other.mainElevatedButtonText) &&
            identical(
                value.minorElevatedButtonBg, other.minorElevatedButtonBg) &&
            identical(
                value.minorElevatedButtonText, other.minorElevatedButtonText) &&
            identical(value.disabledButtonBg, other.disabledButtonBg) &&
            identical(value.disabledButtonText, other.disabledButtonText) &&
            identical(value.sliderSelected, other.sliderSelected) &&
            identical(value.sliderUnselected, other.sliderUnselected) &&
            identical(value.mainIconColor, other.mainIconColor) &&
            identical(value.selectedItemColor, other.selectedItemColor) &&
            identical(value.unselectedItemColor, other.unselectedItemColor));
  }

  @override
  int get hashCode {
    final value = this as AppColorsTheme;

    return Object.hash(
      runtimeType,
      value.mainBg,
      value.mainText,
      value.minorText,
      value.cardBg,
      value.cardText,
      value.separator,
      value.mainElevatedButtonBg,
      value.mainElevatedButtonText,
      value.minorElevatedButtonBg,
      value.minorElevatedButtonText,
      value.disabledButtonBg,
      value.disabledButtonText,
      value.sliderSelected,
      value.sliderUnselected,
      value.mainIconColor,
      value.selectedItemColor,
      value.unselectedItemColor,
    );
  }
}

extension AppColorsThemeBuildContext on BuildContext {
  AppColorsTheme get appColorsTheme =>
      Theme.of(this).extension<AppColorsTheme>()!;
}

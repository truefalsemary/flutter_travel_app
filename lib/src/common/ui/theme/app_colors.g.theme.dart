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
    Color? extraMainElevatedButtonBg,
    Color? mainElevatedButtonText,
    Color? minorElevatedButtonBg,
    Color? minorElevatedButtonText,
    Color? sliderSelected,
    Color? sliderUnselected,
    Color? mainIconColor,
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
      extraMainElevatedButtonBg:
          extraMainElevatedButtonBg ?? object.extraMainElevatedButtonBg,
      mainElevatedButtonText:
          mainElevatedButtonText ?? object.mainElevatedButtonText,
      minorElevatedButtonBg:
          minorElevatedButtonBg ?? object.minorElevatedButtonBg,
      minorElevatedButtonText:
          minorElevatedButtonText ?? object.minorElevatedButtonText,
      sliderSelected: sliderSelected ?? object.sliderSelected,
      sliderUnselected: sliderUnselected ?? object.sliderUnselected,
      mainIconColor: mainIconColor ?? object.mainIconColor,
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
      extraMainElevatedButtonBg: Color.lerp(
        value.extraMainElevatedButtonBg,
        otherValue.extraMainElevatedButtonBg,
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
            identical(value.extraMainElevatedButtonBg,
                other.extraMainElevatedButtonBg) &&
            identical(
                value.mainElevatedButtonText, other.mainElevatedButtonText) &&
            identical(
                value.minorElevatedButtonBg, other.minorElevatedButtonBg) &&
            identical(
                value.minorElevatedButtonText, other.minorElevatedButtonText) &&
            identical(value.sliderSelected, other.sliderSelected) &&
            identical(value.sliderUnselected, other.sliderUnselected) &&
            identical(value.mainIconColor, other.mainIconColor));
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
      value.extraMainElevatedButtonBg,
      value.mainElevatedButtonText,
      value.minorElevatedButtonBg,
      value.minorElevatedButtonText,
      value.sliderSelected,
      value.sliderUnselected,
      value.mainIconColor,
    );
  }
}

extension AppColorsThemeBuildContext on BuildContext {
  AppColorsTheme get appColorsTheme =>
      Theme.of(this).extension<AppColorsTheme>()!;
}

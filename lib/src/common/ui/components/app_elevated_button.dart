import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final AppElevatedButtonType _type;
  final EdgeInsets? padding;

  const AppElevatedButton.main({
    required this.child,
    required this.onPressed,
    this.padding,
    super.key,
  }) : _type = AppElevatedButtonType.main;

  const AppElevatedButton.minor({
    required this.child,
    required this.onPressed,
    this.padding,
    super.key,
  }) : _type = AppElevatedButtonType.minor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: _getButtonStyle(
          context,
          type: _type,
          colors: context.colors,
        ),
      );

  ButtonStyle _getButtonStyle(
    BuildContext context, {
    required AppElevatedButtonType type,
    required AppColorsTheme colors,
  }) =>
      ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.disabledButtonBg;
          }
          return switch (type) {
            AppElevatedButtonType.main => colors.mainElevatedButtonBg,
            AppElevatedButtonType.minor => colors.minorElevatedButtonBg,
          };
        }),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return colors.disabledButtonText;
            }
            return switch (type) {
              AppElevatedButtonType.main => colors.mainElevatedButtonText,
              AppElevatedButtonType.minor => colors.minorElevatedButtonText,
            };
          },
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: WidgetStateProperty.all(padding),
      );
}

enum AppElevatedButtonType {
  main,
  minor,
}

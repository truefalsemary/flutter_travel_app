import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppElevatedButtonType _type;

  const AppElevatedButton.main({
    required this.text,
    required this.onPressed,
    super.key,
  }) : _type = AppElevatedButtonType.main;

  const AppElevatedButton.minor({
    required this.text,
    required this.onPressed,
    super.key,
  }) : _type = AppElevatedButtonType.minor;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: _getButtonStyle(
          context,
          type: _type,
          theme: context.colors,
        ),
      );

  ButtonStyle _getButtonStyle(
    BuildContext context, {
    required AppElevatedButtonType type,
    required AppColorsTheme theme,
  }) =>
      ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        backgroundColor:
            WidgetStateProperty.resolveWith((states) => switch (type) {
                  AppElevatedButtonType.main => theme.mainElevatedButtonBg,
                  AppElevatedButtonType.minor => theme.minorElevatedButtonBg,
                }),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => switch (type) {
            AppElevatedButtonType.main => theme.mainElevatedButtonText,
            AppElevatedButtonType.minor => theme.minorElevatedButtonText,
          },
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}

enum AppElevatedButtonType {
  main,
  minor,
}

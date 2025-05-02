import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;

  const AppText(
    this.text, {
    this.style,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (style ?? AppFonts.regularText).copyWith(
        color: color ?? context.appColorsTheme.mainText,
      ),
    );
  }
}

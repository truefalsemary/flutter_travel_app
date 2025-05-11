import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';

class AppText extends Text {
  final Color? color;
  final AppColorsTheme colors;

  // ignore: use_super_parameters
  AppText(
    String data, {
    required this.colors,
    TextStyle? style,
    this.color,
    super.key,
  }) : super(
          data,
          style: (style ?? AppFonts.regularText).copyWith(
            color: color ?? colors.mainText,
          ),
        );

  // @override
  // Widget build(BuildContext context) {
  //   return Text(
  //     text,
  //     style: (style ?? AppFonts.regularText).copyWith(
  //       color: color ?? context.colors.mainText,
  //     ),
  //   );
  // }
}

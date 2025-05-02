import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_text.dart';

class AppRangeSliderContainer extends StatelessWidget {
  final String valuePrefix;
  final String value;

  const AppRangeSliderContainer({
    required this.valuePrefix,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colors.minorElevatedButtonBg,
        ),
        child: SizedBox(
          height: 38,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                AppText(
                  valuePrefix,
                  color: context.colors.minorElevatedButtonText,
                ),
                SizedBox(width: 6),
                AppText(value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

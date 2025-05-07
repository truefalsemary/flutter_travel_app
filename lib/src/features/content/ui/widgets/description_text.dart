import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';

class DescriptionText extends StatefulWidget {
  final String text;
  final int maxLines;

  const DescriptionText({required this.text, super.key, this.maxLines = 3});

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppFonts.smallText.copyWith(
      color: context.colors.minorText,
    );
    final more = context.strings.more;
    final less = ' ${context.strings.less}';

    return LayoutBuilder(
      builder: (context, constraints) {
        if (_expanded) {
          return RichText(
            text: TextSpan(
              style: textStyle,
              children: [
                TextSpan(text: widget.text),
                TextSpan(
                  text: less,
                  style: textStyle.copyWith(color: context.colors.mainText),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => setState(() => _expanded = false),
                ),
              ],
            ),
          );
        }

        // Создаем TextPainter для проверки, помещается ли весь текст
        final textSpan = TextSpan(text: widget.text, style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        if (!textPainter.didExceedMaxLines) {
          return Text(
            widget.text,
            style: textStyle,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
          );
        }

        // Находим позицию, где можно вставить "ещё"
        final position = _findCutoffPosition(
          text: widget.text,
          style: textStyle,
          maxWidth: constraints.maxWidth,
          maxLines: widget.maxLines,
          moreText: more,
        );

        if (position == -1) {
          return Text(
            widget.text,
            style: textStyle,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
          );
        }

        return RichText(
          maxLines: widget.maxLines,
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(text: '${widget.text.substring(0, position)}...'),
              TextSpan(
                text: more,
                style: textStyle.copyWith(color: context.colors.mainText),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => setState(() => _expanded = true),
              ),
            ],
          ),
        );
      },
    );
  }

  int _findCutoffPosition({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required int maxLines,
    required String moreText,
  }) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );

    var low = 0;
    var high = text.length;
    var result = -1;

    while (low <= high) {
      final mid = (low + high) ~/ 2;
      final testText = text.substring(0, mid);
      final span = TextSpan(
        children: [
          TextSpan(text: '$testText...', style: style),
          TextSpan(text: moreText, style: style),
        ],
      );

      textPainter
        ..text = span
        ..layout(maxWidth: maxWidth);

      if (textPainter.didExceedMaxLines) {
        high = mid - 1;
      } else {
        result = mid;
        low = mid + 1;
      }
    }

    return result;
  }
}

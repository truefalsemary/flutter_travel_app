part of '../content_page.dart';

class _RouteCard extends StatelessWidget {
  final RouteModel route;

  const _RouteCard({required this.route});

  @override
  Widget build(BuildContext context) {
    final String? tempAvatarUrl = null;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.cardBg,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PostHeader(
              username: 'alina_ivanova',
              createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
              avatarUrl: tempAvatarUrl,
            ),
            const SizedBox(
              height: 10,
            ),
            _ImageModelsCarouselWidget(
              imageModels: route.places.expand(
                (place) => place.images,
              ),
              height: 200,
            ),
            _CardBodyWidget(route: route),
          ],
        ),
      ),
    );
  }
}

class _CardBodyWidget extends StatelessWidget {
  final RouteModel route;

  const _CardBodyWidget({required this.route});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardBodyTitleWidget(
              title: route.name,
              difficultyLevel: route.difficultyLevel,
              distanceKm: route.distanceKm,
            ),
            const SizedBox(height: 10),
            _DescriptionText(
              text: route.description,
            ),
            const SizedBox(
              height: 12,
            ),
            _RouteDeeplinksButtons(
              route: route,
            ),
          ],
        ),
      );
}

class _CardBodyTitleWidget extends StatelessWidget {
  final String title;
  final proto.DifficultyLevel? difficultyLevel;
  final double? distanceKm;

  const _CardBodyTitleWidget({
    required this.title,
    required this.difficultyLevel,
    required this.distanceKm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          title,
          colors: context.colors,
          color: context.colors.cardText,
          style: AppFonts.title,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.house,
              size: 18,
              color: context.colors.mainIconColor,
            ),
            const SizedBox(width: 10),
            AppText(
              '${distanceKm?.toStringAsFixed(1) ?? 0} ${context.strings.km}',
              colors: context.colors,
              color: context.colors.cardText,
              style: AppFonts.subtitle,
            ),
            const SizedBox(width: 10),
            AppText(
              _getDifficultyText(context, difficultyLevel),
              colors: context.colors,
              color: context.colors.minorText,
              style: AppFonts.subtitle,
            ),
          ],
        ),
      ],
    );
  }

  String _getDifficultyText(
    BuildContext context,
    proto.DifficultyLevel? difficulty,
  ) =>
      switch (difficulty) {
        proto.DifficultyLevel.EASY => context.strings.easyDifficulty,
        proto.DifficultyLevel.MEDIUM => context.strings.mediumDifficulty,
        proto.DifficultyLevel.HARD => context.strings.hardDifficulty,
        _ => context.strings.unknownDifficulty,
      };
}

class _DescriptionText extends StatefulWidget {
  final String text;
  static const int _maxLines = 3;

  const _DescriptionText({required this.text});

  @override
  State<_DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<_DescriptionText> {
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

        // Проверяем, переполняет ли текст maxLines
        final span = TextSpan(text: widget.text, style: textStyle);
        final tp = TextPainter(
          text: span,
          maxLines: _DescriptionText._maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        if (!tp.didExceedMaxLines) {
          return Text(
            widget.text,
            style: textStyle,
            maxLines: _DescriptionText._maxLines,
            overflow: TextOverflow.ellipsis,
          );
        }

        // Обрезаем текст так, чтобы влезло "ещё" в конце
        final trimmed = _trimText(
          widget.text,
          maxWidth: constraints.maxWidth,
          style: textStyle,
          moreText: more,
        );

        return RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(text: trimmed),
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

  String _trimText(
    String text, {
    required double maxWidth,
    required TextStyle style,
    required String moreText,
  }) {
    var min = 0;
    var max = text.length;
    while (min < max) {
      final mid = (min + max) ~/ 2;
      final span =
          TextSpan(text: text.substring(0, mid) + moreText, style: style);
      final tp = TextPainter(
        text: span,
        maxLines: _DescriptionText._maxLines,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: maxWidth);

      if (tp.didExceedMaxLines) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }
    final textLength = max > _DescriptionText._maxLines
        ? max - _DescriptionText._maxLines
        : max;
    return '${text.substring(0, textLength).trimRight()}...';
  }
}

class _PostHeader extends StatelessWidget {
  final String username;
  final DateTime createdAt;
  final String? avatarUrl;

  const _PostHeader({
    required this.username,
    required this.createdAt,
    this.avatarUrl,
  });

  String _formatDate(DateTime date) {
    final formatter = DateFormat('d MMM HH:mm', 'ru');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _Avatar(
            imageUrl: avatarUrl,
            placeholderLetter: username.isNotEmpty
                ? username.characters.first.toUpperCase()
                : '?',
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@$username',
                style: AppFonts.subtitle.copyWith(
                  color: context.colors.mainText,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _formatDate(createdAt),
                style: AppFonts.smallText.copyWith(
                  color: context.colors.minorText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? imageUrl;
  final String placeholderLetter;

  const _Avatar({
    required this.imageUrl,
    required this.placeholderLetter,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    return CircleAvatar(
      radius: 20,
      backgroundColor: imageUrl == null ? context.colors.separator : null,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
      child: imageUrl == null
          ? Text(
              placeholderLetter,
              style: TextStyle(
                color: context.colors.mainBg,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }
}

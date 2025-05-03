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
            SizedBox(
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
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                _LikeButton(initialCount: 12),
                const SizedBox(width: 12),
                _CommentButton(
                  count: 3,
                  onTap: () {},
                ),
                Spacer(),
                _SaveButton(),
              ],
            ),
            _RouteDeeplinksButtons(
              route: route,
            )
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
          color: context.colors.cardText,
          style: AppFonts.title,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Icon(
              Icons.house,
              size: 18,
              color: context.colors.primary,
            ),
            const SizedBox(width: 10),
            AppText(
              '${distanceKm?.toStringAsFixed(1) ?? 0} км',
              color: context.colors.cardText,
              style: AppFonts.subtitle,
            ),
            const SizedBox(width: 10),
            AppText(
              _getDifficultyText(context, difficultyLevel),
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
        _ => context.strings.unknownDifficulty
      };
}

class _DescriptionText extends StatefulWidget {
  final String text;

  const _DescriptionText({
    required this.text,
  });

  @override
  State<_DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<_DescriptionText> {
  bool _expanded = false;
  late String _trimmedText;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!_expanded) {
          final span = TextSpan(
              text: widget.text,
              style:
                  AppFonts.smallText.copyWith(color: context.colors.minorText));
          final tp = TextPainter(
            text: span,
            maxLines: 3,
            textDirection: TextDirection.ltr,
          )..layout(maxWidth: constraints.maxWidth);

          if (tp.didExceedMaxLines) {
            _trimmedText = _calculateTrimmedText(
                widget.text,
                constraints.maxWidth,
                AppFonts.smallText.copyWith(color: context.colors.minorText));
            return RichText(
              text: TextSpan(
                style: AppFonts.smallText
                    .copyWith(color: context.colors.minorText),
                children: [
                  TextSpan(text: _trimmedText),
                  TextSpan(
                    text: ' Еще',
                    style: AppFonts.smallText
                        .copyWith(color: context.colors.mainText),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => setState(() => _expanded = true),
                  ),
                ],
              ),
            );
          }
        }
        return RichText(
          text: TextSpan(
            style: AppFonts.smallText.copyWith(color: context.colors.minorText),
            children: [
              TextSpan(text: widget.text),
              TextSpan(
                text: ' Свернуть',
                style:
                    AppFonts.smallText.copyWith(color: context.colors.mainText),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => setState(() => _expanded = false),
              ),
            ],
          ),
        );
      },
    );
  }

  String _calculateTrimmedText(String text, double maxWidth, TextStyle style) {
    const moreText = ' Еще';

    var min = 0;
    var max = text.length;

    while (min < max) {
      final mid = (min + max) ~/ 2;
      final span =
          TextSpan(text: text.substring(0, mid) + moreText, style: style);
      final tp = TextPainter(
        text: span,
        maxLines: 3,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: maxWidth);

      if (tp.didExceedMaxLines) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }

    return '${text.substring(0, max > 3 ? max - 3 : max).trimRight()}...';
  }
}

class _LikeButton extends StatefulWidget {
  final int initialCount;

  const _LikeButton({
    required this.initialCount,
  });

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  bool isLiked = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialCount;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ActionButton(
      icon: isLiked ? AppVectors.heartFilled : AppVectors.heartOutlined,
      count: likeCount,
      onTap: _toggleLike,
    );
  }
}

class _CommentButton extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const _CommentButton({
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _ActionButton(
      icon: AppVectors.comment,
      count: count,
      onTap: onTap,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String icon;
  final int count;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.sliderUnselected,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 6),
              Text(
                count.toString(),
                style: AppFonts.subtitle.copyWith(
                  color: context.colors.minorElevatedButtonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 36),
            backgroundColor: context.colors.primary,
            foregroundColor: context.colors.mainElevatedButtonText,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10)),
        child: Row(
          children: [
            Icon(
              Icons.bookmark_border,
              size: 24,
            ),
            SizedBox(
              width: 2,
            ),
            Text('Сохранить'),
          ],
        ));
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
    return CircleAvatar(
      radius: 20,
      backgroundColor: imageUrl == null ? context.colors.separator : null,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
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

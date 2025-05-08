// Блок с кнопкой лайков, комментов, добвления в избранное
// TODO(eln02): доделать https://tracker.yandex.ru/MOBILE-29
/*
class ContentActionButtons extends StatelessWidget {
  const ContentActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LikeButton(initialCount: 12),
        const SizedBox(width: 12),
        _CommentButton(
          count: 3,
          onTap: () {},
        ),
        Spacer(),
        AppElevatedButton.main(
            child: Row(
              children: [
                Icon(
                  Icons.bookmark_border,
                  size: 24,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Сохранить')
              ],
            ),
            onPressed: () {})
      ],
    );
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
    return AppElevatedButton.minor(
      child: Row(
        children: [
          if (isLiked)
            SvgPicture.asset(AppVectors.heartFilled)
          else
            SvgPicture.asset(AppVectors.heartOutlined),
          SizedBox(
            width: 6,
          ),
          Text('$likeCount')
        ],
      ),
      onPressed: _toggleLike,
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
    return AppElevatedButton.minor(
      child: Row(
        children: [
          SvgPicture.asset(AppVectors.comment),
          SizedBox(
            width: 6,
          ),
          Text(
            '$count',
          ),
        ],
      ),
      onPressed: onTap,
    );
  }
}
*/

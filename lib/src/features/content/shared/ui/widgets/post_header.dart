import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:intl/intl.dart';

class PostHeader extends StatelessWidget {
  final String username;
  final DateTime createdAt;
  final String? avatarUrl;

  const PostHeader({
    required this.username,
    required this.createdAt,
    super.key,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat('d MMM HH:mm', 'ru');
    return formatter.format(date);
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

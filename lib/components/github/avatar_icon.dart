import 'package:flutter/material.dart';

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({
    super.key,
    required this.url,
    this.size = 32,
  });

  final String url;
  final int size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2.0,
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      backgroundImage: ResizeImage.resizeIfNeeded(
        size,
        size,
        NetworkImage(url),
      ),
    );
  }
}

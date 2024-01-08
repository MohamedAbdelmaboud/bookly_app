import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: CachedNetworkImage(imageUrl: imageUrl
     , errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  final String?  imageUrl;
  final double? radius ;
  const CustomCircularImage({super.key, required this.imageUrl,this.radius = 20});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? 'https://picsum.photos/200/300',
      imageBuilder: (context, image) => CircleAvatar(
        backgroundImage: image,
        radius: radius,
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

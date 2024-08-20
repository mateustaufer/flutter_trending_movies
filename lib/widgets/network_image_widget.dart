import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/constants.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  Widget imageNotSupported() {
    return const Icon(Icons.image_not_supported);
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.replaceAll(' ', '').isEmpty ?? true) {
      return imageNotSupported();
    }

    return CachedNetworkImage(
      imageUrl: '${Constants.imageBaseUrlOriginalSize}/$imageUrl',
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: Colors.white,
          width: width,
          height: height,
        ),
      ),
      errorWidget: (context, url, error) => imageNotSupported(),
      width: width,
      height: height,
    );
  }
}

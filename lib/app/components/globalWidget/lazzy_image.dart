import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LazzyImage extends StatelessWidget {
  final String imgUrl;
  const LazzyImage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(primaryColor, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => const LoadingProccess(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

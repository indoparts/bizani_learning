import 'package:bizani_learning/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LazzyImage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String ImgUrl;
  // ignore: non_constant_identifier_names
  const LazzyImage({Key? key, required this.ImgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: ImgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(primaryColor, BlendMode.colorBurn)),
        ),
      ),
      placeholder: (context, url) => Center(
        child: SizedBox(
            height: 1.h,
            width: 1.w,
            child: const CircularProgressIndicator(color: primaryColor)),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

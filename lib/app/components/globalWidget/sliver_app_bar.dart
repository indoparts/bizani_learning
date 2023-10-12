// ignore_for_file: must_be_immutable

import 'package:bizani_learning/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliverAppbar extends StatelessWidget {
  final Color bgColorAppbar;
  final Color bgColorTextlight;
  final Color bgColorTextdark;
  final String bgImgText;
  final String txtTitle;
  final String txtSubitle;
  final bool dividerTxtTitle;
  SliverAppbar(
      {super.key,
      required this.bgColorAppbar,
      required this.bgImgText,
      required this.txtTitle,
      required this.txtSubitle,
      required this.dividerTxtTitle,
      required this.bgColorTextlight,
      required this.bgColorTextdark});

  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    var indicatours =
        txtSubitle.length > 80 ? txtSubitle.length : txtSubitle.length * 2;
    return SliverAppBar(
        elevation: 0,
        backgroundColor: bgColorAppbar,
        expandedHeight: 30.h,
        floating: false,
        pinned: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: bgColor,
            radius: 10,
            child: IconButton(
                splashRadius: 10,
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
        ),
        flexibleSpace: LayoutBuilder(builder: (context, constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
            centerTitle: true,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(txtTitle,
                        style: TextStyle(
                            color: top < 80.74
                                ? bgColorTextdark
                                : bgColorTextlight,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  if (dividerTxtTitle && top > indicatours)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: txtTitle.length * 2,
                            right: txtTitle.length * 2),
                        child: Divider(
                          color: Colors.yellow,
                          height: 3.h,
                          thickness: 5,
                        ),
                      ),
                    ),
                  if (top > indicatours)
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        txtSubitle,
                        style: TextStyle(
                            color: top < 80.74
                                ? bgColorTextdark
                                : bgColorTextlight,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    )
                ],
              ),
            ),
            background: CachedNetworkImage(
              imageUrl: bgImgText,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
                child: Container(
                  color: const Color.fromARGB(204, 36, 36, 36),
                ),
              ),
              placeholder: (context, url) => Center(
                  child: SizedBox(
                      height: 1.h,
                      width: 2.w,
                      child: const CircularProgressIndicator())),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        }));
  }
}

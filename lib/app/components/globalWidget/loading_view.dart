import 'package:bizani_learning/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoadingProccess extends StatelessWidget {
  const LoadingProccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.flickr(
          leftDotColor: primaryColor,
          rightDotColor: secondaryColor,
          size: 10.sp),
    );
  }
}

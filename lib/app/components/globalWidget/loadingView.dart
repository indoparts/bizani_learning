import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoadingProccess extends StatelessWidget {
  const LoadingProccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 1.h,
          width: 2.w,
          child: const CircularProgressIndicator(
            color: primaryColor,
          )),
    );
  }
}

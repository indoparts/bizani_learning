import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CallView extends StatelessWidget {
  const CallView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 100,
                  backgroundColor: bgColor,
                  child: Lottie.asset('assets/icons/call.json')),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Menunggu...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                    fontSize: 15.sp),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: secondaryColor,
              child: IconButton(
                  onPressed: () => Get.toNamed('support-incall'),
                  icon: const Icon(
                    Icons.call_sharp,
                    color: bgColor,
                  )),
            ),
            SizedBox(
              width: 5.w,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: dangerColor,
              child: IconButton(
                  onPressed: () => Get.toNamed('support'),
                  icon: const Icon(
                    Icons.call_end_sharp,
                    color: bgColor,
                  )),
            )
          ],
        ));
  }
}

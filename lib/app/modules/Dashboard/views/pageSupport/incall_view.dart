import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class InCallView extends StatelessWidget {
  const InCallView({Key? key}) : super(key: key);
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
                  child: Lottie.asset('assets/icons/incall.json')),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Dalam Percakapan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                '01:50',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: bgColor,
                    fontSize: 25.sp),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: dangerColor,
          child: IconButton(
              onPressed: () => Get.toNamed('support'),
              icon: const Icon(
                Icons.call_end_sharp,
                color: bgColor,
              )),
        ));
  }
}

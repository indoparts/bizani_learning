import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardCoursesBased extends StatelessWidget {
  const CardCoursesBased({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: CardKursus(),
        ));
  }
}

class CardKursus extends StatelessWidget {
  const CardKursus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 17.h,
                      width: 29.w,
                      child: Text(
                        'Lorem Ipsum is simply dummy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.account_balance),
                        Text(
                          'NPTEL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

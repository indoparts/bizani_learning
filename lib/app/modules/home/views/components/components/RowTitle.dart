import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RowTitle extends StatelessWidget {
  final String text;
  const RowTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: SizedBox(
            width: 75.w,
            child: RichText(
              text: TextSpan(
                  text: 'Karena kamu menyukai',
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' $text',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Lainya',
              style: TextStyle(color: primaryColor),
            ))
      ],
    );
  }
}

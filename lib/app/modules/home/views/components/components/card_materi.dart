import 'package:bizani_learning/app/components/globalWidget/lazzy_image.dart';
import 'package:bizani_learning/app/components/globalWidget/text_apps.dart';
import 'package:bizani_learning/app/routes/app_pages.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardMateri extends StatelessWidget {
  final int id;
  final String images;
  final String title;
  final bool question;
  const CardMateri(
      {Key? key,
      required this.images,
      required this.title,
      required this.question,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromHeight(100), // Image radius
                  child: LazzyImage(imgUrl: images),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextApps(
                align: TextAlign.left,
                size: 10,
                stylefont: FontWeight.normal,
                text: title,
              ),
              SizedBox(
                height: 1.h,
              ),
              if (question == false)
                SizedBox(
                  height: 2.70.h,
                ),
              if (question == true)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.redeem,
                          size: 15,
                        ),
                        TextApps(
                          align: TextAlign.left,
                          size: 10,
                          stylefont: FontWeight.normal,
                          text: 'Sertifikasi',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 15,
                        ),
                        TextApps(
                          align: TextAlign.left,
                          size: 10,
                          stylefont: FontWeight.normal,
                          text: '4-5 Jam',
                        )
                      ],
                    )
                  ],
                ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () =>
                    Get.offAllNamed(Routes.learn, arguments: id.toInt()),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Mulai Sekarang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

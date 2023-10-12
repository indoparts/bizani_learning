import 'package:bizani_learning/app/components/globalWidget/sliver_app_bar.dart';
import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'components/SliderSkills.dart';

// ignore: must_be_immutable
class CreerInfoView extends GetView<ExploreCareerInfoControllerController> {
  CreerInfoView({Key? key}) : super(key: key);
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                Obx(() => SliverAppbar(
                    txtTitle: controller.name.value,
                    txtSubitle: controller.description.value,
                    bgColorTextlight: bgColor,
                    bgColorTextdark: Colors.black,
                    bgImgText:
                        '$baseUrlImg/sub-category-career&cover_img/${controller.coverImg.value}',
                    dividerTxtTitle: false,
                    bgColorAppbar: bgColor))
              ];
            },
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(() => Text(
                          controller.description.value,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SliderSkills(),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.all(10),
                  //   child: CardAverageAnualSalary(),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Text(
                  //     'Kursus berdasarkan materi karir',
                  //     style: TextStyle(
                  //         fontSize: 12.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // const CardCoursesBased(),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // const CardRateInterestCareer(),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Row(
                  //     children: [
                  //       const Icon(Icons.navigation),
                  //       Text(
                  //         'Jelajahi Karir',
                  //         style: TextStyle(
                  //             fontSize: 12.sp, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // ListView.builder(
                  //   padding: const EdgeInsets.only(top: 1),
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemCount: 10,
                  //   itemBuilder: (context, index) {
                  //     return const Accordion();
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Row(
                  //     children: [
                  //       const Icon(Icons.navigation),
                  //       Text(
                  //         'Karir yang mirip dengan (Karir yang dipilih)',
                  //         style: TextStyle(
                  //             fontSize: 12.sp, fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // const CardCarrerSimmiliar(),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Text(
                  //     'Kursus berdasarkan keterampilan yang dibutuhkan karir ini',
                  //     style: TextStyle(
                  //         fontSize: 12.sp, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // const CardCoursesBased(),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // Padding(
                  //     padding: const EdgeInsets.all(10),
                  //     child: CardHollandCodes())
                ],
              ),
            ))));
  }
}

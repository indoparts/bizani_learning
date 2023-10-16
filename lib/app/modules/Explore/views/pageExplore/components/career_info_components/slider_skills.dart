import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flexi_chip/flexi_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SliderSkills extends StatelessWidget {
  final state = Get.find<ExploreCareerInfoControllerController>();
  SliderSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 1, viewportFraction: 0.4);
    return SizedBox(
      width: 100.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Kemampuan yang dibutuhkan pada karir ini',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.h,
              ),
              Obx(() {
                if (state.skillsData.isNotEmpty) {
                  return SizedBox(
                      height: 4.h,
                      child: Obx(
                        () => PageView.builder(
                            controller: controller,
                            itemCount: state.skillsData.length,
                            itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: FlexiChip(
                                    label: Text(
                                      state.skillsData[index].skillname,
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 9.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: FlexiChipStyle.filled(
                                        color: const Color.fromARGB(
                                            6, 217, 235, 255))))),
                      ));
                } else {
                  return const Center(
                      child: Text('Tidak ada kemampuan yang diperlukan'));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

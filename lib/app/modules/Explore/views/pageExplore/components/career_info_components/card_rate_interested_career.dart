import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardRateInterestCareer extends StatelessWidget {
  const CardRateInterestCareer({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<ExploreCareerInfoControllerController>();
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 0.1.w, color: const Color.fromARGB(255, 255, 232, 24)),
            bottom: BorderSide(
                width: 0.1.w, color: const Color.fromARGB(255, 255, 232, 24)),
          ),
          color: const Color.fromARGB(255, 255, 254, 246),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Nilai minat Anda untuk mengejar karir ini untuk mendapatkan rekomendasi karir & kursus yang lebih baik',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
              )),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      5,
                      (index) => InkWell(
                            onTap: () => state.postCareerInterested(index + 1),
                            child: ClipRRect(
                              child: SvgPicture.asset(
                                'assets/icons/${index + 1}.svg',
                                height: 5.h,
                                width: 5.w,
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

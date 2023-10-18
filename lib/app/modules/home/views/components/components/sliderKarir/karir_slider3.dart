import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:bizani_learning/app/modules/home/controllers/karir/karir3_controller.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/survey_karir.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../card_karir.dart';

class KarirSlider3 extends StatelessWidget {
  final int careerCategoryId;
  final String txt1;
  final String txt2;
  KarirSlider3({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.careerCategoryId,
  });
  final state = Get.find<Karir3Controller>();
  callData() async {
    return await state.getSlider(careerCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    final homestate = Get.find<HomeController>();
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.7);
    return Container(
      width: 500.w,
      color: const Color.fromARGB(26, 182, 182, 182),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(txt1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              txt2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
              height: 12.h,
              child: FutureBuilder(
                future: callData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return PageView.builder(
                        controller: controller,
                        itemCount: state.dataKarir.length,
                        onPageChanged: (i) {
                          if (state.currentPage.value <= state.lastPage.value) {
                            if (i == (state.dataKarir.length - 1)) {
                              state.getSlider(careerCategoryId);
                            }
                          }
                        },
                        itemBuilder: (context, index) => CardKarir(
                            text: state.dataKarir[index].name,
                            idSubKategoriKarir: state.dataKarir[index].id));
                  } else {
                    return const LoadingProccess();
                  }
                },
              )),
          Obx(() => homestate.surveyKarir3.isTrue
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: SurveyKarir(
                    urutan: 3,
                    idKategoriKarir: homestate.listclientKarir[2].id,
                  ),
                )
              : SizedBox(height: 5.h)),
        ],
      ),
    );
  }
}

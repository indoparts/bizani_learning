import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:bizani_learning/app/modules/home/controllers/kursus/kursus3_controller.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/card_materi.dart';

class KursusSlider3 extends StatelessWidget {
  final int idKursus;
  KursusSlider3({Key? key, required this.idKursus}) : super(key: key);
  final state = Get.find<Kursus3Controller>();
  callData() async {
    return await state.getSliderKursus(idKursus);
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.5);
    const baseUrlImage = '$baseUrlImg/material-learning&cover_image';
    return SizedBox(
        height: 33.h,
        child: DecoratedBox(
          decoration:
              const BoxDecoration(color: Color.fromARGB(26, 182, 182, 182)),
          child: FutureBuilder(
            future: callData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                  controller: controller,
                  itemCount: state.carouselclientKursus.length,
                  onPageChanged: (i) {
                    if (state.carouselclientKursusCurrentPage.value <=
                        state.carouselclientKursusLastPage.value) {
                      if (i == (state.carouselclientKursus.length - 1)) {
                        state.getSliderKursus(idKursus);
                      }
                    }
                  },
                  itemBuilder: (context, index) => CardMateri(
                      images:
                          "$baseUrlImage/${state.carouselclientKursus[index].coverImg}",
                      question:
                          state.carouselclientKursus[index].question.isEmpty
                              ? false
                              : true,
                      title: state.carouselclientKursus[index].title,
                      id: state.carouselclientKursus[index].id),
                );
              } else {
                return const LoadingProccess();
              }
            },
          ),
        ));
  }
}

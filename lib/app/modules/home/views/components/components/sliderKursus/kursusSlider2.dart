import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:bizani_learning/app/modules/home/controllers/kursus/kursus2_controller.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/CardMateri.dart';

class kursusSlider2 extends StatelessWidget {
  final int idKursus;
  const kursusSlider2({Key? key, required this.idKursus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.5);
    final state = Get.find<Kursus2Controller>();
    state.getSliderKursus(idKursus);
    final dataParse = state.CarouselclientKursus;
    const baseUrlImage = '$baseUrlImg/material-learning&cover_image';
    return SizedBox(
      height: 33.h,
      child: Obx(() {
        if (state.isLoadingCarouselKursus.isTrue) {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        } else {
          if (dataParse.isNotEmpty) {
            return PageView.builder(
              controller: controller,
              itemCount: dataParse.length,
              onPageChanged: (i) {
                if (state.CarouselclientKursusCurrentPage.value <=
                    state.CarouselclientKursusLastPage.value) {
                  if (i == (dataParse.length - 1)) {
                    state.getSliderKursus(idKursus);
                  }
                }
              },
              itemBuilder: (context, index) => CardMateri(
                  Images: "$baseUrlImage/${dataParse[index].coverImg}",
                  question: dataParse[index].question.isEmpty ? false : true,
                  title: dataParse[index].title,
                  id: dataParse[index].id),
            );
          } else {
            return const Center(child: Text('Tidak ada data!'));
          }
        }
      }),
    );
  }
}

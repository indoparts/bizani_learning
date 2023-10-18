import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/sliderKarir/karir_slider1.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/sliderKarir/karir_slider2.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/sliderKarir/karir_slider3.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/widget/home_footer.dart';

class CareerView extends GetView {
  CareerView({Key? key}) : super(key: key);
  final state = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => KarirSlider1(
              txt1: 'Karir untuk kamu dalam',
              txt2: state.listclientKarir[0].category[0].name,
              careerCategoryId: state.listclientKarir[0].careerCategoryId,
            ),
          ),
          Obx(
            () => KarirSlider2(
              txt1: 'Karir untuk kamu dalam',
              txt2: state.listclientKarir[1].category[0].name,
              careerCategoryId: state.listclientKarir[1].careerCategoryId,
            ),
          ),
          Obx(
            () => KarirSlider3(
              txt1: 'Karir untuk kamu dalam',
              txt2: state.listclientKarir[2].category[0].name,
              careerCategoryId: state.listclientKarir[2].careerCategoryId,
            ),
          ),
          HomeFooter(
              txt1:
                  'Untuk Mendapatkan hasil rekomendasi yang lebih akurat, kamu bisa memperbaharui data klasifikasi kamu sendiri kapan saja dan dimana saja.',
              txtBtn: "Perbaharui data rekomendasi kamu",
              tapBtn: () => Get.toNamed("/choice-recomendation1")),
          const SizedBox(height: 30),
        ],
      ),
    ));
  }
}

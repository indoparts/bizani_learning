import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/row_title.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/sliderKursus/kursus_slider1.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/sliderKursus/kursus_slider2.dart';
import 'package:bizani_learning/app/modules/home/views/components/components/sliderKursus/kursus_slider3.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/survey_kursus.dart';
import 'components/widget/grid_kategori_kursus.dart';
import 'components/widget/home_footer.dart';

class CoursesView extends GetView {
  const CoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Get.find<HomeController>();
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: RowTitle(text: state.listclientKursus[0].name),
          ),
          Obx(
            () => KursusSlider1(
              idKursus: state.listclientKursus[0].id,
            ),
          ),
          Obx(() => state.surveyKursus1.isTrue
              ? SurveyKursus(
                  idKategoriKursus: state.listclientKursus[0].id,
                  urutan: 1,
                )
              : SizedBox(height: 5.h)),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RowTitle(text: state.listclientKursus[1].name),
          ),
          Obx(
            () => KursusSlider2(
              idKursus: state.listclientKursus[1].id,
            ),
          ),
          Obx(() => state.surveyKursus2.isTrue
              ? SurveyKursus(
                  idKategoriKursus: state.listclientKursus[1].id,
                  urutan: 1,
                )
              : SizedBox(height: 5.h)),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RowTitle(text: state.listclientKursus[2].name),
          ),
          Obx(
            () => KursusSlider3(
              idKursus: state.listclientKursus[2].id,
            ),
          ),
          Obx(() => state.surveyKursus3.isTrue
              ? SurveyKursus(
                  idKategoriKursus: state.listclientKursus[2].id,
                  urutan: 3,
                )
              : SizedBox(height: 5.h)),
          GridKategoriKursus(),
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

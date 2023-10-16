import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widget.dart';
import 'components/RowTitle.dart';
import 'components/sliderKarir/karirSlider1.dart';
import 'components/sliderKarir/karirSlider2.dart';
import 'components/sliderKarir/karirSlider3.dart';
import 'components/sliderKursus/kursusSlider1.dart';
import 'components/sliderKursus/kursusSlider2.dart';
import 'components/sliderKursus/kursusSlider3.dart';
import 'components/Survey.dart';

class AllView extends GetView {
  AllView({Key? key}) : super(key: key);
  final state = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    state.getDataListClientKursus();
    state.getDataListClientKarir();
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 2.h),
          Obx(() {
            if (state.isLoadingListClientKursus.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else {
              state.cekSurvey(state.ListclientKursus[0].id, 1);
              state.cekSurvey(state.ListclientKursus[1].id, 2);
              state.cekSurvey(state.ListclientKursus[2].id, 3);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: RowTitle(text: state.ListclientKursus[0].name),
                  ),
                  kursusSlider1(
                    idKursus: state.ListclientKursus[0].id,
                  ),
                  Obx(() => state.survey1.isTrue
                      ? Survey(
                          idKategoriKursus: state.ListclientKursus[0].id,
                          urutan: 1,
                        )
                      : SizedBox(height: 5.h)),
                  karirSlider1(
                    txt1: 'Karir untuk kamu dalam',
                    txt2: state.listclientKarir[0].category[0].name,
                    career_category_id:
                        state.listclientKarir[0].careerCategoryId,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: RowTitle(text: state.ListclientKursus[1].name),
                  ),
                  kursusSlider2(
                    idKursus: state.ListclientKursus[1].id,
                  ),
                  Obx(() => state.survey2.isTrue
                      ? Survey(
                          idKategoriKursus: state.ListclientKursus[1].id,
                          urutan: 2,
                        )
                      : SizedBox(height: 5.h)),
                  karirSlider2(
                    txt1: 'Karir untuk kamu dalam',
                    txt2: state.listclientKarir[1].category[0].name,
                    career_category_id:
                        state.listclientKarir[1].careerCategoryId,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: RowTitle(text: state.ListclientKursus[2].name),
                  ),
                  kursusSlider3(
                    idKursus: state.ListclientKursus[2].id,
                  ),
                  Obx(() => state.survey3.isTrue
                      ? Survey(
                          idKategoriKursus: state.ListclientKursus[2].id,
                          urutan: 3,
                        )
                      : SizedBox(height: 5.h)),
                  karirSlider3(
                    txt1: 'Karir untuk kamu dalam',
                    txt2: state.listclientKarir[2].category[0].name,
                    career_category_id:
                        state.listclientKarir[2].careerCategoryId,
                  ),
                ],
              );
            }
          }),
          SizedBox(height: 3.h),
          WidgetHomeFooter(
              txt1:
                  'Untuk Mendapatkan hasil rekomendasi yang lebih akurat, kamu bisa memperbaharui data klasifikasi kamu sendiri kapan saja dan dimana saja.',
              txtBtn: "Perbaharui data rekomendasi kamu",
              tapBtn: () => Get.toNamed("/choice-recomendation1")),
          SizedBox(height: 3.h),
        ],
      ),
    ));
  }
}

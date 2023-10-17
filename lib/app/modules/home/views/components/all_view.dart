import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widget.dart';
import 'components/row_title.dart';
import 'components/sliderKarir/karir_slider1.dart';
import 'components/sliderKarir/karir_slider2.dart';
import 'components/sliderKarir/karir_slider3.dart';
import 'components/sliderKursus/kursus_slider1.dart';
import 'components/sliderKursus/kursus_slider2.dart';
import 'components/sliderKursus/kursus_slider3.dart';
import 'components/survey.dart';

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
            if (state.loading.isTrue) {
              return const LoadingProccess();
            } else {
              if (state.listclientKursus.isNotEmpty &&
                  state.listclientKarir.isNotEmpty) {
                state.cekSurvey(state.listclientKursus[0].id, 1);
                state.cekSurvey(state.listclientKursus[1].id, 2);
                state.cekSurvey(state.listclientKursus[2].id, 3);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: RowTitle(text: state.listclientKursus[0].name),
                    ),
                    KursusSlider1(
                      idKursus: state.listclientKursus[0].id,
                    ),
                    Obx(() => state.survey1.isTrue
                        ? Survey(
                            idKategoriKursus: state.listclientKursus[0].id,
                            urutan: 1,
                          )
                        : SizedBox(height: 5.h)),
                    Obx(
                      () => KarirSlider1(
                        txt1: 'Karir untuk kamu dalam',
                        txt2: state.listclientKarir[0].category[0].name,
                        careerCategoryId:
                            state.listclientKarir[0].careerCategoryId,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: RowTitle(text: state.listclientKursus[1].name),
                    ),
                    Obx(
                      () => KursusSlider2(
                        idKursus: state.listclientKursus[1].id,
                      ),
                    ),
                    Obx(() => state.survey2.isTrue
                        ? Survey(
                            idKategoriKursus: state.listclientKursus[1].id,
                            urutan: 2,
                          )
                        : SizedBox(height: 5.h)),
                    Obx(
                      () => KarirSlider2(
                        txt1: 'Karir untuk kamu dalam',
                        txt2: state.listclientKarir[1].category[0].name,
                        careerCategoryId:
                            state.listclientKarir[1].careerCategoryId,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: RowTitle(text: state.listclientKursus[2].name),
                    ),
                    Obx(
                      () => KursusSlider3(
                        idKursus: state.listclientKursus[2].id,
                      ),
                    ),
                    Obx(() => state.survey3.isTrue
                        ? Survey(
                            idKategoriKursus: state.listclientKursus[2].id,
                            urutan: 3,
                          )
                        : SizedBox(height: 5.h)),
                    Obx(
                      () => KarirSlider3(
                        txt1: 'Karir untuk kamu dalam',
                        txt2: state.listclientKarir[2].category[0].name,
                        careerCategoryId:
                            state.listclientKarir[2].careerCategoryId,
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Tidak ada data.'),
                );
              }
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

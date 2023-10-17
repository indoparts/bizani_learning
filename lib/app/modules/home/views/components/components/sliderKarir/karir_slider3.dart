import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/app/modules/home/controllers/karir/karir3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../card_karir.dart';

class KarirSlider3 extends StatelessWidget {
  final int careerCategoryId;
  final String txt1;
  final String txt2;
  const KarirSlider3({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.careerCategoryId,
  });
  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.7);
    final state = Get.find<Karir3Controller>();
    state.getSlider(careerCategoryId);
    final dataParse = state.dataKarir;
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
            child: Obx(() {
              if (state.isLoadingDataKarir.isTrue) {
                return const LoadingProccess();
              } else {
                if (dataParse.isNotEmpty) {
                  return PageView.builder(
                      controller: controller,
                      itemCount: dataParse.length,
                      onPageChanged: (i) {
                        if (state.currentPage.value <= state.lastPage.value) {
                          if (i == (dataParse.length - 1)) {
                            state.getSlider(careerCategoryId);
                          }
                        }
                      },
                      itemBuilder: (context, index) => CardKarir(
                          text: dataParse[index].name,
                          idSubKategoriKarir: dataParse[index].id));
                } else {
                  return const Center(child: Text('Tidak ada data!'));
                }
              }
            }),
          )
        ],
      ),
    );
  }
}
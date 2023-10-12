import 'package:bizani_learning/app/modules/home/controllers/karir/karir1_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../CardKarir.dart';

class karirSlider1 extends StatelessWidget {
  final int career_category_id;
  final String txt1;
  final String txt2;
  const karirSlider1({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.career_category_id,
  });
  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.7);
    final state = Get.find<Karir1Controller>();
    state.getSlider(career_category_id);
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
                        if (state.currentPage.value <= state.lastPage.value) {
                          if (i == (dataParse.length - 1)) {
                            state.getSlider(career_category_id);
                          }
                        }
                      },
                      itemBuilder: (context, index) => CardKarir(
                            text: dataParse[index].name,
                            idSubKategoriKarir: dataParse[index].id,
                          ));
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

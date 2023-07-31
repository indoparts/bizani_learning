import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widget.dart';

class AllView extends GetView {
  AllView({Key? key}) : super(key: key);
  final state = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 2.h),
          WidgetHomeMore(
              txt: 'Karena kamu menyukai.....',
              tapMOre: () => {},
              txtMore: 'Lainya'),
          const InfCarousel(),
          SizedBox(height: 2.h),
          WidgetHomeSurvel(
              txt: 'Apakah rekomendasi ini relevan?',
              tapLIke: () {},
              tapUnlIke: () {}),
          SizedBox(height: 2.h),
          WidgetHomeCarouselInfo(
            txt1: 'Karir untuk kamu',
            txt2: 'Dalam (kategori yang dipilih)',
            datas: const [1, 2, 3, 4, 5, 6, 7, 8, 9],
          ),
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

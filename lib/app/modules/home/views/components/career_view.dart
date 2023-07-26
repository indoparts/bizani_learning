import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widget.dart';

class CareerView extends GetView {
  const CareerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          WidgetHomeCarouselInfo(
            txt1: 'Karir untuk kamu',
            txt2: 'Dalam (kategori yang dipilih)',
            datas: const [1, 2, 3, 4, 5, 6, 7, 8, 9],
          ),
          const SizedBox(height: 20),
          WidgetHomeMore(
              txt: 'Karena kamu menyukai.....',
              tapMOre: () => {},
              txtMore: 'Lainya'),
          const WidgetHomeCarousel(),
          const SizedBox(height: 20),
          WidgetHomeSurvel(
              txt: 'Apakah rekomendasi ini relevan?',
              tapLIke: () {},
              tapUnlIke: () {}),
          const SizedBox(height: 30),
          WidgetHomeFooter(
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

import '../widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'components/Survey.dart';

class CoursesView extends GetView {
  const CoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          WidgetHomeMore(
              txt: 'Karena kamu menyukai.....',
              tapMOre: () => {},
              txtMore: 'Lainya'),
          const SizedBox(height: 20),
          WidgetHomeMore(
              txt: 'Karena kamu menyukai.....',
              tapMOre: () => {},
              txtMore: 'Lainya'),
          const SizedBox(height: 20),
          WidgetHomeMore(
              txt: 'Karena kamu menyukai.....',
              tapMOre: () => {},
              txtMore: 'Lainya'),
          const SizedBox(height: 20),
          const Survey(
            idKategoriKursus: 0,
            urutan: 0,
          ),
          const SizedBox(height: 30),
          WidgetHomeCousesCategory(),
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

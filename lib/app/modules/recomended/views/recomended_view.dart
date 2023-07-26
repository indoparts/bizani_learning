import 'package:bizani_learning/constant.dart';
import 'package:bizani_learning/widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recomended_controller.dart';

class RecomendedView extends GetView<RecomendedController> {
  const RecomendedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
          'Rekomendasi',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset('assets/images/selfie.png'),
            ),
            const Text(
              'Kami memiliki banyak program yang mungkin anda minati, dan kami akan merekomendasikanya untuk anda.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MyButton(
              onTap: () {
                Get.toNamed('/choice-recomendation');
              },
              textBtn: 'Ambil Rekomendasi',
            ),
          ],
        )),
      ),
    );
  }
}

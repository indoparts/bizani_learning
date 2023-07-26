import 'package:bizani_learning/constant.dart';
import 'package:bizani_learning/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../controllers/introduction2_controller.dart';

class Introduction2View extends GetView<Introduction2Controller> {
  const Introduction2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 150,
                          child:
                              Lottie.asset('assets/icons/introduction2.json')),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Bergabunglah sekarang',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          'Kami sangat sadar bahwa waktu anda sangat berharga, Bizani adalah tempat belajar yang tepat untuk anda mengisi waktu luang atau pun menambah pengetahuan sesuai dengan apa yang anda minati.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ],
                  ),
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WidgetBtn(
              title: 'Masuk',
              icon: Icons.login,
              act: () {
                Get.toNamed('/login');
              },
              color: Colors.white,
              type: 'outline',
            ),
            WidgetBtn(
              title: 'Daftar',
              icon: Icons.add,
              act: () {
                Get.toNamed('/daftar');
              },
              color: secondaryColor,
              type: 'elevate',
            )
          ],
        ));
  }
}

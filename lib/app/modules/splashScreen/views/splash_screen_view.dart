import 'dart:async';

import 'package:bizani_learning/app/modules/login/controllers/login_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    Timer(Duration(seconds: 5), () => loginController.autoLogin());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                child: Lottie.asset('assets/icons/splashscreen.json'),
                radius: 120),
            const SizedBox(height: 20),
            const Text(
              'Menunggu Prosses',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: bgColor),
            )
          ],
        ),
      ),
    );
  }
}

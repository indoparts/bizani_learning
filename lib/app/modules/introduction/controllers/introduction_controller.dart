import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionController extends GetxController {
  final introKey = GlobalKey<IntroductionScreenState>();

  void onIntroEnd(context) {
    Get.toNamed('/introduction2');
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void signUserIn() {
    Get.toNamed('/termcondition');
  }
}

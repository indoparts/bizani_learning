import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn() {
    Get.toNamed('/termcondition');
  }
}

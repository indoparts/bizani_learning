// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:bizani_learning/app/modules/login/providers/login_provider.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  LoginProvider provider = Get.put(LoginProvider());
  final getstorage = GetStorage();
  var loading = false.obs;
  var isAuth = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read("client") != null) {
      final data = box.read("client") as Map<String, dynamic>;
      login(data["email"], data["password"]);
    } else {
      Get.toNamed('/introduction');
    }
  }

  void login(String email, String password) async {
    try {
      loading(true);
      var dataPost = jsonEncode({'email': email, 'password': password});
      var res = await provider.postLogin(dataPost);
      var parsed = json.decode(res.bodyString);
      if (res.statusCode == 200 && parsed['status'] == true) {
        getstorage.write('auth', {
          "type": parsed['data']['auth']['type'],
          "token": parsed['data']['auth']['token'],
          "expired": parsed['data']['auth']['expires_at'],
        });
        getstorage.write('client', {
          "id": parsed['data']['clients']["id"],
          "frontname": parsed['data']['clients']["frontname"],
          "midname": parsed['data']['clients']["midname"],
          "backname": parsed['data']['clients']["backname"],
          "fullname": parsed['data']['clients']["fullname"],
          "username": parsed['data']['clients']["username"],
          "email": email,
          "password": password,
          "status": parsed['data']['clients']["status"],
        });
        cekClient();
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loading(false);
    }
  }

  void cekClient() async {
    try {
      var response = await provider.getCekClient();
      print(response.body);
      var resp = response.body['data'];
      if (resp['term_condition'] == false) {
        Get.toNamed('/termcondition');
      } else if (resp['reccomendation_1'] == false) {
        Get.toNamed('/choice-recomendation1');
      } else if (resp['reccomendation_2'] == false) {
        Get.toNamed('/choice-recomendation2');
      } else if (resp['reccomendation_3'] == false) {
        Get.toNamed('/choice-recomendation3');
      } else if (resp['reccomendation_4'] == false) {
        Get.toNamed('/choice-recomendation4');
      } else if (resp['reccomendation_5'] == false) {
        Get.toNamed('/choice-recomendation5');
      } else {
        print('kesini woy');
        Get.toNamed('/home');
      }
      isAuth(true);
    } catch (e) {
      Get.snackbar(
        'Terjadi Kesalahan!',
        "Mohon maaf atas ketidak nyamananya, kami akan segera memperbaikinya.",
        colorText: Colors.white,
        backgroundColor: dagerColor,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
      );
    }
  }

  void logout() async {
    var res = await provider.postLogout();
    if (res.statusCode == 200) {
      isAuth(false);
      clearStorage();
      Get.toNamed('/login');
    }
  }

  void clearStorage() async {
    final box = GetStorage();
    if (box.read('auth') != null) {
      box.erase();
    }
    if (box.read('client') != null) {
      box.erase();
    }
  }
}

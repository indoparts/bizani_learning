// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:bizani_learning/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/login_provider.dart';

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
      var data = jsonEncode({'email': email, 'password': password});
      var response = await provider.postLogin(data);
      if (response.statusCode == 200) {
        setStorageAuth(response.body['data']);
        profile(email, password);
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loading(false);
    }
  }

  void profile(String email, String password) async {
    try {
      final response = await provider.getProfile();
      if (response.statusCode == 200) {
        var setupdata = response.body['data'];
        setupdata['email'] = email;
        setupdata['password'] = password;
        setStorageClient(setupdata);
        cekClient();
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loading(false);
    }
  }

  void cekClient() async {
    final response = await provider.getCekClient();
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
      Get.toNamed('/home');
    }
    isAuth(true);
  }

  void logout() async {
    final res = await provider.postLogout();
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

  void setStorageAuth(data) async {
    final getstorage = GetStorage();
    getstorage.write('auth', data);
  }

  void setStorageClient(data) async {
    final getstorage = GetStorage();
    getstorage.write('client', data);
  }
}

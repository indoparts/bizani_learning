import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/home_models/career_model.dart';
import '../../providers/home_provider.dart';

class Karir3Controller extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());

  var dataKarir = <CareerModel>[].obs;
  var isLoadingDataKarir = false.obs;
  var currentPage = 1.obs;
  var lastPage = 0.obs;

  void getSlider(int careerCategoryId) async {
    try {
      isLoadingDataKarir(true);
      final response =
          await provider.getKarir(currentPage.value, careerCategoryId);
      List<CareerModel> fetch =
          careerModelFromJson(jsonEncode(response['data']));
      dataKarir.addAllIf(fetch.isNotEmpty, fetch);
      lastPage(response['meta']['last_page']);
      currentPage++;
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Terjadi kesalahan saat memuat data karir",
          message:
              "dengan pesan kesalahan ${e.toString()} Mohon maaf atas ketidak nyamananya, kami akan terus memperbaiki ini untuk menjadi lebih baik lagi.",
          icon: const Icon(Icons.dangerous),
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      isLoadingDataKarir(false);
    }
  }
}

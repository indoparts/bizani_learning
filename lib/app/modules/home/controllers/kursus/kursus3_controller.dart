import 'dart:convert';
import 'package:bizani_learning/app/models/home_models/kursus_materi_slider_client_model_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../providers/home_provider.dart';

class Kursus3Controller extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());

  var carouselclientKursus = <KursusMateriSliderClientModelThree>[].obs;
  var isLoadingCarouselKursus = false.obs;
  var carouselclientKursusCurrentPage = 1.obs;
  var carouselclientKursusLastPage = 0.obs;

  Future getSliderKursus(int idCategory) async {
    try {
      isLoadingCarouselKursus(true);
      final response = await provider.getKursusMaterial(
          idCategory, carouselclientKursusCurrentPage.value);
      List<KursusMateriSliderClientModelThree> fetch =
          kursusMateriSliderClientModelThreeFromJson(
              jsonEncode(response['data']));
      carouselclientKursus.addAllIf(fetch.isNotEmpty, fetch);
      carouselclientKursusLastPage(response['meta']['last_page']);
      carouselclientKursusCurrentPage++;
      return fetch;
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Terjadi kesalahan saat memuat data kursus",
          message:
              "dengan pesan kesalahan ${e.toString()} Mohon maaf atas ketidak nyamananya, kami akan terus memperbaiki ini untuk menjadi lebih baik lagi.",
          icon: const Icon(Icons.dangerous),
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      isLoadingCarouselKursus(false);
    }
  }
}

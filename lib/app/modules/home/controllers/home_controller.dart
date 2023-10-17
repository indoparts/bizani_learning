import 'package:bizani_learning/app/models/home_models/karir_client_kategori_model.dart';
import 'package:bizani_learning/app/models/home_models/kursus_kategori_client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());
  var survey1 = true.obs;
  var survey2 = true.obs;
  var survey3 = true.obs;

  var listclientKursus = <KursusKategoriClientModel>[].obs;
  var listclientKarir = <KarirClientKategoriModel>[].obs;
  var loading = false.obs;
  void getDataListClientKursus() async {
    try {
      loading(true);
      List<KursusKategoriClientModel> response =
          await provider.getKursusCategory();
      listclientKursus.addAll(response);
      loading(false);
    } catch (e) {
      GetSnackBar(
        title: "Terjadi kesalahan saat memuat data kursus",
        message:
            "dengan pesan kesalahan ${e.toString()} Mohon maaf atas ketidak nyamananya, kami akan terus memperbaiki ini untuk menjadi lebih baik lagi.",
        icon: const Icon(Icons.dangerous),
        duration: const Duration(seconds: 3),
      );
    }
  }

  void getDataListClientKarir() async {
    try {
      loading(true);
      List<KarirClientKategoriModel> response =
          await provider.getKarirCategory();
      listclientKarir.addAll(response);
      loading(false);
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
    }
  }

  void cekSurvey(int idKategoriKursus, int urutan) async {
    try {
      loading(true);
      final request = await provider.cekSurvey(idKategoriKursus);
      survey1(request.body['data']);
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
    }
  }

  void postSurvey(String v, int idKategoriKursus, int urutan) async {
    try {
      final request = await provider.postSurvey(v, idKategoriKursus);
      if (request.statusCode == 200) {
        if (urutan == 1) {
          survey1(false);
        } else if (urutan == 2) {
          survey2(false);
        } else {
          survey3(false);
        }
      } else {
        if (urutan == 1) {
          survey1(true);
        } else if (urutan == 2) {
          survey2(true);
        } else {
          survey3(true);
        }
      }
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
    }
  }
}

import 'package:bizani_learning/app/models/home_models/karir_client_kategori_model.dart';
import 'package:bizani_learning/app/models/home_models/kursus_kategori_client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());
  var surveyKursus1 = true.obs;
  var surveyKursus2 = true.obs;
  var surveyKursus3 = true.obs;

  var surveyKarir1 = true.obs;
  var surveyKarir2 = true.obs;
  var surveyKarir3 = true.obs;

  var listclientKursus = <KursusKategoriClientModel>[].obs;
  var listclientKarir = <KarirClientKategoriModel>[].obs;
  var loading = false.obs;

  void getDataListClientKursus() async {
    try {
      loading(true);
      if (listclientKursus.isEmpty) {
        List<KursusKategoriClientModel> response =
            await provider.getKursusCategory();
        listclientKursus.addAllIf(response.isNotEmpty, response);
      }
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
      if (listclientKarir.isEmpty) {
        List<KarirClientKategoriModel> response =
            await provider.getKarirCategory();
        listclientKarir.addAllIf(response.isNotEmpty, response);
      }
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

  void cekSurveyKursus(int idKategoriKursus, int urutan) async {
    try {
      loading(true);
      final request = await provider.cekSurvey(idKategoriKursus, 'kursus');
      if (urutan == 1) {
        surveyKursus1(request.body['data']);
      } else if (urutan == 2) {
        surveyKursus2(request.body['data']);
      } else if (urutan == 3) {
        surveyKursus3(request.body['data']);
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

  void postSurveyKursus(String v, int idKategoriKursus, int urutan) async {
    try {
      final request = await provider.postSurvey(v, idKategoriKursus, 'kursus');
      if (request.statusCode == 200) {
        if (urutan == 1) {
          surveyKursus1(false);
        } else if (urutan == 2) {
          surveyKursus2(false);
        } else {
          surveyKursus3(false);
        }
      } else {
        if (urutan == 1) {
          surveyKursus1(true);
        } else if (urutan == 2) {
          surveyKursus2(true);
        } else {
          surveyKursus3(true);
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

  void cekSurveyKarir(int idKategoriKursus, int urutan) async {
    try {
      loading(true);
      final request = await provider.cekSurvey(idKategoriKursus, 'karir');
      if (urutan == 1) {
        surveyKarir1(request.body['data']);
      } else if (urutan == 2) {
        surveyKarir2(request.body['data']);
      } else if (urutan == 3) {
        surveyKarir3(request.body['data']);
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

  void postSurveyKarir(String v, int idKategoriKursus, int urutan) async {
    try {
      final request = await provider.postSurvey(v, idKategoriKursus, 'karir');
      if (request.statusCode == 200) {
        if (urutan == 1) {
          surveyKarir1(false);
        } else if (urutan == 2) {
          surveyKarir2(false);
        } else {
          surveyKarir3(false);
        }
      } else {
        if (urutan == 1) {
          surveyKarir1(true);
        } else if (urutan == 2) {
          surveyKarir2(true);
        } else {
          surveyKarir3(true);
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

  Future getCategory() async {
    return await provider.getKursusCategoryAll();
  }
}

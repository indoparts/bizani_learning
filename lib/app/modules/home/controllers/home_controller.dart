import 'package:bizani_learning/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/KarirClientKategoriModel.dart';
import '../providers/KursusKategoriClientModel.dart';
import '../providers/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());
  var survey1 = true.obs;
  var survey2 = true.obs;
  var survey3 = true.obs;

  // ignore: non_constant_identifier_names
  var ListclientKursus = <KursusKategoriClientModel>[].obs;
  var isLoadingListClientKursus = false.obs;
  var ListclientKarir = <KarirClientKategoriModel>[].obs;
  var isLoadingListClientKarir = false.obs;
  void getDataListClientKursus() async {
    try {
      isLoadingListClientKursus(true);
      List<KursusKategoriClientModel> response =
          await provider.getKursusCategory();
      ListclientKursus.addAll(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingListClientKursus(false);
    }
  }

  void getDataListClientKarir() async {
    try {
      isLoadingListClientKarir(true);
      List<KarirClientKategoriModel> response =
          await provider.getKarirCategory();
      ListclientKarir.addAll(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingListClientKarir(false);
    }
  }

  void cekSurvey(int idKategoriKursus, int urutan) async {
    try {
      final request = await provider.cekSurvey(idKategoriKursus);
      survey1(request.body['data']);
    } catch (e) {
      Get.snackbar(
        'Terjadi kesalahan!',
        "Mohon maaf atas ketidak nyamananya, kami akan terus memperbaiki ini untuk menjadi lebih baik lagi.",
        colorText: bgColor,
        backgroundColor: dangerColor,
        icon: const Icon(
          Icons.info,
          color: bgColor,
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
      Get.snackbar(
        'Terjadi kesalahan!',
        "Mohon maaf atas ketidak nyamananya, kami akan terus memperbaiki ini untuk menjadi lebih baik lagi.",
        colorText: bgColor,
        backgroundColor: dangerColor,
        icon: const Icon(
          Icons.info,
          color: bgColor,
        ),
      );
    }
  }
}

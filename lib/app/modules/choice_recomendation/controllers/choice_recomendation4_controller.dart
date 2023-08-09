import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../../constant.dart";
import "../CousesCategoryModel.dart";
import '../providers/choice_providers.dart';

class ChoiceRecomendation4Controller extends GetxController {
  ChoiceProviders provider = Get.put(ChoiceProviders());
  List picker = <int>[].obs;
  var isCheckedGoals = 0.obs;
  var loadingData = false.obs;
  var loadingForm = false.obs;
  var dataKlasifikasi = <CousesCategoryModel>[].obs;

  void getData() async {
    try {
      loadingData(true);
      List<CousesCategoryModel> response =
          await provider.getSubCategoryCourses();
      dataKlasifikasi.addAll(response);
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loadingData(false);
    }
  }

  void setChecked(int value) async {
    if (picker.length == 9) {
      picker.removeAt(0);
      picker.add(value);
    } else {
      picker.add(value);
    }
  }

  bool cekInArray(int value) {
    if (picker.contains(value)) {
      return true;
    } else {
      return false;
    }
  }

  void setSubCategoryCousesAct() async {
    loadingForm(true);
    try {
      loadingForm(true);
      if (picker.length >= 3) {
        var dataPost = jsonEncode({'learning_subcategory_id': picker});
        final response = await provider.postcorsesSubcategory(dataPost);
        if (response.statusCode == 200) {
          Get.toNamed("/choice-recomendation5");
        }
      } else {
        Get.snackbar(
          'Perhatikan!',
          "Jumlah subkategori yang anda pilih saat ini adalah ${picker.length}, dan anda wajib memilih 3 subkategori kursus yang anda minati.",
          colorText: Colors.white,
          backgroundColor: dagerColor,
          icon: const Icon(
            Icons.info,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loadingForm(false);
    }
  }
}

import "dart:convert";

import "package:bizani_learning/app/models/choice_reccomendation_model/couses_category_model.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../../constant.dart";
import '../providers/choice_providers.dart';

class ChoiceRecomendation3Controller extends GetxController {
  ChoiceProviders provider = Get.put(ChoiceProviders());
  var loadingData = false.obs;
  var loadingForm = false.obs;
  final int _limit = 15;
  int _page = 1;
  List picker = <int>[].obs;
  var hasMore = true.obs;
  var dataKlasifikasi = <CousesCategoryModel>[].obs;

  void setChecked(int value) {
    if (picker.length == 3) {
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

  void getData() async {
    try {
      loadingData(true);
      List<CousesCategoryModel> response =
          await provider.getCoursesCategory(_page, _limit);
      if (response.length < _limit) {
        hasMore.value = false;
      }
      dataKlasifikasi.addAll(response);
      _page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      loadingData(false);
    }
  }

  void refreshData() async {
    _page = 1;
    hasMore.value = true;
    dataKlasifikasi.value = [];

    getData();
  }

  void setCousesCataegoryAct() async {
    try {
      loadingForm(true);
      if (picker.length == 3) {
        var dataPost = jsonEncode({'learning_category_id': picker});
        final response = await provider.postcorsesCategory(dataPost);
        if (response.statusCode == 200) {
          Get.toNamed("/choice-recomendation4");
        }
      } else {
        Get.snackbar(
          'Perhatikan!',
          "Jumlah kategori yang anda pilih saat ini adalah ${picker.length}, dan anda wajib memilih 3 kategori kursus yang anda minati.",
          colorText: Colors.white,
          backgroundColor: dangerColor,
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

import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../../../constant.dart";
import "../CareerCategoryModel.dart";
import '../providers/choice_providers.dart';

class ChoiceRecomendation2Controller extends GetxController {
  ChoiceProviders provider = Get.put(ChoiceProviders());
  var loadingData = false.obs;
  var loadingForm = false.obs;
  final int _limit = 15;
  int _page = 1;
  List picker = <int>[].obs;
  var hasMore = true.obs;
  var dataKlasifikasi = <CareerCategoryModel>[].obs;

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

  Future getData() async {
    try {
      loadingData(true);
      List<CareerCategoryModel> response =
          await provider.getCareerCategory(_page, _limit);
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

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    dataKlasifikasi.value = [];

    await getData();
  }

  void setCareerCataegoryAct() async {
    try {
      loadingForm(true);
      if (picker.length == 3) {
        var dataPost = jsonEncode({'career_category_id': picker});
        final response = await provider.postCareerCategory(dataPost);
        if (response.statusCode == 200) {
          Get.toNamed("/choice-recomendation3");
        }
      } else {
        Get.snackbar(
          'Perhatikan!',
          "Jumlah kategori yang anda pilih saat ini adalah ${picker.length}, dan anda wajib memilih 3 kategori karir yang anda minati.",
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

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../providers/CareerModel.dart';
import '../../providers/home_provider.dart';

class Karir2Controller extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());

  var dataKarir = <CareerModel>[].obs;
  var isLoadingDataKarir = false.obs;
  var currentPage = 1.obs;
  var lastPage = 0.obs;

  void getSlider(int career_category_id) async {
    try {
      isLoadingDataKarir(true);
      final response =
          await provider.getKarir(currentPage.value, career_category_id);
      List<CareerModel> fetch =
          careerModelFromJson(jsonEncode(response['data']));
      dataKarir.addAllIf(fetch.isNotEmpty, fetch);
      lastPage(response['meta']['last_page']);
      currentPage++;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingDataKarir(false);
    }
  }
}

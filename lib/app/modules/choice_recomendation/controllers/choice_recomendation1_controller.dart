import "dart:convert";

import "package:flutter/foundation.dart";
import "package:get/get.dart";
import '../providers/choice_providers.dart';

class ChoiceRecomendation1Controller extends GetxController {
  ChoiceProviders provider = Get.put(ChoiceProviders());
  final goalsData = [].obs;
  var isCheckedGoals = 0.obs;
  var isLoadingDataGoals = false.obs;
  var isLoadingPostGoals = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDataGoals();
  }

  void getDataGoals() async {
    try {
      isLoadingDataGoals(true);
      final response = await provider.getGoals();
      List<String> fetch = List<String>.from(response['data']);
      goalsData.addAll(fetch);
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoadingDataGoals(false);
    }
  }

  void setGoalsChecked(int value) async {
    isCheckedGoals(value);
  }

  void setGoalsAct() async {
    try {
      isLoadingPostGoals(true);
      var dataPost = jsonEncode({'goals': goalsData[isCheckedGoals.value]});
      final response = await provider.postGoals(dataPost);
      if (response.statusCode == 200) {
        Get.toNamed("/choice-recomendation2");
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoadingPostGoals(false);
    }
  }
}

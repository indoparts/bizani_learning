import "dart:convert";

import "package:flutter/foundation.dart";
import "package:get/get.dart";
import '../providers/choice_providers.dart';

class ChoiceRecomendation5Controller extends GetxController {
  ChoiceProviders provider = Get.put(ChoiceProviders());
  final stagesData = [].obs;
  var isChecked = 0.obs;
  var isLoadingData = false.obs;
  var isLoadingPost = false.obs;

  Future getData() async {
    try {
      isLoadingData(true);
      final response = await provider.getStages();
      List<String> fetch = List<String>.from(response['data']);
      stagesData.addAll(fetch);
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoadingData(false);
    }
  }

  void setChecked(int value) async {
    isChecked(value);
  }

  void setStagesAct() async {
    try {
      isLoadingPost(true);
      var dataPost = jsonEncode({'stages': stagesData[isChecked.value]});
      final response = await provider.poststages(dataPost);
      if (response.statusCode == 200) {
        Get.toNamed("/home");
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoadingPost(false);
    }
  }
}

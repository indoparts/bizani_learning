import "dart:convert";

import "package:bizani_learning/constant.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import '../../../models/choice_reccomendation_model/stages_model.dart';
import '../providers/choice_providers.dart';

class ChoiceRecomendation5Controller extends GetxController {
  ChoiceProviders provider = Get.put(ChoiceProviders());
  final stagesData = <StagesModel>[].obs;
  var isChecked = 0.obs;
  var isLoadingData = false.obs;
  var isLoadingPost = false.obs;

  void getData() async {
    try {
      isLoadingData(true);
      List<StagesModel> fetch = await provider.getStages();
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
      var dataPost = jsonEncode({'stages': stagesData[isChecked.value].txt});
      final response = await provider.poststages(dataPost);
      if (response.statusCode == 200) {
        Get.toNamed("/home");
      } else {
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
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoadingPost(false);
    }
  }
}

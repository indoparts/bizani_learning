import 'dart:convert';

import 'package:bizani_learning/app/models/skills_career_model.dart';
import 'package:bizani_learning/app/modules/Explore/providers/career_explore_provider.dart';
import 'package:get/get.dart';

class ExploreCareerInfoControllerController extends GetxController {
  dynamic idCareerSubCategory = Get.arguments;
  CareerExploreProvider provider = Get.put(CareerExploreProvider());

  var icon = "".obs;
  var coverImg = "".obs;
  var name = "".obs;
  var slug = "".obs;
  var description = "".obs;
  var loading = false.obs;

  final skillsData = <SkillsCareerModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getCareerInfo();
  }

  void getCareerInfo() async {
    loading(true);
    final req = await provider.getShow(idCareerSubCategory);
    icon(req['icon']);
    coverImg(req['cover_img']);
    name(req['name']);
    slug(req['slug']);
    description(req['description']);
    List<SkillsCareerModel> fetchSkills = (req['skill'] as List)
        .map((data) => SkillsCareerModel.fromJson(data))
        .toList();
    skillsData.addAll(fetchSkills);
    loading(false);
  }
}

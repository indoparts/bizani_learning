import 'package:bizani_learning/app/models/average_salary_career_model.dart';
import 'package:bizani_learning/app/models/career_courses_model.dart';
import 'package:bizani_learning/app/models/career_holland_code_model.dart';
import 'package:bizani_learning/app/models/career_related_model.dart';
import 'package:bizani_learning/app/models/career_sub_category_info_model.dart';
import 'package:bizani_learning/app/models/skills_career_model.dart';
import 'package:bizani_learning/app/modules/Explore/providers/career_explore_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ExploreCareerInfoControllerController extends GetxController {
  dynamic idCareerSubCategory = Get.arguments;
  CareerExploreProvider provider = Get.put(CareerExploreProvider());

  var icon = "".obs;
  var coverImg = "".obs;
  var name = "".obs;
  var slug = "".obs;
  var description = "".obs;
  var careerCategoryId = 0.obs;
  var loading = false.obs;

  var showRateInterested = false.obs;

  final infoData = <CareerSubCategoryInfoModel>[].obs;
  final skillsData = <SkillsCareerModel>[].obs;
  final salaryData = <AverageSalaryCareerModel>[].obs;
  final hollandCodeData = <CareerHollandCodeModel>[].obs;

  var careerKursus = <CareerCoursesModel>[].obs;
  var isLoadingCareerKursus = false.obs;
  var careerKursusCurrentPage = 1.obs;

  var careerRelated = <CareerRelatedModel>[].obs;
  var isLoadingCareerRelated = false.obs;
  var careerRelatedCurrentPage = 1.obs;
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
    careerCategoryId(req['career_category_id']);
    description(req['description']);
    List<SkillsCareerModel> fetchSkills = (req['skill'] as List)
        .map((data) => SkillsCareerModel.fromJson(data))
        .toList();
    skillsData.addAll(fetchSkills);
    List<AverageSalaryCareerModel> fetchSalary = (req['salary'] as List)
        .map((data) => AverageSalaryCareerModel.fromJson(data))
        .toList();
    salaryData.addAll(fetchSalary);
    List<CareerSubCategoryInfoModel> fetchInfo = (req['info'] as List)
        .map((data) => CareerSubCategoryInfoModel.fromJson(data))
        .toList();
    infoData.addAll(fetchInfo);
    List<CareerHollandCodeModel> fetchHollandCode = (req['hollandCode'] as List)
        .map((data) => CareerHollandCodeModel.fromJson(data))
        .toList();
    hollandCodeData.addAll(fetchHollandCode);
    getCareerRelated();
    loading(false);
  }

  void getCareerKursus() async {
    try {
      isLoadingCareerKursus(true);
      final response = await provider.getKursusRelateCareerInfo(
          idCareerSubCategory, careerKursusCurrentPage.value, 10);
      careerKursus.addAllIf(response.isNotEmpty, response);
      careerKursusCurrentPage++;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingCareerKursus(false);
    }
  }

  void getCareerInterestedCek() async {
    try {
      loading(true);
      final response =
          await provider.getCekCareerInterestedClient(idCareerSubCategory);
      showRateInterested(response == 'true' ? true : false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      loading(false);
    }
  }

  void postCareerInterested(int value) async {
    try {
      loading(true);
      final response =
          await provider.setCareerInterestedClient(idCareerSubCategory, value);
      if (response.statusCode == 200) {
        showRateInterested(false);
      } else {
        showRateInterested(true);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      loading(false);
    }
  }

  void getCareerRelated() async {
    try {
      isLoadingCareerRelated(true);
      final response = await provider.getRelateCareerInfo(
          careerCategoryId.value, careerRelatedCurrentPage.value, 10);
      careerRelated.addAllIf(response.isNotEmpty, response);
      careerRelatedCurrentPage++;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingCareerRelated(false);
    }
  }
}

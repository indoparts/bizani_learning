import 'package:bizani_learning/app/models/choice_reccomendation_model/career_category_model.dart';
import 'package:bizani_learning/app/models/choice_reccomendation_model/couses_category_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant.dart';
import '../../../models/choice_reccomendation_model/stages_model.dart';

class ChoiceProviders extends GetConnect {
  @override
  void onInit() {
    final ls = GetStorage();
    final lsdata = ls.read("auth") as Map<String, dynamic>;
    final token = lsdata['token'];
    httpClient.baseUrl = baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.addRequestModifier<dynamic>((request) async {
      request.headers["Authorization"] = "Bearer $token";
      return request;
    });
  }

  Future getGoals() async {
    final response =
        await get('/client-classification/option-goals-classification');
    return response.body;
  }

  Future<List<StagesModel>> getStages() async {
    final response =
        await get('/client-classification/option-stages-classification');
    final data = response.body;
    return List<StagesModel>.from(
        data['data'].map((e) => StagesModel.fromJson(e)));
  }

  Future<List<CareerCategoryModel>> getCareerCategory(
      int page, int limit) async {
    final response = await get(
        "/client-classification/option-list-career-category-classification?page=$page&limit=$limit");
    final data = response.body;
    return List<CareerCategoryModel>.from(
        data['data']['data'].map((e) => CareerCategoryModel.fromJson(e)));
  }

  Future<List<CousesCategoryModel>> getCoursesCategory(
      int page, int limit) async {
    final response = await get(
        "/client-classification/option-list-learning-category-classification?page=$page&limit=$limit");
    final data = response.body;
    return List<CousesCategoryModel>.from(
        data['data']['data'].map((e) => CousesCategoryModel.fromJson(e)));
  }

  Future<List<CousesCategoryModel>> getSubCategoryCourses() async {
    final response = await get(
        "/client-classification/option-list-learning-subcategory-classification");
    final data = response.body;
    return List<CousesCategoryModel>.from(
        data['data'].map((e) => CousesCategoryModel.fromJson(e)));
  }

  Future postGoals(formData) async {
    String url = '/client-classification/set-client-goals';
    var res = await post(url, formData);
    return res;
  }

  Future postCareerCategory(formData) async {
    String url = '/client-classification/set-client-career-category';
    var res = await post(url, formData);
    return res;
  }

  Future postcorsesCategory(formData) async {
    String url = '/client-classification/set-client-learning-category';
    var res = await post(url, formData);
    return res;
  }

  Future postcorsesSubcategory(formData) async {
    String url = '/client-classification/set-client-learning-subcategory';
    var res = await post(url, formData);
    return res;
  }

  Future poststages(formData) async {
    String url = '/client-classification/set-client-career-stages';
    var res = await post(url, formData);
    return res;
  }
}

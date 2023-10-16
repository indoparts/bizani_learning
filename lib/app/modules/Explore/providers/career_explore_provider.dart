import 'dart:convert';

import 'package:bizani_learning/app/models/career_courses_model.dart';
import 'package:bizani_learning/app/models/career_related_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant.dart';

class CareerExploreProvider extends GetConnect {
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

  Future getShow(int idCareerSubCategory) async {
    final response = await get("/career-subcategory/show/$idCareerSubCategory");
    final data = response.body['data'];
    return data;
  }

  Future<List<CareerCoursesModel>> getKursusRelateCareerInfo(
      int careerSubcategoryId, int page, int limit) async {
    final response = await get(
        "/career-subcategory/courses/$careerSubcategoryId?page=$page&limit=$limit");
    final data = response.body['data']['data'];
    return List<CareerCoursesModel>.from(
        data.map((e) => CareerCoursesModel.fromJson(e)));
  }

  Future getCekCareerInterestedClient(int idCareerSubCategory) async {
    final response = await get(
        "/career-subcategory/interested-career-client-check/$idCareerSubCategory");
    final data = response.body['data'];
    return data;
  }

  Future setCareerInterestedClient(int idCareerSubCategory, int value) async {
    final response = await put(
        "/career-subcategory/interested-career-client/$idCareerSubCategory",
        jsonEncode({'value': value}));
    return response;
  }

  Future<List<CareerRelatedModel>> getRelateCareerInfo(
      int careerCategoryId, int page, int limit) async {
    final response = await get(
        "/career-subcategory/career-related/$careerCategoryId?page=$page&limit=$limit");
    final data = response.body['data']['data'];
    return List<CareerRelatedModel>.from(
        data.map((e) => CareerRelatedModel.fromJson(e)));
  }
}

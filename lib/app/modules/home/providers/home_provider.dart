import 'dart:convert';

import 'package:bizani_learning/app/models/home_models/karir_client_kategori_model.dart';
import 'package:bizani_learning/app/models/home_models/kursus_kategori_client_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant.dart';

class HomeProvider extends GetConnect {
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

  Future<List<KursusKategoriClientModel>> getKursusCategory() async {
    final response = await get("/learning-material/index");
    final data = response.body['data'];
    return List<KursusKategoriClientModel>.from(
        data.map((e) => KursusKategoriClientModel.fromJson(e)));
  }

  Future<List<KarirClientKategoriModel>> getKarirCategory() async {
    final response = await get("/career-subcategory/list");
    final data = response.body['data'];
    return List<KarirClientKategoriModel>.from(
        data.map((e) => KarirClientKategoriModel.fromJson(e)));
  }

  Future getKursusMaterial(int id, int page) async {
    final response =
        await get("/learning-material/show/$id?param=slider&page=$page");
    final data = response.body['data'];
    return data;
  }

  Future getKarir(int page, int careerCategoryId) async {
    final response = await get(
        "/career-subcategory/index?page=$page&limit=5&career_category_id=$careerCategoryId");
    final data = response.body['data'];
    return data;
  }

  Future cekSurvey(int idKategoriKursus, String type) async {
    final response = await get(
        "/client-classification/set-client-learning-satisfaction/$idKategoriKursus/$type");
    return response;
  }

  Future postSurvey(String v, int idKategoriKursus, String type) async {
    var datapost =
        jsonEncode({'input': v, 'learning_category_id': idKategoriKursus});
    final response = await post(
        "/client-classification/set-client-learning-satisfaction/$type",
        datapost);
    return response;
  }

  Future getKursusCategoryAll() async {
    final response = await get("/learning-category/index");
    return response;
  }
}

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
}

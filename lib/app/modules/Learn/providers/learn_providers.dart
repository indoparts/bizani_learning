import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant.dart';

class LearnProviders extends GetConnect {
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

  Future getMateri(int idMateri) async {
    final response = await get('/learning-material/show/$idMateri');
    return response.body;
  }

  Future getContent(int idContent) async {
    final response = await get('/learning-material/content/$idContent');
    return response.body;
  }

  Future getContentWithPage(int idContent, int page) async {
    final response =
        await get('/learning-material/content/$idContent?page=$page');
    return response.body;
  }
}

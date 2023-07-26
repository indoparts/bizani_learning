import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant.dart';

class LoginProvider extends GetConnect {
  final ls = GetStorage();
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseUrl;
    httpClient.defaultContentType = "application/json";
  }

  Future postLogin(loginData) async {
    String url = '/auth/login';
    var res = await post(url, loginData);
    return res;
  }

  Future postLogout() async {
    final lsdata = ls.read("auth") as Map<String, dynamic>;
    final token = lsdata['token'];
    Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    String url = '/auth/logout';
    var res = await post(url, null, headers: requestHeaders);
    return res;
  }

  Future getCekClient() async {
    final lsdata = ls.read("auth") as Map<String, dynamic>;
    final token = lsdata['token'];
    Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    String url = '/client-agreement/cek-client';
    var res = await get(url,
        contentType: "application/json", headers: requestHeaders);
    return res;
  }

  Future getProfile() async {
    final lsdata = ls.read("auth") as Map<String, dynamic>;
    final token = lsdata['token'];
    Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    String url = '/auth/profile';
    var res = await get(url,
        contentType: "application/json", headers: requestHeaders);
    return res;
  }
}

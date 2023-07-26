import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../constant.dart';
import '../agreement_model.dart';

class AgreementProvider extends GetConnect {
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

  Future getCekClient() async {
    return await get('/client-agreement/cek-client');
  }

  Future<List<Agreement>> getData() async {
    final response = await get('/client-agreement/list-agreement');
    final data = response.body['data'];
    return List<Agreement>.from(data.map((e) => Agreement.fromJson(e)));
  }

  Future putData(int clientid) async {
    return await put('/client-agreement/client-agreement/$clientid', null);
  }
}

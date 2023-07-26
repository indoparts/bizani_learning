import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../agreement_model.dart';
import '../providers/agreement_provider.dart';

class TermconditionController extends GetxController {
  final ls = GetStorage();
  AgreementProvider provider = Get.put(AgreementProvider());
  var isLoading = false.obs;
  var isLoadingBTn = false.obs;
  final disabled = true.obs;
  final setuju1 = false.obs;
  final setuju2 = false.obs;
  var data = <Agreement>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDataAgreement();
    getCekClientAgreement();
  }

  Future getCekClientAgreement() async {
    try {
      isLoading(true);
      final response = await provider.getCekClient();
      data.addAll(response);
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future getDataAgreement() async {
    try {
      isLoading(true);
      List<Agreement> response = await provider.getData();
      data.addAll(response);
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void postDataAgreement() async {
    try {
      isLoadingBTn(true);
      final lsdata = ls.read("client") as Map<String, dynamic>;
      final response = await provider.putData(lsdata["id"]);
      if (response.statusCode == 200) {
        Get.toNamed('/recomended');
      }
    } catch (e) {
      if (kDebugMode) print(e.toString());
    } finally {
      isLoadingBTn(false);
    }
  }
}

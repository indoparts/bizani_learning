import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final ls = GetStorage();
  var username = ''.obs;
  @override
  void onInit() {
    super.onInit();
    final lsdata = ls.read("client") as Map<String, dynamic>;
    username(lsdata['fullname']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

import 'package:get/get.dart';

class ExploreCareerController extends GetxController {
  List items = ['Alfabet (Desc)', 'Alfabet (Asc)', 'Gaji (Desc)', 'Gaji (Asc)'];
  final selected = "Filter dan sesuaikan".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelected(String value) {
    selected.value = value;
  }
}

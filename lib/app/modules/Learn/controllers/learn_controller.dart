import 'package:get/get.dart';

class LearnController extends GetxController {
  List list = ['abc', 'def', 'ghi'];
  final selected = ''.obs;
  @override
  void onInit() {
    selected(list[0]);
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
    selected(value);
  }
}

import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) async {
    pageIndex(i);
    switch (i) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/explore');
        break;
      case 2:
        Get.toNamed('/learn');
        break;
      case 3:
        Get.toNamed('/dashboard');
        break;
      case 4:
        Get.toNamed('/certificate');
        break;
    }
  }
}

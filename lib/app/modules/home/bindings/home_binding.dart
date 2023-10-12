import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/karir/karir1_controller.dart';
import '../controllers/karir/karir2_controller.dart';
import '../controllers/karir/karir3_controller.dart';
import '../controllers/kursus/kursus1_controller.dart';
import '../controllers/kursus/kursus2_controller.dart';
import '../controllers/kursus/kursus3_controller.dart';
import '../providers/home_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<Kursus1Controller>(
      () => Kursus1Controller(),
    );
    Get.lazyPut<Kursus2Controller>(
      () => Kursus2Controller(),
    );
    Get.lazyPut<Kursus3Controller>(
      () => Kursus3Controller(),
    );
    Get.lazyPut<Karir1Controller>(
      () => Karir1Controller(),
    );
    Get.lazyPut<Karir2Controller>(
      () => Karir2Controller(),
    );
    Get.lazyPut<Karir3Controller>(
      () => Karir3Controller(),
    );
    Get.lazyPut<HomeProvider>(
      () => HomeProvider(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/recomended_controller.dart';

class RecomendedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecomendedController>(
      () => RecomendedController(),
    );
  }
}

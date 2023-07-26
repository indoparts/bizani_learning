import 'package:get/get.dart';

import '../controllers/introduction2_controller.dart';

class Introduction2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Introduction2Controller>(
      () => Introduction2Controller(),
    );
  }
}

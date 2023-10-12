import 'package:get/get.dart';

import '../controllers/learn_controller.dart';
import '../providers/learn_providers.dart';

class LearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnController>(
      () => LearnController(),
    );
    Get.lazyPut<LearnProviders>(
      () => LearnProviders(),
    );
  }
}

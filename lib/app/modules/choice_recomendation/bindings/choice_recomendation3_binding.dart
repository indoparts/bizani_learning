import 'package:get/get.dart';

import '../controllers/choice_recomendation3_controller.dart';
import '../providers/choice_providers.dart';

class ChoiceRecomendation3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoiceRecomendation3Controller>(
      () => ChoiceRecomendation3Controller(),
    );
    Get.lazyPut<ChoiceProviders>(
      () => ChoiceProviders(),
    );
  }
}

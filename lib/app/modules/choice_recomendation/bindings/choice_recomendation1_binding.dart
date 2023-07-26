import 'package:get/get.dart';

import '../controllers/choice_recomendation1_controller.dart';
import '../providers/choice_providers.dart';

class ChoiceRecomendation1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoiceRecomendation1Controller>(
      () => ChoiceRecomendation1Controller(),
    );
    Get.lazyPut<ChoiceProviders>(
      () => ChoiceProviders(),
    );
  }
}

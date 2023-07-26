import 'package:get/get.dart';

import '../controllers/choice_recomendation4_controller.dart';
import '../providers/choice_providers.dart';

class ChoiceRecomendation4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoiceRecomendation4Controller>(
      () => ChoiceRecomendation4Controller(),
    );
    Get.lazyPut<ChoiceProviders>(
      () => ChoiceProviders(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/choice_recomendation5_controller.dart';
import '../providers/choice_providers.dart';

class ChoiceRecomendation5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoiceRecomendation5Controller>(
      () => ChoiceRecomendation5Controller(),
    );
    Get.lazyPut<ChoiceProviders>(
      () => ChoiceProviders(),
    );
  }
}

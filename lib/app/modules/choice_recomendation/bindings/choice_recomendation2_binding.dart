import 'package:get/get.dart';
import '../controllers/choice_recomendation2_controller.dart';
import '../providers/choice_providers.dart';

class ChoiceRecomendation2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoiceRecomendation2Controller>(
      () => ChoiceRecomendation2Controller(),
    );
    Get.lazyPut<ChoiceProviders>(
      () => ChoiceProviders(),
    );
  }
}

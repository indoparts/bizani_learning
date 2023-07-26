import 'package:get/get.dart';

import '../controllers/termcondition_controller.dart';
import '../providers/agreement_provider.dart';

class TermconditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermconditionController>(
      () => TermconditionController(),
    );
    Get.lazyPut<AgreementProvider>(
      () => AgreementProvider(),
    );
  }
}

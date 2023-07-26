import 'package:get/get.dart';

import '../controllers/explore_controller.dart';
import '../controllers/explorecareer_controller.dart';
import '../controllers/explorecourses_controller.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );
  }
}

class ExploreCareerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreCareerController>(
      () => ExploreCareerController(),
    );
  }
}

class ExploreCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreCoursesController>(
      () => ExploreCoursesController(),
    );
  }
}

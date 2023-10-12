import 'package:bizani_learning/app/modules/Explore/providers/career_explore_provider.dart';
import 'package:get/get.dart';

import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';

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

class ExploreCareerInfo extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreCareerInfoControllerController>(
      () => ExploreCareerInfoControllerController(),
    );
    Get.lazyPut<CareerExploreProvider>(() => CareerExploreProvider());
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

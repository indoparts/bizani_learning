import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:bizani_learning/app/components/globalWidget/Text.dart';
import 'package:bizani_learning/app/components/globalWidget/searchInput.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/explorecourses_controller.dart';

// ignore: must_be_immutable
class CoursesDetailView extends GetView {
  ExploreCoursesController controller = Get.put(ExploreCoursesController());
  final double paddingSize = 20;
  CoursesDetailView({super.key});
  final carouselController = PageController(viewportFraction: 0.4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorscreenPrimary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SearchInput(
                label: 'Cari untuk subjek atau karir',
                controller: controller.search,
              ),
            ),
            const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextApps(
                  size: 11,
                  stylefont: FontWeight.bold,
                  text: 'Sub Kategori Pelajaran & Akademis',
                  align: TextAlign.center,
                )),
            ExpandablePageView.builder(
              clipBehavior: Clip.none,
              controller: carouselController,
              itemCount: 5,
              itemBuilder: (_, index) => Card(
                
              )
            ),
          ],
        ),
      )),
    );
  }
}

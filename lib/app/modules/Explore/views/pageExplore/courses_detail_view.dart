import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:bizani_learning/app/components/globalWidget/text_apps.dart';
import 'package:bizani_learning/app/components/globalWidget/search_input.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/explorecourses_controller.dart';

// ignore: must_be_immutable
class CoursesDetailView extends GetView {
  @override
  ExploreCoursesController controller = Get.put(ExploreCoursesController());
  final double paddingSize = 20;
  CoursesDetailView({super.key});
  final carouselController = PageController(viewportFraction: 0.4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorscreenPrimary,
      body: SafeArea(
          child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SearchInput(
                  label: 'Cari untuk subjek atau karir',
                  controller: controller.search,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextApps(
                    size: 11,
                    stylefont: FontWeight.bold,
                    text: 'Sub Kategori Pelajaran & Akademis',
                    align: TextAlign.center,
                  )),
              ExpandablePageView.builder(
                  clipBehavior: Clip.none,
                  controller: carouselController,
                  itemCount: 50,
                  itemBuilder: (_, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Center(
                            child: Text('Text $index'),
                          ),
                        ),
                      )),
            ],
          ),
          ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: TextApps(
                    text: 'text title $index',
                    align: TextAlign.start,
                    size: 10,
                    stylefont: FontWeight.bold),
                subtitle: TextApps(
                    text: 'text subtitle $index',
                    size: 9,
                    stylefont: FontWeight.normal,
                    align: TextAlign.start),
              ),
            ),
          )
        ],
      )),
    );
  }
}

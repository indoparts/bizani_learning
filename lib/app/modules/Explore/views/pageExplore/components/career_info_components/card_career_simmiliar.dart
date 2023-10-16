import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/app/routes/app_pages.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardCarrerSimmiliar
    extends GetView<ExploreCareerInfoControllerController> {
  const CardCarrerSimmiliar({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController control =
        PageController(initialPage: 1, viewportFraction: 0.6);
    controller.getCareerRelated();
    return Obx(() {
      if (controller.isLoadingCareerRelated.isTrue) {
        return Center(
          child: SizedBox(
              height: 1.h,
              width: 2.w,
              child: const CircularProgressIndicator(
                color: primaryColor,
              )),
        );
      } else {
        if (controller.careerRelated.isNotEmpty) {
          return SizedBox(
            height: 12.h,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: bgColorscreenPrimary),
              child: PageView.builder(
                controller: control,
                itemCount: controller.careerRelated.length,
                onPageChanged: (i) {
                  if (i > controller.careerRelated.length) {
                    controller.getCareerRelated();
                  }
                },
                itemBuilder: (context, index) {
                  return CardRelatedCareer(
                    cover: controller.careerRelated[index].coverImg,
                    id: controller.careerRelated[index].id,
                    title: controller.careerRelated[index].name,
                  );
                },
              ),
            ),
          );
        } else {
          return const Text('Tidak ada data terkait.');
        }
      }
    });
  }
}

class CardRelatedCareer extends StatelessWidget {
  final String cover;
  final String title;
  final int id;
  const CardRelatedCareer(
      {Key? key, required this.cover, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.offAllNamed(Routes.EXPLORECAREER_INFO, arguments: id),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '$baseUrlImg/sub-category-career&cover_img/$cover',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          )),
    );
  }
}

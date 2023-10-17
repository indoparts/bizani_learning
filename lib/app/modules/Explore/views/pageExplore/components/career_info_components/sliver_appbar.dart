import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/app/routes/app_pages.dart';
import 'package:bizani_learning/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SliverAppbar extends StatelessWidget {
  SliverAppbar({super.key});
  final state = Get.find<ExploreCareerInfoControllerController>();
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        elevation: 0,
        backgroundColor: bgColor,
        expandedHeight: 30.h,
        floating: false,
        pinned: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: bgColor,
            radius: 10,
            child: IconButton(
                splashRadius: 10,
                onPressed: () => Get.offAllNamed(Routes.home),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
        ),
        flexibleSpace: LayoutBuilder(builder: (context, constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
              centerTitle: true,
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: 1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Obx(() => Text(state.name.value,
                          style: TextStyle(
                              color: top < 80.74 ? Colors.black : bgColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
              ),
              background: Obx(() {
                if (state.loading.isFalse) {
                  if (state.coverImg.value != '') {
                    return CachedNetworkImage(
                      imageUrl:
                          '$baseUrlImg/sub-category-career&cover_img/${state.coverImg.value}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                        child: Container(
                          color: const Color.fromARGB(204, 36, 36, 36),
                        ),
                      ),
                      placeholder: (context, url) => const LoadingProccess(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  } else {
                    return Center(
                        child: SizedBox(
                            height: 1.h,
                            width: 2.w,
                            child: const Text('Tidak ada sampul gambar!')));
                  }
                } else {
                  return const LoadingProccess();
                }
              }));
        }));
  }
}

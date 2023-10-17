import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardHollandCodes extends StatelessWidget {
  const CardHollandCodes({super.key});
  @override
  Widget build(BuildContext context) {
    final state = Get.find<ExploreCareerInfoControllerController>();
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        Text(
          'Orang-orang dalam karir ini umumnya memiliki jalur berikut.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 3.h,
        ),
        Obx(() {
          if (state.loading.isTrue) {
            return const LoadingProccess();
          } else {
            if (state.hollandCodeData.isNotEmpty) {
              return Container(
                color: bgColorscreenPrimary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            childAspectRatio: 8 / 2),
                    itemCount: state.hollandCodeData.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: primaryColor,
                          child: Text(state.hollandCodeData[index].initial),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          state.hollandCodeData[index].desc,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Tidak ada data terkait.'),
              );
            }
          }
        })
      ],
    );
  }
}

import 'package:bizani_learning/app/components/globalWidget/loading_view.dart';
import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:intl/intl.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardAverageAnualSalary extends StatelessWidget {
  const CardAverageAnualSalary({super.key});
  @override
  Widget build(BuildContext context) {
    final state = Get.find<ExploreCareerInfoControllerController>();
    NumberFormat rp = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Text(
                  'Gaji tahunan rata-rata',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 2.w,
                ),
                const Icon(Icons.info_rounded)
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Obx(() {
              if (state.loading.isFalse) {
                if (state.salaryData.isNotEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var item in state.salaryData)
                        Row(
                          children: [
                            Text(
                              rp.format(
                                  double.parse(item.countryAmountCurrency)),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              height: 5.h,
                              width: 5.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '$baseUrlImg/subcategory-career-salary/${item.countryFlagImg}'),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        )
                    ],
                  );
                } else {
                  return const Center(
                      child: Text(
                          'Tidak ada data tentang pendapatan pada karir ini!'));
                }
              } else {
                return const LoadingProccess();
              }
            })
          ],
        ),
      ),
    );
  }
}

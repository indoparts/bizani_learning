import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'components/career_info_components/card_accordion.dart';
import 'components/career_info_components/card_career_simmiliar.dart';
import 'components/career_info_components/card_holland_code.dart';
import 'components/career_info_components/card_rate_interested_career.dart';
import 'components/career_info_components/slider_kursus_referensi_karir.dart';
import 'components/career_info_components/card_average_anual_salary.dart';
import 'components/career_info_components/slider_skills.dart';
import 'components/career_info_components/sliver_appbar.dart';

// ignore: must_be_immutable
class CreerInfoView extends GetView<ExploreCareerInfoControllerController> {
  CreerInfoView({Key? key}) : super(key: key);
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    final state = Get.find<ExploreCareerInfoControllerController>();
    state.getCareerInterestedCek();
    return Scaffold(
        backgroundColor: bgColor,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[SliverAppbar()];
            },
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(() => Text(
                          controller.description.value,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SliderSkills(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: CardAverageAnualSalary(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Kursus berdasarkan materi karir',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const SliderKursusReferensiKarir(),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => state.showRateInterested.isTrue
                      ? const CardRateInterestCareer()
                      : const SizedBox()),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.navigation),
                        Text(
                          'Jelajahi Karir',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() {
                    if (state.loading.isFalse) {
                      if (state.infoData.isNotEmpty) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(top: 1),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.infoData.length,
                          itemBuilder: (context, index) {
                            return CardAccordion(
                              title: state.infoData[index].title,
                              value: state.infoData[index].content,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('Tidak ada informasi tentang karir ini.'),
                        );
                      }
                    } else {
                      return Center(
                        child: SizedBox(
                          height: 1.h,
                          width: 2.w,
                          child: const CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        ),
                      );
                    }
                  }),
                  SizedBox(
                    height: 3.h,
                  ),
                  Obx(() => Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100.w,
                          child: Row(
                            children: [
                              const Icon(Icons.navigation),
                              Text(
                                'Karir yang mirip dengan ${state.name.value}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  const CardCarrerSimmiliar(),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Padding(
                      padding: EdgeInsets.all(10), child: CardHollandCodes()),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ))));
  }
}

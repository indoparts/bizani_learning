import 'package:bizani_learning/app/modules/Explore/controllers/explore_career_info_controller_controller.dart';
import 'package:bizani_learning/app/routes/app_pages.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SliderKursusReferensiKarir extends StatelessWidget {
  const SliderKursusReferensiKarir({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<ExploreCareerInfoControllerController>();
    final PageController controller =
        PageController(initialPage: 1, viewportFraction: 1);
    state.getCareerKursus();
    return SizedBox(
      height: 30.9.h,
      child: Card(
          elevation: 0,
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Obx(() {
                if (state.isLoadingCareerKursus.isFalse) {
                  if (state.careerKursus.isNotEmpty) {
                    return PageView.builder(
                      controller: controller,
                      itemCount: state.careerKursus.length,
                      onPageChanged: (i) {
                        if (i + 1 > state.careerKursus.length) {
                          state.getCareerKursus();
                        }
                      },
                      itemBuilder: (context, index) {
                        return CardKursus(
                          desc: state.careerKursus[index].courses.description,
                          imageData: state.careerKursus[index].courses.coverImg,
                          judul: state.careerKursus[index].courses.title,
                          subjudul: state.careerKursus[index].courses.slug,
                          idKursus: state.careerKursus[index].courses.id,
                        );
                      },
                    );
                  } else {
                    return const EmptyData();
                  }
                } else {
                  return const Loding();
                }
              }))),
    );
  }
}

class Loding extends StatelessWidget {
  const Loding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 1.h,
        width: 2.w,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tidak ada data kursus yang direkomendasikan.',
      ),
    );
  }
}

class CardKursus extends StatelessWidget {
  final int idKursus;
  final String imageData;
  final String judul;
  final String subjudul;
  final String desc;
  const CardKursus(
      {Key? key,
      required this.imageData,
      required this.judul,
      required this.subjudul,
      required this.desc,
      required this.idKursus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  '$baseUrlImg/material-learning&cover_image/$imageData',
                  fit: BoxFit.cover,
                ),
                Container(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 1.h),
                      Text(judul, style: TextStyle(fontSize: 15.sp)),
                      Container(height: 1.h),
                      Text(subjudul,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45)),
                      Container(height: 1.h),
                      Text(
                          desc.length > 50
                              ? '${desc.substring(1, 50)}...'
                              : desc,
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.bold)),
                      Container(height: 1.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(5.h),
                            backgroundColor: primaryColor),
                        onPressed: () =>
                            Get.offAllNamed(Routes.LEARN, arguments: idKursus),
                        child: const Text('MULAI SEKARANG'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bizani_learning/app/components/globalWidget/sliverAppBar.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgetCareerInfo.dart';

// ignore: must_be_immutable
class CreerInfoView extends StatelessWidget {
  CreerInfoView({Key? key}) : super(key: key);
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppbar(
                  TxtTitle: 'Judul Materi',
                  TxtSubitle:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  bgColorTextlight: bgColor,
                  bgColorTextdark: Colors.black,
                  bgImgText: 'assets/images/kursus.png',
                  dividerTxtTitle: false,
                  bgColorAppbar: bgColor,
                )
              ];
            },
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
                    child: Text(
                      'Lanjutkan Membaca',
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: cardSkillREquired(),
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
                  const CardCoursesBased(),
                  SizedBox(
                    height: 2.h,
                  ),
                  const CardRateInterestCareer(),
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
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 1),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Accordion();
                    },
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.navigation),
                        Text(
                          'Karir yang mirip dengan (Karir yang dipilih)',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CardCarrerSimmiliar(),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Kursus berdasarkan keterampilan yang dibutuhkan karir ini',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const CardCoursesBased(),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: CardHollandCodes())
                ],
              ),
            ))));
  }
}

import 'dart:core';
import 'package:recase/recase.dart';

import 'package:bizani_learning/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BasePageView extends GetView {
  const BasePageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cardData = [
      {
        "text": "Kursus Saat ini",
        "icon": "assets/icons/undraw_nakamoto_-2-iv6.svg"
      },
      {
        "text": "Menunggu Sertifikasi",
        "icon": "assets/icons/undraw_certificate_re_yadi.svg"
      },
      {
        "text": "Pengingat Belajar",
        "icon": "assets/icons/undraw_reminder_re_fe15.svg"
      },
      {
        "text": "Sertifikat Saya",
        "icon": "assets/icons/undraw_certification_re_ifll.svg"
      },
    ];
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
        backgroundColor: bgColorscreenPrimary,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.handshake_outlined),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                              StringReCase(controller.username.value).titleCase,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Text(
                        'Selamat Datang',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Icon(Icons.celebration_outlined, size: 60)
                ],
              ),
              SizedBox(height: 5.h),
              GridView.builder(
                shrinkWrap: true,
                itemCount: cardData.length,
                itemBuilder: (ctx, i) {
                  Object icon = (i == 0)
                      ? Icons.rocket
                      : (i == 1)
                          ? Icons.workspace_premium
                          : (i == 2)
                              ? Icons.alarm
                              : Icons.redeem_outlined;
                  var color = (i == 0)
                      ? const Color.fromARGB(255, 0, 223, 162)
                      : (i == 1)
                          ? const Color.fromARGB(255, 0, 121, 255)
                          : (i == 2)
                              ? const Color.fromARGB(255, 255, 0, 96)
                              : Colors.black87;
                  return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              backgroundColor: color,
                              child: Icon(
                                icon as IconData?,
                                size: 50,
                                color: bgColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cardData[i]['text'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ));
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 160,
                ),
              ),
              SizedBox(height: 0.1.h),
              Card(
                elevation: 0,
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'title',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              'subtitle',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton.icon(
                                onPressed: () => {},
                                icon: const Icon(Icons.edit),
                                label: const Text(
                                  'Afiliasi',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 60,
                          child: SvgPicture.asset(
                            "assets/icons/undraw_certificate_re_yadi.svg",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ))));
  }
}

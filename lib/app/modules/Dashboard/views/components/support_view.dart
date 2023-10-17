import 'package:bizani_learning/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:recase/recase.dart';
import 'package:sizer/sizer.dart';

class SupportView extends GetView {
  const SupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Hi, ${controller.username.value.titleCase}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: bgColor),
              ),
            ),
          ),
          SizedBox(height: 0.1.h),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                'tanyakan apa pun kepada kami, atau bagikan umpan balik Anda. Agen kami akan menghubungi Anda kembali pada waktu terdekat.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10.sp,
                    color: bgColor),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            child: Container(
                padding: const EdgeInsets.all(20),
                color: bgColor,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Mulai pembicaraan',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'biasanya membalas dalam beberapa menit',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          height: 9.h,
                          child: Stack(
                            children: [
                              for (var i = 0; i < [1, 2, 3, 4].length; i++)
                                Positioned(
                                  left: (i * (1 - .4) * 80).toDouble(),
                                  top: 0,
                                  child: CircleAvatar(
                                    backgroundColor: primaryColor,
                                    radius: 30,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: bgColor, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.network(
                                        "https://github.com/identicons/guest.png",
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Card(
                          color: const Color.fromARGB(255, 230, 230, 230),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Temuai jawaban dari setiap pertanyaan anda pada kumpulan artikel kami.'),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const Text(
                                  'Cari jawaban kamu sekarang.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    prefixIcon: const Icon(Icons.search),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Cari jawaban kamu disini",
                                    fillColor: Colors.white54,
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ))
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/support');
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.support_agent_outlined,
          size: 20,
        ),
      ),
    );
  }
}

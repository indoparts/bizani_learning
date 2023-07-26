import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/choice_recomendation1_controller.dart';

class ChoiceRecomendationView1 extends GetView<ChoiceRecomendation1Controller> {
  const ChoiceRecomendationView1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87, //change your color here
        ),
        backgroundColor: bgColor,
        elevation: 1,
        title: const Text(
          'Klasifikasi',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 20),
            child: Text(
              '1/5',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Apa tujuan utama anda di Bizani?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 15),
                        Center(
                            child: Text(
                          'Pilih salah satu, dan ini akan membantu kami menemukan kursus yang paling cocok untuk membantu anda mencapai tujuan anda.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Obx(() => ListView.builder(
                          itemCount: controller.goalsData.length,
                          itemBuilder: (context, index) {
                            if (index < controller.goalsData.length) {
                              return Obx(() => InkWell(
                                    onTap: () =>
                                        controller.setGoalsChecked(index),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: controller
                                                        .isCheckedGoals.value ==
                                                    index
                                                ? primaryColor
                                                : Colors.white,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 1,
                                      child: ListTile(
                                        leading: Image(
                                          image: AssetImage(
                                              'assets/images/klasifikasi/1/${index + 1}.png'),
                                        ),
                                        title: Text(
                                          controller.goalsData[index] as String,
                                        ),
                                        trailing:
                                            controller.isCheckedGoals.value ==
                                                    index
                                                ? const Icon(Icons.check,
                                                    color: primaryColor)
                                                : null,
                                      ),
                                    ),
                                  ));
                            } else {
                              if (controller.isLoadingDataGoals.isTrue) {
                                return const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text('Data tidak tersedia!'));
                              }
                            }
                          }))),
                ],
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: Obx(() => ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // Background color
              ),
              onPressed: () => controller.setGoalsAct(),
              icon: const Icon(Icons.navigate_next),
              label: controller.isLoadingPostGoals.isFalse
                  ? const Center(
                      child: Text('Berikutnya: Pilih kategori karir.'),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
            )),
      ),
    );
  }
}

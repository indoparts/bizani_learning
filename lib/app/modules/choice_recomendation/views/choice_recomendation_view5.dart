import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/choice_recomendation5_controller.dart';

class ChoiceRecomendationView5 extends StatelessWidget {
  const ChoiceRecomendationView5({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ChoiceRecomendation5Controller state =
        Get.put(ChoiceRecomendation5Controller());
    state.getData();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
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
              '5/5',
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
                    height: 150,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Tahap karir apa yang sedang anda jalani saat ini?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 15),
                        Center(
                            child: Text(
                          'Pilih salah satu yang paling sesuai dengan apa yang anda minati saat ini.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                  ),
                  Expanded(child: Obx(() {
                    if (state.isLoadingData.isTrue) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    } else {
                      if (state.stagesData.isNotEmpty) {
                        return ListView.builder(
                            itemCount: state.stagesData.length,
                            itemBuilder: (context, index) {
                              // ignore: non_constant_identifier_names
                              var Images =
                                  '$baseUrlImg/klasifikasi5/${state.stagesData[index].img}';
                              return Obx(() => InkWell(
                                    onTap: () => state.setChecked(index),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color:
                                                state.isChecked.value == index
                                                    ? primaryColor
                                                    : Colors.white,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 1,
                                      child: ListTile(
                                        leading: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            minWidth: 44,
                                            minHeight: 44,
                                            maxWidth: 64,
                                            maxHeight: 64,
                                          ),
                                          child: Image.network(Images,
                                              fit: BoxFit.cover),
                                        ),
                                        title: Text(
                                          state.stagesData[index].txt,
                                        ),
                                        trailing: state.isChecked.value == index
                                            ? const Icon(Icons.check,
                                                color: primaryColor)
                                            : null,
                                      ),
                                    ),
                                  ));
                            });
                      } else {
                        return const Center(child: Text('Tidak ada data'));
                      }
                    }
                  })),
                  const SizedBox(height: 90)
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
              onPressed: () => state.setStagesAct(),
              icon: const Icon(Icons.navigate_next),
              label: state.isLoadingPost.isFalse
                  ? const Center(
                      child: Text('Selesai: Lanjutkan diberanda.'),
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

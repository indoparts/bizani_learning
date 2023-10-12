import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/choice_recomendation4_controller.dart';

class ChoiceRecomendationView4 extends StatelessWidget {
  const ChoiceRecomendationView4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ChoiceRecomendation4Controller state =
        Get.put(ChoiceRecomendation4Controller());
    state.getData();
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
              '4/5',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Untuk setiap kategori kursus, beri tahu kami sub-kategori mana yang paling anda minati.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 15),
                        Center(
                            child: Text(
                          'Pilih 3, ini akan membantu kami merekomendasikan kursus yang paling cocok untuk anda.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Obx(() => ListView.builder(
                          itemCount: state.dataKlasifikasi.length,
                          itemBuilder: (context, index) {
                            if (state.dataKlasifikasi.isNotEmpty) {
                              return ListTile(
                                leading: Image(
                                  image: NetworkImage(
                                      '$baseUrlImg/category-learning&icon/${state.dataKlasifikasi[index].icon}'),
                                ),
                                title: Text(state.dataKlasifikasi[index].name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                subtitle: GridView.builder(
                                    itemCount: state.dataKlasifikasi[index]
                                        .subcategory?.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 45,
                                    ),
                                    itemBuilder: (ctx, i) {
                                      var idsubcategory = state
                                          .dataKlasifikasi[index]
                                          .subcategory![i]
                                          .id;
                                      return Obx(() => InkWell(
                                            onTap: () => state.setChecked(state
                                                .dataKlasifikasi[index]
                                                .subcategory![i]
                                                .id),
                                            child: Card(
                                                color: state.cekInArray(
                                                        idsubcategory)
                                                    ? const Color.fromARGB(
                                                        255, 222, 240, 255)
                                                    : Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: state.cekInArray(
                                                              idsubcategory)
                                                          ? primaryColor
                                                          : Colors.white,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Text(
                                                        state
                                                            .dataKlasifikasi[
                                                                index]
                                                            .subcategory![i]
                                                            .name,
                                                        textAlign:
                                                            TextAlign.center))),
                                          ));
                                    }),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.all(15),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                              );
                            }
                          }))),
                  const SizedBox(height: 100)
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
              onPressed: () => state.setSubCategoryCousesAct(),
              icon: const Icon(Icons.navigate_next),
              label: state.loadingForm.isFalse
                  ? const Center(
                      child: Text('Berikutnya: Kategori minat Karir.'),
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

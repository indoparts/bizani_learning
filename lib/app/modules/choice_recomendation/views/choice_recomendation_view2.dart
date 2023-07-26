import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/choice_recomendation2_controller.dart';

class ChoiceRecomendationView2 extends StatelessWidget {
  const ChoiceRecomendationView2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final ChoiceRecomendation2Controller state =
        Get.put(ChoiceRecomendation2Controller());
    state.getData();

    Future onRefresh() async {
      state.refreshData();
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && state.hasMore.value) {
        state.getData();
      }
    }

    scrollController.addListener(onScroll);

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
              '2/5',
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
                          'Kategori karir apa yang paling anda minati?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 15),
                        Center(
                            child: Text(
                          'Pilih 3, ini akan membantu kami merekomendasikan karir yang paling cocok untuk anda dan kursus yang relevan.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: onRefresh,
                      child: Obx(() => ListView.builder(
                          controller: scrollController,
                          itemCount: state.hasMore.value
                              ? state.dataKlasifikasi.length + 1
                              : state.dataKlasifikasi.length,
                          itemBuilder: (context, index) {
                            if (index < state.dataKlasifikasi.length) {
                              return Obx(() => InkWell(
                                    onTap: () => state.setChecked(
                                        state.dataKlasifikasi[index].id),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: state.cekInArray(state
                                                    .dataKlasifikasi[index].id)
                                                ? primaryColor
                                                : Colors.white,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      elevation: 1,
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 20.20,
                                                horizontal: 15.10),
                                        leading: Image(
                                          image: NetworkImage(state
                                              .dataKlasifikasi[index].icon),
                                        ),
                                        title: Text(
                                            state.dataKlasifikasi[index].name),
                                        trailing: state.cekInArray(
                                                state.dataKlasifikasi[index].id)
                                            ? const Icon(Icons.check,
                                                color: primaryColor)
                                            : null,
                                      ),
                                    ),
                                  ));
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
                          })),
                    ),
                  )
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
              onPressed: () => state.setCareerCataegoryAct(),
              icon: const Icon(Icons.navigate_next),
              label: state.loadingForm.isFalse
                  ? const Center(
                      child: Text('Berikutnya: Pilih kategori kursus.'),
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

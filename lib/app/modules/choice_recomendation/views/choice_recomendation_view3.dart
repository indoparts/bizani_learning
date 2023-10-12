import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/choice_recomendation3_controller.dart';

class ChoiceRecomendationView3 extends StatelessWidget {
  const ChoiceRecomendationView3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final ChoiceRecomendation3Controller state =
        Get.put(ChoiceRecomendation3Controller());
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
              '3/5',
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
                            'Kategori kursus apa yang paling Anda minati?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(height: 15),
                          Center(
                              child: Text(
                            'Pilih 3. Ini akan membantu kami merekomendasikan karir yang paling cocok untuk Anda dan kursus yang relevan.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )),
                        ],
                      )),
                  Expanded(
                      child: RefreshIndicator(
                          onRefresh: onRefresh,
                          child: ListView(
                            controller: scrollController,
                            children: [
                              Center(
                                child: Obx(() => GridView.builder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      itemCount: state.hasMore.value
                                          ? state.dataKlasifikasi.length + 1
                                          : state.dataKlasifikasi.length,
                                      physics: const ScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if (index <
                                            state.dataKlasifikasi.length) {
                                          return Obx(() => InkWell(
                                              onTap: () => state.setChecked(
                                                  state.dataKlasifikasi[index]
                                                      .id),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: state.cekInArray(state
                                                              .dataKlasifikasi[
                                                                  index]
                                                              .id)
                                                          ? primaryColor
                                                          : Colors.white,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                elevation: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Stack(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                Image.network(
                                                              '$baseUrlImg/category-learning&icon/${state.dataKlasifikasi[index].icon}',
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 3.h,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              state
                                                                  .dataKlasifikasi[
                                                                      index]
                                                                  .name,
                                                              style: TextStyle(
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )));
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
                                      },
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.0,
                                        crossAxisSpacing: 0.0,
                                        mainAxisSpacing: 5,
                                        mainAxisExtent: 264,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          )))
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
              onPressed: () => state.setCousesCataegoryAct(),
              icon: const Icon(Icons.navigate_next),
              label: state.loadingForm.isFalse
                  ? const Center(
                      child: Text('Berikutnya: Minat Karir.'),
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

import 'package:bizani_learning/app/modules/Explore/controllers/explorecareer_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerDetailView extends StatelessWidget {
  CareerDetailView({Key? key}) : super(key: key);
  final myList = List.generate(20, (index) {
    return {
      'title': 'Lorem Ipsum is simply industry $index',
      'image': 'https://source.unsplash.com/random/800x600?house',
    };
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreCareerController());
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          iconTheme: const IconThemeData(
            color: Colors.black87, //change your color here
          ),
          title: const Text(
            'Kembali',
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.search),
              splashRadius: 20,
            )
          ],
          centerTitle: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              // CarouselSlider.builder(
              //   itemCount: 20,
              //   itemBuilder: (context, index, realIndex) => InkWell(
              //     onTap: () => {},
              //     child: Card(
              //         elevation: 0,
              //         margin: const EdgeInsets.all(10),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10)),
              //         clipBehavior: Clip.antiAliasWithSaveLayer,
              //         child: Container(
              //             decoration: const BoxDecoration(
              //               image: DecorationImage(
              //                 image: AssetImage("assets/images/karir.jpg"),
              //                 fit: BoxFit.cover,
              //                 alignment: Alignment.topCenter,
              //               ),
              //             ),
              //             child: Container(
              //                 color: const Color.fromARGB(209, 58, 58, 58),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(20),
              //                   child: Center(
              //                     child: Text(
              //                       'Lorem Ipsum is simply dummy text of. $index',
              //                       style: TextStyle(
              //                           fontSize: 9.sp,
              //                           fontWeight: FontWeight.bold,
              //                           color: bgColor),
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ),
              //                 )))),
              //   ),
              //   options: CarouselOptions(
              //     height: 15.h,
              //     viewportFraction: 0.4,
              //   ),
              // ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  children: [
                    Text('What is Lorem Ipsum?',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InputDecorator(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.only(
                              top: 5, bottom: 5, right: 10, left: 10)),
                      child: Obx(() => DropdownButtonHideUnderline(
                              child: DropdownButton(
                            items: controller.items
                                .map((e) => DropdownMenuItem<String>(
                                    value: e.toString(),
                                    child: Text(e.toString())))
                                .toList(),
                            hint: Text(controller.selected.value),
                            onChanged: (value) =>
                                controller.setSelected(value!),
                          ))),
                    )
                  ],
                )),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 0.1);
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed('explore-career-info'),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        shadowColor: primaryColor,
                        elevation: 1,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Container(
                              height: 10.h,
                              decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: secondaryColor, width: 2.w)),
                                color: bgColor,
                              ),
                              alignment: Alignment.centerLeft,
                              child: ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image: NetworkImage(
                                          myList[index]['image']!,
                                        ),
                                        fit: BoxFit.cover)),
                                title: Text(
                                  myList[index]['title']!,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ));
  }
}

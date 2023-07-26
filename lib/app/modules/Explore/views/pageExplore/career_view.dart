import 'package:bizani_learning/app/components/views/BottomNavigation.dart';
import 'package:bizani_learning/app/modules/Explore/controllers/explorecareer_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerView extends StatelessWidget {
  const CareerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreCareerController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(26.h), // here the desired height
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/kursus.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Container(
                color: Color.fromARGB(204, 0, 46, 116),
                child: Padding(
                    padding: EdgeInsets.only(top: 70, bottom: 10),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('Petunjuk Karir',
                                style: TextStyle(
                                    color: bgColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 90, right: 90),
                              child: Divider(
                                color: Colors.yellow,
                                height: 3.h,
                                thickness: 5,
                              ),
                            ),
                            Text(
                              'panduan karir Bizani akan membantu Anda menemukan lebih banyak tentang jalur karir Anda dan mengidentifikasi kursus yang tepat yang Anda butuhkan untuk unggul dalam karir Anda.',
                              style: TextStyle(
                                  color: bgColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ))),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Mulailah dengan memilih kategori karir pilihan Anda, atau',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Cari untuk karir",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                          onTap: () => Get.toNamed('explore-career-detail'),
                          child: Card(
                              elevation: 0,
                              margin: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/karir.jpg"),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Container(
                                      color:
                                          const Color.fromARGB(209, 58, 58, 58),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 30),
                                        child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. $i',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: bgColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      )))));
                    }))
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

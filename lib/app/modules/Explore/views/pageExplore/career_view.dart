import 'package:bizani_learning/app/components/globalWidget/sliverAppBar.dart';
import 'package:bizani_learning/app/components/views/BottomNavigation.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerView extends StatelessWidget {
  const CareerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppbar(
                TxtTitle: 'Panduan Karir',
                TxtSubitle:
                    'Panduan karir Bizani membantu anda menemukan lebih banyak tentang jalur karir anda dan mengidentifikasi kursus yang tepat yang anda butuhkan untuk unggul dalam karir anda.',
                bgColorAppbar: bgColor,
                bgColorTextlight: bgColor,
                bgColorTextdark: Colors.black,
                bgImgText: 'assets/images/kursus.png',
                dividerTxtTitle: true,
              )
            ];
          },
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Mulailah dengan memilih kategori karir pilihan Anda, atau',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
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
                ),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10),
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
                    })
              ],
            ),
          ))),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

import 'package:bizani_learning/app/components/views/bottom_navigation.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        'Apa yang ingin kamu pelajari hari ini?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "Cari untuk subjek atau karir",
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      InkWell(
                        onTap: () => Get.toNamed('explore-career'),
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/karir.jpg"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Container(
                                color: const Color.fromARGB(179, 0, 102, 255),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 30),
                                  child: ListTile(
                                    title: Text('Jelajahi karir dengan',
                                        style: TextStyle(color: bgColor)),
                                    subtitle: Text('Dokumentasi Karir',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: bgColor)),
                                    trailing: Icon(Icons.explore,
                                        color: bgColor, size: 60),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.1.h),
                      InkWell(
                        onTap: () => Get.toNamed('explore-courses'),
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/kursus.png"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Container(
                                color: const Color.fromARGB(199, 0, 182, 55),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 30),
                                  child: ListTile(
                                      title: Text(
                                          'Perbaharui keahlian kamu dengan',
                                          style: TextStyle(color: bgColor)),
                                      subtitle: Text('Dokumentasi Kursus',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: bgColor)),
                                      trailing: Icon(Icons.read_more,
                                          color: bgColor, size: 60)),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ))))),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

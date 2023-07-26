import 'package:bizani_learning/app/components/views/BottomNavigation.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'components/all_view.dart';
import 'components/career_view.dart';
import 'components/courses_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black87, //change your color here
          ),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Semua",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.normal)),
              ),
              Tab(
                  child: Text("Karir",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal))),
              Tab(
                  child: Text("Kursus",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal))),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.edit_note_outlined, color: Colors.black),
            onPressed: () => Get.toNamed("/choice-recomendation1"),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () => Get.toNamed("/profile"),
            )
          ],
          title: const Text(
            'Rekomendasi Untukmu',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          backgroundColor: bgColor,
        ),
        body: TabBarView(
          children: [AllView(), CareerView(), CoursesView()],
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

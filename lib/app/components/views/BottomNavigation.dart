import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/PageIndexController.dart';

class BottomNavigation extends StatelessWidget {
  final page = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          backgroundColor: bgColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Untukmu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explorasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: 'Belajar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Sertifikasi',
            ),
          ],
          selectedItemColor: primaryColor,
          selectedFontSize: 13,
          selectedLabelStyle: const TextStyle(
              color: primaryColor, fontWeight: FontWeight.normal, fontSize: 13),
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 13),
          showUnselectedLabels: true,
          currentIndex: page.pageIndex.value,
          onTap: (value) => page.changePage(value),
        ));
  }
}

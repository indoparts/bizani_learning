import 'package:bizani_learning/app/components/views/BottomNavigation.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import 'components/basepage_view.dart';
import 'components/support_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Beranda",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.normal)),
              ),
              Tab(
                  child: Text("Bantuan",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal))),
            ],
          ),
          title: const Text(
            'Ringkasan',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          backgroundColor: bgColor,
        ),
        body: TabBarView(
          children: [
            BasepageView(),
            SupportView(),
          ],
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

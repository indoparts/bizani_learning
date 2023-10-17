import 'package:bizani_learning/app/components/views/bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/certificate_controller.dart';

class CertificateView extends GetView<CertificateController> {
  const CertificateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CertificateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CertificateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

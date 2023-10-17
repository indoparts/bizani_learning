import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesInfoView extends GetView {
  const CoursesInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Courses info'),
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoursesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CoursesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

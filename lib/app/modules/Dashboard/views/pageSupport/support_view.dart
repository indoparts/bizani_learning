import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: bgColor,
        title: const Text(
          'Bantuan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (ctx, i) {
                    return Card(
                        elevation: 0,
                        child: ListTile(
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                  image: NetworkImage(
                                    'https://source.unsplash.com/random/800x600?house',
                                  ),
                                  fit: BoxFit.cover)),
                          title: Text(
                            'Nama Users $i',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Users Divisi $i'),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                  splashRadius: 20,
                                  onPressed: () => Get.toNamed('support-call'),
                                  icon: Icon(Icons.call)),
                              IconButton(
                                  splashRadius: 20,
                                  onPressed: () => Get.toNamed('support-chat'),
                                  icon: Icon(Icons.message))
                            ],
                          ),
                        ));
                  }))),
    );
  }
}

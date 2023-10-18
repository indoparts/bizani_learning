import 'package:bizani_learning/app/modules/home/controllers/home_controller.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeFooter extends StatelessWidget {
  final String txt1;
  final String txtBtn;
  final Function tapBtn;
  HomeFooter({
    super.key,
    required this.txt1,
    required this.txtBtn,
    required this.tapBtn,
  });
  final state = Get.find<HomeController>();

  getCategory() async {
    return state.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Column(
          children: [
            Text(
              txt1,
              style: const TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () => tapBtn,
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
              child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    txtBtn,
                    style: const TextStyle(color: primaryColor),
                  )),
            )
          ],
        )));
  }
}

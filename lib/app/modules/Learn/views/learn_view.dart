import 'package:bizani_learning/app/components/views/BottomNavigation.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/learn_controller.dart';

class LearnView extends GetView<LearnController> {
  const LearnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          if (controller.listOptionLoading.isFalse) {
            return Text(
              controller.selectedText.value,
              style: const TextStyle(color: Colors.black),
            );
          } else {
            return SizedBox(
              height: 2.h,
              width: 2.w,
              child: const CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        }),
        elevation: 1,
        backgroundColor: bgColor,
        leading: Obx(() {
          if (controller.listOptionLoading.isFalse) {
            return PopupMenuButton(
                icon: const Icon(
                  Icons.menu_book_outlined,
                  color: Colors.black,
                ),
                itemBuilder: (context) {
                  return controller.listOption
                      .map((e) => PopupMenuItem(
                            value: e.id,
                            child: Text(e.titlePage),
                          ))
                      .toList();
                },
                onSelected: (value) => controller.setSelected(value));
          } else {
            return SizedBox(
              height: 2.h,
              width: 2.w,
              child: const CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        }),
      ),
      body: SingleChildScrollView(child: Obx(() {
        if (controller.contentLoading.isFalse) {
          return Padding(
            padding: const EdgeInsets.only(
                top: 10, left: 10, right: 10, bottom: 100),
            child: HtmlWidget(controller.content.value),
          );
        } else {
          return const Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          );
        }
      })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 6.h,
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor,
                child: IconButton(
                  iconSize: 20,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => controller.setPagePrevious(),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor,
                child: IconButton(
                  iconSize: 20,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => controller.setPageNext(),
                ),
              ),
            ],
          )),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

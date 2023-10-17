import 'package:bizani_learning/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardKarir extends StatelessWidget {
  final int idSubKategoriKarir;
  final String text;
  const CardKarir(
      {Key? key, required this.text, required this.idSubKategoriKarir})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40.w,
                height: 20.h,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(child: Text(text)),
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
                child: IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.offAllNamed(Routes.explorekaririnfo,
                          arguments: idSubKategoriKarir);
                    }),
              ),
            ],
          ),
        ));
  }
}

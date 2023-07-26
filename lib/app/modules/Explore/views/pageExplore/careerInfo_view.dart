import 'package:bizani_learning/constant.dart';
import 'package:flexi_chip/flexi_chip.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreerInfoView extends StatelessWidget {
  const CreerInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(26.h), // here the desired height
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/kursus.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Container(
                  color: Color.fromARGB(204, 36, 36, 36),
                  child: Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 10),
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('What is Lorem Ipsum?',
                                  style: TextStyle(
                                      color: bgColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting',
                                style: TextStyle(
                                    color: bgColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ))),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting',
                  style:
                      TextStyle(fontSize: 11.sp, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Lanjutkan Membaca',
                  style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        'Keahlian karir yang diperlukan',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FlexiChip(
                          label: const Text('Filled Chip'),
                          avatarText: const Text('FC'),
                          style: FlexiChipStyle.filled(
                            selectedStyle: FlexiChipStyle(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      trailing: TextButton(
                          onPressed: () => {},
                          child: Text(
                            'Lihat Lainya',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}

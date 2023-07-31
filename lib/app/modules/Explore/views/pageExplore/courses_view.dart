import 'package:bizani_learning/app/components/views/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myList = List.generate(9, (index) {
      return {
        'img': 'https://source.unsplash.com/random/800x600?house',
        'txt': 'title $index',
      };
    });
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Kategori',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: myList.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/explore-courses-detail');
                    },
                    child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      myList[i]['img']!,
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                myList[i]['txt']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 160,
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

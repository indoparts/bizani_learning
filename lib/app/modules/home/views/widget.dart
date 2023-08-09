import 'package:bizani_learning/app/components/globalWidget/Text.dart';
import 'package:bizani_learning/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class InfCarousel extends StatelessWidget {
  const InfCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<HomeController>();
    return SizedBox(
      height: 33.h,
      child: InfiniteCarousel.builder(
        itemCount: state.kDemoImages.length,
        itemExtent: 200,
        center: false,
        velocityFactor: 0.5,
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromHeight(100), // Image radius
                        child: Image.network(
                            'https://source.unsplash.com/random/800x600?house',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const TextApps(
                      align: TextAlign.left,
                      size: 10,
                      stylefont: FontWeight.normal,
                      text: 'Lorem impsum dolor sit amet conceptetur',
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.redeem,
                              size: 15,
                            ),
                            TextApps(
                              align: TextAlign.left,
                              size: 10,
                              stylefont: FontWeight.normal,
                              text: 'Sertifikasi',
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 15,
                            ),
                            TextApps(
                              align: TextAlign.left,
                              size: 10,
                              stylefont: FontWeight.normal,
                              text: '4-5 Jam',
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Mulai Sekarang',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class WidgetHomeCarouselInfo extends StatelessWidget {
  final String txt1;
  final String txt2;
  late List datas = [];
  WidgetHomeCarouselInfo({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.datas,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      color: Color.fromARGB(26, 182, 182, 182),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(txt1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              txt2,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2.h),
          CarouselSlider(
            options: CarouselOptions(height: 25.h),
            items: datas.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text('Title $i'),
                                trailing: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.navigate_next)),
                              ))),
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text('Title Karir $i'),
                                trailing: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.navigate_next)),
                              )))
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class WidgetHomeFooter extends StatelessWidget {
  final String txt1;
  final String txtBtn;
  final Function tapBtn;
  const WidgetHomeFooter({
    super.key,
    required this.txt1,
    required this.txtBtn,
    required this.tapBtn,
  });

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

class WidgetHomeCousesCategory extends StatelessWidget {
  WidgetHomeCousesCategory({Key? key}) : super(key: key);
  final myList = List.generate(7, (index) {
    return {
      'img': 'https://source.unsplash.com/random/800x600?house',
      'txt': 'title $index',
    };
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        color: bgColorscreenPrimary,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Eksplorasi kategori kursus lainya',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 9,
                itemBuilder: (ctx, i) {
                  return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://source.unsplash.com/random/800x600?house',
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Lorem impsum dolor sit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ));
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 160,
                ),
              ),
            ],
          )),
        ));
  }
}

class WidgetHomeMore extends StatelessWidget {
  final String txt;
  final Function tapMOre;
  final String txtMore;
  const WidgetHomeMore({
    super.key,
    required this.txt,
    required this.tapMOre,
    required this.txtMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
          TextButton(
              onPressed: () => tapMOre,
              child: Text(
                txtMore,
                style: const TextStyle(color: primaryColor),
              ))
        ],
      ),
    );
  }
}

class WidgetHomeSurvel extends StatelessWidget {
  final String txt;
  final Function tapLIke;
  final Function tapUnlIke;
  const WidgetHomeSurvel({
    super.key,
    required this.txt,
    required this.tapLIke,
    required this.tapUnlIke,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
                child: IconButton(
                  iconSize: 20,
                  icon: const Icon(
                    Icons.thumb_up,
                    color: Colors.black,
                  ),
                  onPressed: () => tapLIke,
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
                child: IconButton(
                  iconSize: 20,
                  icon: const Icon(
                    Icons.thumb_down,
                    color: Colors.black,
                  ),
                  onPressed: () => tapUnlIke,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

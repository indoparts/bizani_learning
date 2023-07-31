import 'package:bizani_learning/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flexi_chip/flexi_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class cardSkillREquired extends StatelessWidget {
  const cardSkillREquired({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Kemampuan yang dibutuhkan pada karir ini',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            CarouselSlider(
              items: List.generate(
                10,
                (index) => FlexiChip(
                  label: Text(
                    'Mixed $index',
                    style: TextStyle(color: primaryColor, fontSize: 9.sp),
                    textAlign: TextAlign.center,
                  ),
                  style: FlexiChipStyle.filled(
                      color: Color.fromARGB(6, 217, 235, 255)),
                ),
              ),
              options: CarouselOptions(
                viewportFraction: 0.2,
                height: 3.h,
              ),
            ),
            TextButton(onPressed: () => {}, child: Text('Lihat lainya'))
          ],
        ),
      ),
    );
  }
}

class CardAverageAnualSalary extends StatelessWidget {
  const CardAverageAnualSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Text(
                  'Gaji tahunan rata-rata',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Icon(Icons.info_rounded)
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Rp. 12Jt',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      height: 5.h,
                      width: 5.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                          image: AssetImage('assets/images/indoflag.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Rp. 11Jt',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      height: 5.h,
                      width: 5.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                          image: AssetImage('assets/images/flag_malaysia.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardCoursesBased extends StatelessWidget {
  const CardCoursesBased({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: CarouselSlider(
              items: List.generate(
                  20,
                  (index) => Card(
                        elevation: 1,
                        color: bgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlexiChip(
                                label: const Text('Sarjana'),
                                style: FlexiChipStyle.filled(
                                  selectedStyle: FlexiChipStyle.outlined(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 17.h,
                                        width: 29.w,
                                        child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. $index',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.sp),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.account_balance),
                                          Text(
                                            'NPTEL $index',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 9.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'https://source.unsplash.com/random/800x600?house',
                                          height: 15.h,
                                          width: 35.w,
                                        ),
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: primaryColor),
                                          onPressed: () => {},
                                          child: Text('Mulai Sekarang'))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
              options: CarouselOptions(
                height: 31.h,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
              ))),
    );
  }
}

class CardRateInterestCareer extends StatelessWidget {
  const CardRateInterestCareer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 0.1.w, color: const Color.fromARGB(255, 255, 232, 24)),
            bottom: BorderSide(
                width: 0.1.w, color: const Color.fromARGB(255, 255, 232, 24)),
          ),
          color: const Color.fromARGB(255, 255, 254, 246),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Nilai minat Anda untuk mengejar karir ini untuk mendapatkan rekomendasi karir & sepupu yang lebih baik',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
              )),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      5,
                      (index) => InkWell(
                            onTap: () => {},
                            child: ClipRRect(
                              child: SvgPicture.asset(
                                'assets/icons/${index + 1}.svg',
                                height: 5.h,
                                width: 5.w,
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Accordion extends StatelessWidget {
  const Accordion({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        backgroundColor: bgColor,
        title: Text("Nilai minat Anda untuk mengejar karir ini untuk "),
        children: [
          Container(
            color: bgColor,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
                "Nilai minat Anda untuk mengejar karir ini untuk mendapatkan rekomendasi karir & sepupu yang lebih baik"),
          )
        ],
      ),
    );
  }
}

class CardCarrerSimmiliar extends StatelessWidget {
  const CardCarrerSimmiliar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color.fromARGB(255, 244, 247, 252),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              options: CarouselOptions(
                height: 23.h,
                viewportFraction: 0.8,
              ),
              items: List.generate(
                  10,
                  (index) => Column(
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://picsum.photos/250?image=9',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting $index',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              )),
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://picsum.photos/250?image=9',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting $index',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              )),
                        ],
                      ))),
        ],
      ),
    );
  }
}

class CardHollandCodes extends StatelessWidget {
  CardHollandCodes({super.key});

  final List<Map> listdata = [
    {'initial': 'A', 'name': 'Text numbers A'},
    {'initial': 'B', 'name': 'Text numbers B'},
    {'initial': 'C', 'name': 'Text numbers C'},
    {'initial': 'D', 'name': 'Text numbers D'},
    {'initial': 'E', 'name': 'Text numbers E'},
    {'initial': 'F', 'name': 'Text numbers F'},
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Orang-orang dalam karir ini umumnya memiliki jalur berikut.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Table(
                children: List.generate(
                    3,
                    (index) => TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: primaryColor,
                              child: Text(listdata[index]['initial']),
                            ),
                          ),
                          Text(listdata[index]['name']),
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Text(listdata[index + 3]['initial']),
                          ),
                          Text(listdata[index + 3]['name'])
                        ]))),
          ],
        ),
      ),
    );
  }
}

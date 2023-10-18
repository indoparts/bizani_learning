import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';

class GridKategoriKursus extends StatelessWidget {
  GridKategoriKursus({Key? key}) : super(key: key);
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
                                padding: const EdgeInsets.all(10),
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

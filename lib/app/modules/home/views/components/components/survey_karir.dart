import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class SurveyKarir extends StatelessWidget {
  final int idKategoriKarir;
  final int urutan;
  const SurveyKarir(
      {Key? key, required this.idKategoriKarir, required this.urutan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Apakah rekomendasi karir ini relevan?',
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
                  onPressed: () =>
                      state.postSurveyKarir('y', idKategoriKarir, urutan),
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
                  onPressed: () =>
                      state.postSurveyKarir('n', idKategoriKarir, urutan),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

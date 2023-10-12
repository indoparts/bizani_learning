import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../providers/KursusMateriSliderClientModelTwo.dart';
import '../../providers/home_provider.dart';

class Kursus2Controller extends GetxController {
  HomeProvider provider = Get.put(HomeProvider());

  var CarouselclientKursus = <KursusMateriSliderClientModelTwo>[].obs;
  var isLoadingCarouselKursus = false.obs;
  var CarouselclientKursusCurrentPage = 1.obs;
  var CarouselclientKursusLastPage = 0.obs;

  void getSliderKursus(int idCategory) async {
    try {
      isLoadingCarouselKursus(true);
      final response = await provider.getKursusMaterial(
          idCategory, CarouselclientKursusCurrentPage.value);
      List<KursusMateriSliderClientModelTwo> fetch =
          kursusMateriSliderClientModelTwoFromJson(
              jsonEncode(response['data']));
      CarouselclientKursus.addAllIf(fetch.isNotEmpty, fetch);
      CarouselclientKursusLastPage(response['meta']['last_page']);
      CarouselclientKursusCurrentPage++;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingCarouselKursus(false);
    }
  }
}

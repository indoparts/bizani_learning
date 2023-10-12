import 'dart:convert';

import 'package:bizani_learning/app/components/controllers/PageIndexController.dart';
import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/OptionMaterialModel.dart';
import '../providers/learn_providers.dart';

class LearnController extends GetxController {
  final page = Get.find<PageIndexController>();
  LearnProviders provider = Get.put(LearnProviders());
  dynamic id = Get.arguments;

  var judul_materi = ''.obs;
  var listOption = <OptionMaterialModel>[];
  var listOptionLoading = false.obs;
  var content = ''.obs;
  var contentPage = 1.obs;
  var contentLastPage = 0.obs;
  var contentFirstPage = 0.obs;
  var contentLoading = false.obs;
  final selected = 0.obs;
  final selectedText = ''.obs;
  @override
  void onInit() {
    page.changePage(2);
    if (id != null) {
      getLearnContent(id);
    }
    super.onInit();
  }

  void getLearnContent(id) async {
    listOptionLoading(true);
    try {
      print(id);
      final request = await provider.getMateri(id);
      List<OptionMaterialModel> fetch = optionMaterialModelFromJson(
          jsonEncode(request['data']['contenttitle']));
      listOption.addAllIf(fetch.isNotEmpty, fetch);
      judul_materi(request['data']['find']['title']);
      final index = listOption.first;
      setSelected(index.id);
    } catch (e) {
      print(e.toString());
    } finally {
      listOptionLoading(false);
    }
  }

  void getContent(id) async {
    contentLoading(true);
    try {
      final request = await provider.getContent(id);
      var parse = request['data'];
      content(parse['content_page']);
      contentPage(parse['page']);
      contentLastPage(parse['page'] + 1);
      contentFirstPage(parse['page'] + 1);
    } catch (e) {
      print(e.toString());
    } finally {
      contentLoading(false);
    }
  }

  void getContentWithPage(int id, int page) async {
    contentLoading(true);
    try {
      final request = await provider.getContentWithPage(id, page);
      var parse = request['data'];
      content(parse['data'][0]['content_page']);
      contentPage(parse['meta']['current_page']);
      contentLastPage(parse['meta']['last_page']);
      contentFirstPage(parse['meta']['first_page']);
    } catch (e) {
      print(e.toString());
    } finally {
      contentLoading(false);
    }
  }

  void setSelected(int value) {
    selected(value);
    final index = listOption.lastIndexWhere((e) => e.id == value);
    selectedText(listOption[index].titlePage);
    getContent(value);
  }

  void setPageNext() async {
    if (contentPage.value <= contentLastPage.value) {
      contentPage.value++;
      getContentWithPage(selected.value, contentPage.value);
    } else {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: dangerColor,
          title: 'Perhatikan!',
          message:
              'Saat ini anda sudah berada dihalaman ${contentPage.value} yakni halaman terakhir dari materi.',
          icon: const Icon(
            Icons.info,
            color: bgColor,
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void setPagePrevious() async {
    if (contentPage.value >= contentFirstPage.value) {
      contentPage.value--;
      getContentWithPage(selected.value, contentPage.value);
    } else {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: dangerColor,
          title: 'Perhatikan!',
          message:
              'Saat ini anda sudah berada dihalaman ${contentPage.value} yakni halaman awal dari materi.',
          icon: const Icon(
            Icons.info,
            color: bgColor,
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

import 'package:get/get.dart';

class ExploreCareerController extends GetxController {
  List items = ['Alfabet (Desc)', 'Alfabet (Asc)', 'Gaji (Desc)', 'Gaji (Asc)'];
  final selected = "Filter dan sesuaikan".obs;

  void setSelected(String value) {
    selected.value = value;
  }
}

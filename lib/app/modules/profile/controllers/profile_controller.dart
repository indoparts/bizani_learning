import 'package:bizani_learning/app/modules/login/controllers/login_controller.dart';
import 'package:bizani_learning/app/modules/login/providers/login_provider.dart';
import 'package:get/get.dart';
import 'package:namefully/namefully.dart';

class ProfileController extends GetxController {
  final loginController = Get.put(LoginController());
  final loginProvider = Get.put(LoginProvider());
  var id = 0.obs;
  var frontname = ''.obs;
  var midname = ''.obs;
  var backname = ''.obs;
  var fullname = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var initial = ''.obs;
  void getprofile() async {
    try {
      final res = await loginProvider.getProfile();
      if (res.statusCode == 200) {
        var parse = res.body['data'];
        id(parse['id']);
        frontname(parse['frontname']);
        midname(parse['midname']);
        backname(parse['backname']);
        fullname(parse['fullname']);
        username(parse['username']);
        email(parse['email']);

        String x = fullname.value;
        var name1 = Namefully(x);
        initial(name1.initials(withMid: true)[0] +
            name1.initials(withMid: true)[1] +
            name1.initials(withMid: true)[2]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() async {
    loginController.logout();
  }
}

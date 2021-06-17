import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';

import '../profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(email: Get.find<AuthController>().email.text));
  }
}

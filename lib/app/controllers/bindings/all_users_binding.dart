import 'package:get/get.dart';

import '../all_users_controller.dart';

class AllUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersController>(() => AllUsersController());
  }
}

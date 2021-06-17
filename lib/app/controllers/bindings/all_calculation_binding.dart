import 'package:get/get.dart';

import '../all_calculations_controller.dart';

class AllCalculationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCalculationsController>(() => AllCalculationsController());
  }
}

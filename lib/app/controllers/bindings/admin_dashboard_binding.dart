import 'package:get/get.dart';

import '../admin_dashboard_controller.dart';

class AdminDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(() => AdminDashboardController());
  }
}

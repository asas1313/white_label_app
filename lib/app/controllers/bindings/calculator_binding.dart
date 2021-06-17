import 'package:get/get.dart';

import '../calculator_controller.dart';

class CalculatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }
}

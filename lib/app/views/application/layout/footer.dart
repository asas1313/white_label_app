import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/app_controller.dart';

class Footer extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SelectableText('Ver.${controller.appVersion.value}')],
          )),
    );
  }
}

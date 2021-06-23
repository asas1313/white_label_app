import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/views/page/widgets/footer/footer.dart';
import '/app/controllers/app_controller.dart';

class FooterApp extends GetWidget<AppController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Footer(),
              SelectableText('Ver.${controller.appVersion.value}'),
            ],
          )),
    );
  }
}

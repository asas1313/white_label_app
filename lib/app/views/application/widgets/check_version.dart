import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/app_controller.dart';

class CheckVersion extends GetWidget<AppController> {
  final Widget child;

  CheckVersion({required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.dbVersion == controller.appVersion
          ? child
          : Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text(
                  'Refresh the application with Ctrl+F5 (or CMD+F5 on Mac).',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ),
    );
  }
}

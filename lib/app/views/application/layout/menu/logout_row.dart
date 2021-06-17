import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/controllers/user_controller.dart';
import '/app/routes/app_routing.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoutRow extends GetWidget<UserController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(children: [
        Obx(() => SizedBox(
              width: Get.width / 5,
              child: Text(
                controller.email.isNotEmpty
                    ? controller.displayName.value
                    : 'Not connected!',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            )),
        SizedBox(
          width: 5,
          height: 50,
        ),
        Obx(() => Container(
              child: controller.role.value == 'admin'
                  ? Row(children: [
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            Get.toNamed(Routes.ADMIN_DASHBOARD);
                          },
                          child: Text(
                            'Admin pannel',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 50,
                      ),
                    ])
                  : Container(width: 0, height: 0),
            )),
        SizedBox(
          height: 20,
          width: 65,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Get.find<AuthController>().logout();
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 20,
          width: 95,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () => Get.toNamed(Routes.PROFILE),
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}

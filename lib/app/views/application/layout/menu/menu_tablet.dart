import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaces/spaces.dart';
import '../../styles/text_styles.dart';
import '/app/controllers/auth_controller.dart';
import '/app/routes/app_routing.dart';
import '/app/views/application/layout/menu/login_row.dart';
import '/app/views/application/layout/menu/logout_row.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MenuTablet extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() => Container(
                        padding: EdgeInsets.only(right: 25),
                        child:
                            controller.logedIn.value ? LogoutRow() : LoginRow(),
                      ))
                ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.toNamed(Routes.HOME),
                  child: Icon(Icons.ac_unit),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: Get.width / 2,
                      padding: EdgeInsets.only(right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Space.small(),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.APP),
                            child: Text(
                              'Application home',
                              style: textStyleMenu,
                            ),
                          ),
                          Space.small(),
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.CALCULATOR),
                            child: Text(
                              'Calculator',
                              style: textStyleMenu,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

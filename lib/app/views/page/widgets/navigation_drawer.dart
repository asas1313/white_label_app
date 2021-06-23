import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaces/spaces.dart';
import '/app/routes/app_routing.dart';

import 'menu/menu_item.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Container(
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.75),
            padding: spacing.insets.all.big,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                MenuItem(
                  child: Text('Home'),
                  onPressed: () => Get.toNamed(Routes.HOME),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('About'),
                  onPressed: () => Get.toNamed(Routes.ABOUT),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('Services'),
                  onPressed: () => Get.toNamed(Routes.SERVICES),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('Projects'),
                  onPressed: () => Get.toNamed(Routes.PROJECTS),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('Contact'),
                  onPressed: () => Get.toNamed(Routes.CONTACTS),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('Clients'),
                  onPressed: () => Get.toNamed(Routes.CLIENTS),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('FAQ'),
                  onPressed: () => Get.toNamed(Routes.FAQ),
                ),
                SizedBox(height: 15),
                MenuItem(
                  child: Text('Application'),
                  onPressed: () => Get.toNamed(Routes.APP),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

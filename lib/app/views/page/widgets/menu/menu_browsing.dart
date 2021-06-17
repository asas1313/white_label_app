import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaces/spaces.dart';
import 'package:wgite_label_app/app/routes/app_routing.dart';

import 'menu_item.dart';

class MenuBrowsing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          Space.normal(),
          MenuItem(
            child: Text('Home'),
            onPressed: () => Get.toNamed(Routes.HOME),
          ),
          Space.small(),
          MenuItem(
            child: Text('About'),
            onPressed: () => Get.toNamed(Routes.ABOUT),
          ),
          Space.small(),
          MenuItem(
            child: Text('Services'),
            onPressed: () => Get.toNamed(Routes.SERVICES),
          ),
          Space.small(),
          MenuItem(
            child: Text('Projects'),
            onPressed: () => Get.toNamed(Routes.PROJECTS),
          ),
          Space.small(),
          MenuItem(
            child: Text('Contact'),
            onPressed: () => Get.toNamed(Routes.CONTACTS),
          ),
          Space.small(),
          MenuItem(
            child: Text('Clients'),
            onPressed: () => Get.toNamed(Routes.CLIENTS),
          ),
          Space.small(),
          MenuItem(
            child: Text('FAQ'),
            onPressed: () => Get.toNamed(Routes.FAQ),
          ),
          Space.small(),
          MenuItem(
            child: Text('Application'),
            onPressed: () => Get.toNamed(Routes.APP),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/routes/app_routing.dart';

class MenuMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.HOME),
                      child: Icon(Icons.ac_unit),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

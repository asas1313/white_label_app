import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wgite_label_app/app/controllers/auth_controller.dart';
import 'package:wgite_label_app/app/views/application/widgets/authenticated.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Get.snackbar('title', 'message');
          },
          child: Authenticated(
              child: ElevatedButton(
            onPressed: () {
              Get.find<AuthController>().logout();
            },
            child: Text('Logout'),
          )),
        ),
      ),
    );
  }
}

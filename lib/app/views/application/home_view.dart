import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/views/application/widgets/authenticated.dart';

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

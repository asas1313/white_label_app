import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/routes/app_routing.dart';

class LoginRow extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: Get.width / 8,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          controller: controller.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
      SizedBox(width: 5),
      SizedBox(
        width: Get.width / 8,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          controller: controller.password,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 12, color: Colors.white),
          ),
          onFieldSubmitted: (value) => controller.login(goToHome: true),
        ),
      ),
      SizedBox(width: 5),
      SizedBox(
        height: 20,
        width: 50,
        child: ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: Text(
              'Login',
              style: TextStyle(fontSize: 12, color: Colors.white),
            )),
      ),
      SizedBox(width: 5),
      TextButton(
          onPressed: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 12, color: Colors.white),
          )),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/routes/app_routing.dart';

class LoginColumn extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: controller.email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        width: Get.width,
        child: TextFormField(
          controller: controller.password,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: InputBorder.none,
            labelStyle: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onFieldSubmitted: (value) => controller.login(goToHome: true),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        height: 30,
        width: 80,
        child: ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.black),
            )),
      ),
      SizedBox(height: 5),
      TextButton(
          onPressed: () {
            Get.toNamed(Routes.SIGNUP);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 20),
          )),
      SizedBox(height: 25),
    ]);
  }
}

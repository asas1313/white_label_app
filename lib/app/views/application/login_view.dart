import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';
import '/app/routes/app_routing.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'styles/text_styles.dart';

class LoginView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment = TextStyles.getTextAlignment(sizingInformation);
      var titleSize = TextStyles.getTitleSize(sizingInformation);
      return Material(
        child: Center(
          child: Container(
              width: 600,
              height: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          height: 1.1,
                          fontSize: titleSize,
                          letterSpacing: 3),
                      textAlign: textAlignment,
                    ),
                    Divider(),
                    TextFormField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                      ),
                    ),
                    TextFormField(
                      controller: controller.password,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      onFieldSubmitted: (value) =>
                          controller.login(goToHome: true),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      child: Text('Login'),
                      onPressed: () => controller.login(goToHome: true),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Text('Sign Up'),
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () {
                            controller.resetPassword();
                          },
                          child: Text('Reset password'),
                        ),
                      ],
                    ),
                  ])),
        ),
      );
    });
  }
}
